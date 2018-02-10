package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MembersDao {
    Member searchByUname(String uname);
}
