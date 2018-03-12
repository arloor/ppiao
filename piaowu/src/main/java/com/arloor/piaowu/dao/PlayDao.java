package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Play;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PlayDao
{
    //pdate : "2018-03-30"  ptime : "16:24"  带双引号
    List<Play> listPlaysAfterSomeTime(@Param("pdate")String pdate,@Param("ptime") String ptime);
}
