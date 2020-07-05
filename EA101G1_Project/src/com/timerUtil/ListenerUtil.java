package com.timerUtil;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ListenerUtil implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce) {
		Timer timer = new Timer();
		timer.schedule(new GroupBuyTimerTaskUtil(), 0, 1000);
//		timer.schedule(new GroupBuyTimerTaskUtil(), 0, 4*60*60*1000);
	}
}
