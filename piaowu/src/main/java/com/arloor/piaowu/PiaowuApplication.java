package com.arloor.piaowu;

import com.arloor.piaowu.dao.OrderDao;
import com.arloor.piaowu.service.MemberController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@SpringBootApplication
public class PiaowuApplication {


	public static void main(String[] args) {

		ApplicationContext app =SpringApplication.run(PiaowuApplication.class, args);

        OrderDao orderDao=app.getBean(OrderDao.class);
        MemberController memberController=app.getBean(com.arloor.piaowu.service.MemberController.class);

		ScheduledExecutorService executor= Executors.newScheduledThreadPool(1);
		//超时取消的线程
		executor.scheduleAtFixedRate(new TimeOutCancelRunnable(orderDao,memberController),1, 1,TimeUnit.MINUTES);
	}
}
