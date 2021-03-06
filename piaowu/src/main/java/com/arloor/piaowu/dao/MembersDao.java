package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Member;
import com.arloor.piaowu.domain.Memberorder;
import com.arloor.piaowu.domain.Memberticket;
import com.arloor.piaowu.domain.Ticket;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;

@Mapper
public interface MembersDao {
    Member searchByUname(@Param("uname") String uname);

    boolean updatePinByUname(@Param("uname") String uname,@Param("pin") int pin);

    void insertEmptyMember(@Param("uname") String uname);

    void updateSignMemberByUname(@Param("uname") String uname,@Param("email") String email,@Param("passwd") String passwd,@Param("paykey") String paykey);

    List<Memberticket> getMemberTicket(@Param("uname") String uname);

    int checkMemberPaykey(@Param("uname")String uname,@Param("paykey") String paykey);

    void useTicket(@Param("uname")String uname,@Param("ticketname")String ticketname);

    void payAndGetJifen(@Param("uname") String uname,@Param("pay")String pay);

    void updateBySql(@Param("paramSQL")String sql);

    void updateMember( Member member);

    Memberorder getMemberOrder(@Param("uname") String uname,@Param("pname") String pname);

    List<Ticket> ungettickets(@Param("uname") String uname);

    int countUnusedTickets(@Param("uname")String uname);

    void insertNewTicket(@Param("uname")String uname,@Param("ticketname")String ticketname);

    void minusleft(@Param("ticketname") String ticketname);

    void minusbonus(@Param("uname") String uname,@Param("bonuscost") String bonuscost);
}
