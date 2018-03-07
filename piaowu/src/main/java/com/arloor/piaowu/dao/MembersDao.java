package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MembersDao {
    Member searchByUname(@Param("uname") String uname);

    boolean updatePinByUname(@Param("uname") String uname,@Param("pin") int pin);

    void insertEmptyMember(@Param("uname") String uname);

    void updateSignMemberByUname(@Param("uname") String uname,@Param("email") String email,@Param("passwd") String passwd,@Param("paykey") String paykey);
}
