package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Venues;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface VenuesDao {

     void insertNewVenues(@Param("vname") String vname,@Param("vpasswd")String vpasswd,@Param("vaddr") String vaddr,@Param("info") String info);


    void updateBySql(@Param("paramSQL")String sql);

    Venues searchVenuesByVname(@Param("vname") String vname);

    Venues searchVenuesByVid(@Param("vid") int vid);

    List<String> getSeatsTypes(@Param("vname") String vname,@Param("hname") String hname);
}
