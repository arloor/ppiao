package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Play;
import com.arloor.piaowu.domain.Seat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PlayDao
{
    //pdate : "2018-03-30"  ptime : "16:24"  带双引号
    List<Play> listPlaysAfterSomeTime(@Param("pdate")String pdate,@Param("ptime") String ptime);

    List<Play> viewPlayInfo(@Param("pname")String pname);

    List<Seat> leftSeats(@Param("pname") String pname,@Param("stype") String stype);

    //pdate : "2018-03-30"  ptime : "16:24"  带双引号
    List<Play> selectPlaysbyVenuesEarlierThan(@Param("vname")String vname,@Param("pdate")String pdate,@Param("ptime") String ptime);
}
