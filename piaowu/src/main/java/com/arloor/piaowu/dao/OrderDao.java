package com.arloor.piaowu.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
}
