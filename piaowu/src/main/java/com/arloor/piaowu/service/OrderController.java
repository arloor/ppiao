package com.arloor.piaowu.service;


import com.arloor.piaowu.dao.MembersDao;
import com.arloor.piaowu.dao.OrderDao;
import com.arloor.piaowu.dao.PlayDao;
import com.arloor.piaowu.domain.Memberorder;
import com.arloor.piaowu.domain.Play;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderController {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private PlayDao playDao;

   @RequestMapping("/showplaystocheck")
    public List<Play> showplaystocheck(
            @RequestParam String vname
   ){

       Calendar now=Calendar.getInstance();
       now.add(Calendar.HOUR,2);
       int year=now.get(Calendar.YEAR);
       int month=now.get(Calendar.MONTH)+1;
       int date=now.get(Calendar.DATE);
       int hour=now.get(Calendar.HOUR_OF_DAY);
       int minute=now.get(Calendar.MINUTE);
       String pdate=String.format("\"%4d-%2d-%2d\"",year,month,date).replace(" ","0");
       String ptime=String.format("\"%2d:%2d\"",hour,minute).replace(" ","0");
       List<Play> plays=playDao.selectPlaysbyVenuesEarlierThan(vname,pdate,ptime);
       return plays;
   }

   @RequestMapping("/check")
    public String check(
            @RequestParam String pname,
            @RequestParam String uname,
            @RequestParam String seats
   ){
    String selectsql="SELECT count(*) FROM\n" +
            "  (SELECT * FROM 至暗时刻_seats WHERE uname=\""+uname+"\" AND status=\"taken\") seats\n" +
            "WHERE";
    String[] seatEntrys=seats.split(",");
       for (String seatentry:seatEntrys
            ) {
           String[] sinfo=seatentry.split("-");
           selectsql+="  seats.stype=\""+sinfo[0]+"\" AND seats.row="+sinfo[1]+" AND seats.col="+sinfo[2]+" OR\n";
       }
       selectsql=selectsql.substring(0,selectsql.length()-4)+";";
       int count=orderDao.countSeats(selectsql);
       if(count!=seatEntrys.length){
           return "输入的座位信息不正确";
       }

       String updateSeatsSql="UPDATE "+pname+"_seats SET  status=\"checked\"\n" +
               "WHERE ";
       for (String seatentry:seatEntrys
               ) {
           String[] sinfo=seatentry.split("-");
           updateSeatsSql+="  stype=\""+sinfo[0]+"\" AND row="+sinfo[1]+" AND col="+sinfo[2]+" OR\n";
       }
       updateSeatsSql=updateSeatsSql.substring(0,updateSeatsSql.length()-4)+";";
       orderDao.checkSeats(updateSeatsSql);

       if(!uname.equals("guestorder")){
           Memberorder memberorder=orderDao.getOrderByUnamePname(uname,pname);
           memberorder.setState("已完成");
           orderDao.updateOrder(memberorder);
       }
       return "检票成功";
   }
}
