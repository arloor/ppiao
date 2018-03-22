package com.arloor.piaowu.service;

import com.arloor.piaowu.dao.AdminDao;
import com.arloor.piaowu.domain.Halls;
import com.arloor.piaowu.domain.Venues;
import com.arloor.piaowu.model.TocheckVenues;
import com.arloor.piaowu.model.VenuesTemp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/api/admin")
public class AdminController {
    @Autowired
    private AdminDao adminDao;

    @RequestMapping("/showtocheck")
    public List<TocheckVenues> showtocheck(){

        List<Halls> modifedHalls=adminDao.selectTempHalls();
        List<Halls> signHalls=adminDao.selectHalls();
        List<VenuesTemp> modifiedVenues=adminDao.selectModifiedVenues();
        List<Venues> signVenues=adminDao.selectSignVenues();

        List<TocheckVenues> tocheckVenuesList=new ArrayList<>();

        for (Venues venues:signVenues
             ) {
            TocheckVenues temp=new TocheckVenues();
            String seats="";
            for (Halls hall:signHalls
                 ) {
                if(hall.getVname().equals(venues.getVname())){
                    seats+=hall.getHname()+"-"+hall.getStype()+"-"+hall.getRownum()+"-"+hall.getColnum()+",";
                }
            }
            temp.setVname(venues.getVname());
            temp.setSeats(seats);
            temp.setVaddr(venues.getVaddr());
            temp.setVinfo(venues.getVinfo());
            temp.setVpasswd(venues.getVpasswd());
            temp.setVstatus(venues.getVstatus());
            tocheckVenuesList.add(temp);
        }
        for (VenuesTemp venuesTemp:modifiedVenues
                ) {
            TocheckVenues temp=new TocheckVenues();
            String seats="";
            for (Halls hall:modifedHalls
                    ) {
                if(hall.getVname().equals(venuesTemp.getVname())){
                    seats+=hall.getHname()+"-"+hall.getStype()+"-"+hall.getRownum()+"-"+hall.getColnum()+",";
                }
            }
            temp.setVname(venuesTemp.getVname());
            temp.setSeats(seats);
            temp.setVaddr(venuesTemp.getVaddr());
            temp.setVinfo(venuesTemp.getVinfo());
            temp.setVpasswd(venuesTemp.getVpasswd());
            temp.setVstatus(venuesTemp.getVstatus());
            tocheckVenuesList.add(temp);
        }

        return tocheckVenuesList;
    }

    @RequestMapping("/passsign")
    public String passsign(@RequestParam String vname){
        adminDao.passSign(vname);
        return "<a href=\"http://piaomai.moontell.cn/checkmodifyinfo\">通过成功，返回</a>";
    }

    @RequestMapping("/dispasssign")
    public String dispasssign(@RequestParam String vname){
        adminDao.dispassSign(vname);
        adminDao.deleteHallsByvname(vname);
        return "<a href=\"http://piaomai.moontell.cn/checkmodifyinfo\">驳回成功，返回</a>";
    }

    @RequestMapping("/passmodify")
    public String passmodify(@RequestParam String vname){
        VenuesTemp venuesTemp=adminDao.selectVenuesTemp(vname);
        Venues venues=adminDao.selectVenues(vname);
        venues.setVaddr(venuesTemp.getVaddr());
        venues.setVinfo(venuesTemp.getVinfo());
        venues.setVpasswd(venues.getVpasswd());
        adminDao.updateVenus(venues);
        adminDao.deleteVenuesTemp(vname);
        adminDao.deleteHallsByvname(vname);
        adminDao.insertHallsFromTemp(vname);
        adminDao.deleteTempHalls(vname);
        return "<a href=\"http://piaomai.moontell.cn/checkmodifyinfo\">通过成功，返回</a>";
    }
    @RequestMapping("/dispassmodify")
    public String dispassmodify(@RequestParam String vname){
        adminDao.deleteVenuesTemp(vname);
        adminDao.deleteTempHalls(vname);
        return "<a href=\"http://piaomai.moontell.cn/checkmodifyinfo\">驳回成功，返回</a>";
    }
}
