package com.arloor.piaowu.service;

import com.arloor.piaowu.dao.MembersDao;
import com.arloor.piaowu.domain.Member;
import com.arloor.piaowu.model.PinInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;

@RestController
public class MemberController {
    @Autowired
    private MembersDao membersDao;
    @Autowired
    JavaMailSender mailSender;
    @RequestMapping("/api/a")
    public Member search(String uname){
        Member member=membersDao.searchByUname("arloor");
        SimpleMailMessage msg=new SimpleMailMessage();
        msg.setFrom("18762832143@163.com");
        msg.setSubject("测试发送邮件——");
        msg.setTo(member.getEmail());
        msg.setText(member.getUname()+" "+member.getEmail());
        try{
            this.mailSender.send(msg);
        }
        catch (MailException ex) {
            // simply log it and go on...
            System.err.println(ex.getMessage());
        }
        return membersDao.searchByUname("arloor");
    }
    @RequestMapping("/a")
    public Member searcha(String uname){
        return membersDao.searchByUname("arloor");
    }

    @RequestMapping("/api/members/mail/pin/{uname}")
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

    @RequestMapping("/api/members/signup")
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
}
