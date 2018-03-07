package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Venues;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface VenuesDao {

     void insertNewVenues(String vname,String vpasswd,String vaddr,String info);

     void insertSeatsInfoByVname(String sql);

    void updateBySql(@Param("paramSQL")String sql);

    Venues searchVenuesByVname(String vname);

    Venues searchVenuesByVid(int vid);
}
