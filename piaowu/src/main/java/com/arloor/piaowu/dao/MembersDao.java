package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Member;
import com.arloor.piaowu.domain.Memberticket;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MembersDao {
    Member searchByUname(@Param("uname") String uname);

    boolean updatePinByUname(@Param("uname") String uname,@Param("pin") int pin);

    void insertEmptyMember(@Param("uname") String uname);

    void updateSignMemberByUname(@Param("uname") String uname,@Param("email") String email,@Param("passwd") String passwd,@Param("paykey") String paykey);

    List<Memberticket> getMemberTicket(@Param("uname") String uname);
}
