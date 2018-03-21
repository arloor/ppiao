package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminDao {
    Admin searchAdmin(@Param("aname") String s);
}
