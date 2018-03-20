package com.arloor.piaowu.dao;

import com.arloor.piaowu.domain.Memberorder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Bean;

import java.util.List;

@Mapper

public interface OrderDao {
    void insertOrder(@Param("uname") String uname,
                     @Param("pname")String pname,
                     @Param("state") String state,
                     @Param("seatnum") String seatnum,
                     @Param("seatarranged") int seatarranged,
                     @Param("charge") String charge,
                     @Param("pay") String pay,
                     @Param("ticketname") String ticketname
                     );

    void updateBySql(@Param("sql")String sql);

    void unTakenSeats(@Param("uname")String uname,@Param("pname") String pname ,@Param("table")String table);

    List<Memberorder> selectOrdersbyUnameState(@Param("uname") String uname, @Param("status") String status);

    List<Memberorder> selectOrders(@Param("uname")String uname);

    List<Memberorder> selectOrdersbyStatus(@Param("status")String status);

    void updateOrder(Memberorder memberorder);

    void insertGuestOrder(@Param("pname") String pname,@Param("stype") String stype,@Param("seatnum") String seatnum,@Param("pay") String pay);
}
