package com.arloor.piaowu.service;

import com.arloor.piaowu.dao.VenuesDao;
import com.arloor.piaowu.domain.Venues;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/venues")
public class VenusController {
    @Autowired
    VenuesDao venuesDao;

    @RequestMapping("/signup")
    public String venuesSign(
            @RequestParam String vname,
            @RequestParam String vpasswd,
            @RequestParam String vaddr,
            @RequestParam String seats,
            @RequestParam String info
    ){
        try{
            venuesDao.insertNewVenues(vname,vpasswd,vaddr,info);
        }catch (Exception e){
            e.printStackTrace();
            return "false";
        }
        String[] entitys=seats.split(",");
        String sql="INSERT INTO halls(vname, hname, stype, rownum, colnum) VALUES ";
        for (String entiry:entitys
             ) {
            sql+="('"+vname+"','"+entiry.split("-")[0]+"','"+entiry.split("-")[1]+"',"+entiry.split("-")[2]+","+entiry.split("-")[3]+"),";
        }
        sql=sql.substring(0,sql.length()-1)+";";
        try{
            venuesDao.updateBySql(sql);
        }catch (Exception e){
            e.printStackTrace();
            return "false";
        }
        Venues venues=venuesDao.searchVenuesByVname(vname);
        long vid=venues.getVid();
        String vidStr=String.format("%7d", vid).replace(" ", "0");
        return vidStr;
    }

    @RequestMapping("/seatstypes")
    public List<String> getSeatsTypes(
            @RequestParam String vname,
            @RequestParam String hname
    ){
//        return null;
        return venuesDao.getSeatsTypes(vname,hname);
    }

    @RequestMapping("/createplan")
    public boolean createPlan(
            @RequestParam String vname,
            @RequestParam String pname,
            @RequestParam String phname,
            @RequestParam String pdate,
            @RequestParam String ptime,
            @RequestParam String ptype,
            @RequestParam String pinfo,
            @RequestParam String sprice
    ){
        //todo:完成在plays中插入以及创建seats表的操作
        venuesDao.insertNewPlan(pname,vname,phname,pdate,ptime,ptype,pinfo);
        String[] priceEntitys=sprice.split(",");
        String insertSeatPriceSql="insert INTO  pfares(pname, stype, fares) VALUES ";
        for (String priceEntity:priceEntitys
             ) {
            insertSeatPriceSql+="('"+pname+"','"+priceEntity.split("-")[0]+"',"+priceEntity.split("-")[1]+"),";
        }
        insertSeatPriceSql=insertSeatPriceSql.substring(0,insertSeatPriceSql.length()-1);
        venuesDao.updateBySql(insertSeatPriceSql);
        //todo:邪恶的悦悦！太坏了！
//        String createSeatTableForPlay="create t"
//        venuesDao.createSeatTableForPlay()
//        venuesDao.insertPlaySeatPrice();
        return false;
    }

    @RequestMapping("/halls")
    public List<String> getHallsByVname(String vname){
        return venuesDao.getHallsByVname(vname);
    }
}
