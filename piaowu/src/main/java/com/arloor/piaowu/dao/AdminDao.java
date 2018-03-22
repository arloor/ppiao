package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Admin;
import com.arloor.piaowu.domain.Halls;
import com.arloor.piaowu.domain.Ticket;
import com.arloor.piaowu.domain.Venues;
import com.arloor.piaowu.model.VenuesTemp;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminDao {
    Admin searchAdmin(@Param("aname") String s);

    List<Halls> selectTempHalls();
    List<Halls> selectHalls();
    List<Venues> selectSignVenues();
    List<VenuesTemp> selectModifiedVenues();

    void passSign(@Param("vname") String vname);

    void dispassSign(@Param("vname") String vname);

    void deleteHallsByvname(@Param("vname")String vname);
    void insertHallsFromTemp(@Param("vname")String vname);
    void deleteTempHalls(@Param("vname")String vname);

    VenuesTemp selectVenuesTemp(@Param("vname")String vname);
    Venues selectVenues(@Param("vname")String vname);
    void updateVenus(Venues vname);
    void deleteVenuesTemp(@Param("vname")String vname);

    void insertTicket(Ticket ticket);

    void updateOrderStatus(@Param("uname") String uname,@Param("pname") String pname);
}
