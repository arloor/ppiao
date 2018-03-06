package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MembersDao {
    Member searchByUname(String uname);

    boolean updatePinByUname(String uname,int pin);

    void insertEmptyMember(String uname);

    void updateSignMemberByUname(String uname,String email,String passwd,String paykey);
}
