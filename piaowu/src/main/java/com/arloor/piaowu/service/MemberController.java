package com.arloor.piaowu.service;

import com.arloor.piaowu.dao.MembersDao;
import com.arloor.piaowu.dao.OrderDao;
import com.arloor.piaowu.dao.PlayDao;
import com.arloor.piaowu.domain.Member;
import com.arloor.piaowu.domain.Memberticket;
import com.arloor.piaowu.domain.Play;
import com.arloor.piaowu.domain.Seat;
import com.arloor.piaowu.model.PinInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/members")
public class MemberController {
    @Autowired
    private MembersDao membersDao;
    @Autowired
    private PlayDao playDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    JavaMailSender mailSender;


    @RequestMapping("/mail/pin/{uname}")
    public boolean updateAndSendPinByUname(@PathVariable String uname,@RequestParam(defaultValue = "null") String email){
        int pin=0;
        for (int i=0;i<6;i++) {
            pin+=Math.pow(10,i)*Math.random();
        }
        Member member=membersDao.searchByUname(uname);
        if(member==null){
            membersDao.insertEmptyMember(uname);
        }
        membersDao.updatePinByUname(uname,pin);
        member=membersDao.searchByUname(uname);
        int pinIndex= (int) member.getPinindex();
        PinInfo pinInfo=new PinInfo();
        pinInfo.setPin(Integer.parseInt(member.getPin()));
        pinInfo.setPinIndex(pinIndex);

        SimpleMailMessage msg=new SimpleMailMessage();
        msg.setFrom("18762832143@163.com");
        msg.setSubject("飘麦网——邮箱验证码");
        if(member.getEmail()!=null){
            msg.setTo(member.getEmail());
        }else if(!email.equals("null")) {
            msg.setTo(email);
        }else {
            return false;
        }
        msg.setText("尊敬的"+member.getUname()+"用户您好：您序号"+member.getPinindex()+"的验证码为"+member.getPin());
        try{
            this.mailSender.send(msg);
        }
        catch (MailException ex) {
            // simply log it and go on...
            System.err.println(ex.getMessage());
            return false;
        }
        return true;
    }

    @RequestMapping("/signup")
    public boolean newMember(@RequestParam String uname,
                             @RequestParam String email,
                             @RequestParam String passwd,
                             @RequestParam String paykey,
                             @RequestParam String pin,
                             @RequestParam String pinindex){
        Member member=membersDao.searchByUname(uname);
        //uname对应的验证码和验证码序号正确，则更新相关信息。
        if(member.getPin().equals(pin)&&member.getPinindex()==Integer.parseInt(pinindex)){
            membersDao.updateSignMemberByUname(uname,email,passwd,paykey);
            return true;
        }else return false;
    }

    @RequestMapping("/listplayslater")
    public List<Play> listPlays(){
        Calendar now=Calendar.getInstance();
        //只显示30分钟后的
        now.add(Calendar.MINUTE,30);
        int year=now.get(Calendar.YEAR);
        int month=now.get(Calendar.MONTH)+1;
        int date=now.get(Calendar.DATE);
        int hour=now.get(Calendar.HOUR_OF_DAY);
        int minute=now.get(Calendar.MINUTE);
        String pdate=String.format("\"%4d-%2d-%2d\"",year,month,date).replace(" ","0");
        String ptime=String.format("\"%2d:%2d\"",hour,minute).replace(" ","0");
        return playDao.listPlaysAfterSomeTime(pdate,ptime);
    }

    @RequestMapping("/viewplayinfo")
    public List<Play> viewPlayInfo(@RequestParam String pname){
        return playDao.viewPlayInfo(pname);
    }

    @RequestMapping("/showtickets")
    public  List<Memberticket> showtickets(@RequestParam String uname){
        return membersDao.getMemberTicket(uname);
    }

    @RequestMapping("/leftseats")
    public List<Seat> leftSeats(@RequestParam String pname ,@RequestParam String stype){
        pname=pname+"_seats";
        return playDao.leftSeats(pname,stype);
    }

    @RequestMapping("/order")
    public String order(
            @RequestParam String uname,
            @RequestParam String paykey,
            @RequestParam String pname,
            @RequestParam String stype,
            @RequestParam String seatnum,
            @RequestParam String pickseat,
            @RequestParam String charge,
            @RequestParam String pay,
            @RequestParam String ticketname,
            @RequestParam String seats
    ){
        //首先校验uname和paykey，查看是否正确，不正确返回：支付密码错误，下单失败
        //然后检验uname和balance，查看余额是否足够，不足够则返回：余额不足，支付失败，请在订单管理中支付。
        //余额足够，则，新增用户订单，根据seats和seatnum在seats表中更新状态。
        //并更新用户的balance 积分  优惠券等
        //邮件通知用户下单成功
        String result="结果占位";
        if(membersDao.checkMemberPaykey(uname,paykey)!=1){
            result= "支付密码错误，下单失败";
            return result;
        }else{
            //插入订单表
            Member member=membersDao.searchByUname(uname);
            int seatarranged=0;
            if(pickseat.equals("选座")&&seats.length()>0){
                seatarranged=1;
            }
            String status="未支付";
            if(member.getBalance()<Integer.parseInt(pay)){
                status="未支付";
                result= "余额不足，支付失败，请在订单管理中支付，超时将取消订单";
            }else{
                status="已支付";
                result="下单成功，请在邮箱中查看订单详情。";
                //更新积分等情况
                membersDao.payAndGetJifen(uname,pay);
                //发送邮件
                SimpleMailMessage msg=new SimpleMailMessage();
                msg.setFrom("18762832143@163.com");
                msg.setSubject("飘麦网——演出详情通知");
                msg.setTo(member.getEmail());
                Play play=playDao.viewPlayInfo(pname).get(0);
                msg.setText("尊敬的"+member.getUname()+"用户您好：您的订单详情如下："+play.getPname()+" "+play.getVname()+" "+play.getHname()+" "
                        +play.getPdate()+" "+play.getPtime()+" "+stype+" "+seats);
                try{
                    this.mailSender.send(msg);
                }
                catch (MailException ex) {
                    // simply log it and go on...
                    System.err.println(ex.getMessage());
                }
            }
            orderDao.insertOrder(uname,pname,status,seatnum,seatarranged,charge,pay,ticketname);

            //更新座位表
            if(seatarranged==1){
                String[] seatEntris=seats.split(",");
                String updateSeatsSql="";
                List<String> whereClauses=new ArrayList<>();
                for (int i=0;i<Integer.parseInt(seatnum)&&i<seatEntris.length;i++) {
                    whereClauses.add(" stype= \""+stype+"\" AND row="+seatEntris[i].split("-")[0]+" AND col="+seatEntris[i].split("-")[1]+" ");
                }
                String whereParam=whereClauses.get(0);
                for (int i = 1; i <whereClauses.size() ; i++) {
                    whereParam+=" OR "+whereClauses.get(i);
                }

                updateSeatsSql="UPDATE 至暗时刻_seats SET uname=\""+uname+"\",status=\"taken\" WHERE "+ whereParam+";";
                orderDao.updateBySql(updateSeatsSql);
            }//更新座位表结束

            //使用优惠券
            membersDao.useTicket(uname,ticketname);

        }

        return result;
    }
}
