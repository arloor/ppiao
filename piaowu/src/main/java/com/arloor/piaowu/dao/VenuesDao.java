package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Halls;
import com.arloor.piaowu.domain.Venues;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;

@Mapper
public interface VenuesDao {

     void insertNewVenues(@Param("vname") String vname,@Param("vpasswd")String vpasswd,@Param("vaddr") String vaddr,@Param("info") String info);


    void updateBySql(@Param("paramSQL")String sql);

    Venues searchVenuesByVname(@Param("vname") String vname);

    Venues searchVenuesByVid(@Param("vid") int vid);

    List<String> getSeatsTypes(@Param("vname") String vname,@Param("hname") String hname);

    List<String> getHallsByVname(@Param("vname") String vname);

    void insertNewPlan(@Param("pname") String pname, @Param("vname") String vname, @Param("phname") String phname,@Param("pdate") String pdate,@Param("ptime") String ptime,@Param("ptype") String ptype,@Param("pinfo") String pinfo);

    List<Halls> searchSeatInfo(@Param("vname") String vname,@Param("hname") String hname);
}
