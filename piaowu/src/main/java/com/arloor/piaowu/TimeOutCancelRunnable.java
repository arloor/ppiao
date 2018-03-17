package com.arloor.piaowu;


import com.arloor.piaowu.dao.OrderDao;
import com.arloor.piaowu.domain.Memberorder;
import com.arloor.piaowu.service.MemberController;
import java.util.Calendar;
import java.util.List;


/**
 * 检查未支付订单的超时情况的线程
 */
public class TimeOutCancelRunnable implements Runnable{


    OrderDao orderDao;
    MemberController memberController;

    public TimeOutCancelRunnable(OrderDao orderDao, MemberController memberController) {
        this.orderDao=orderDao;
        this.memberController=memberController;
    }

    @Override
    public void run() {
        List<Memberorder> orders=orderDao.selectOrdersbyStatus("未支付");
        Calendar calendar=Calendar.getInstance();
        System.out.println(calendar.getTime()+"检查未支付订单的超时情况");
        calendar.add(Calendar.MINUTE,-15);


        for (int i = 0; i < orders.size(); i++) {
            if(orders.get(i).getBooktime().compareTo(calendar.getTime())<0){
                memberController.cancelOrder(orders.get(i).getUname(),orders.get(i).getPname());
                System.out.println("cancel "+orders.get(i).getUname()+"  "+orders.get(i).getPname());
            }
        }
    }
}
