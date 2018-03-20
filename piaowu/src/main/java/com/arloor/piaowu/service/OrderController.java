package com.arloor.piaowu.service;


import com.arloor.piaowu.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderController {
    @Autowired
    private OrderDao orderDao;

    @RequestMapping("/guestorder")
    public boolean guestorder(
            @RequestParam String pname,
            @RequestParam String stype,
            @RequestParam String seatnum,
            @RequestParam String pay,
            @RequestParam String seats
    ){
        orderDao.insertGuestOrder(pname,stype,seatnum,pay);
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

        updateSeatsSql="UPDATE "+pname+"_seats SET uname=\"guestorder\",status=\"taken\" WHERE "+ whereParam+";";
        orderDao.updateBySql(updateSeatsSql);
        return true;
    }
}
