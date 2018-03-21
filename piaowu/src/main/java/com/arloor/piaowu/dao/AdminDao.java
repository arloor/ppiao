package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Admin;
import com.arloor.piaowu.domain.Halls;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminDao {
    Admin searchAdmin(@Param("aname") String s);

    List<Halls> selectHallsbyVname(@Param("vname")String vname);
}
