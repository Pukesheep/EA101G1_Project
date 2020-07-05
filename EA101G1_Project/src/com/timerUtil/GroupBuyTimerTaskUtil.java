package com.timerUtil;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import com.gro_mem.model.Gro_memService;
import com.gro_mem.model.Gro_memVO;
import com.groupBuy.model.GroupBuyService;
import com.groupBuy.model.GroupBuyVO;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class GroupBuyTimerTaskUtil extends TimerTask {

	@Override
	public void run() {
		GroupBuyService groSvc = new GroupBuyService();
		Gro_memService groMemSvc = new Gro_memService();
		List<GroupBuyVO> groupBuyVOs = groSvc.openGroupBuy();
		List<Gro_memVO> groMemVOs = groMemSvc.getAll();
		for (GroupBuyVO gerBuyVO : groupBuyVOs) {
			Timestamp toDay = new Timestamp(System.currentTimeMillis()); 
			Timestamp endDate = gerBuyVO.getEnd_Date();
			if (toDay.before(endDate)) {
				int people = Integer.valueOf(gerBuyVO.getPeople());
				if (people >= groMemVOs.size()) {
					groSvc.closeGroupBuy(gerBuyVO.getGro_Id(), GroupBuyVO.STANDARD_STATUS);
				} else if (people < groMemVOs.size()) {
					groSvc.closeGroupBuy(gerBuyVO.getGro_Id(), GroupBuyVO.CLOSE_STATUS);
				}
			}
		}
	}
}
