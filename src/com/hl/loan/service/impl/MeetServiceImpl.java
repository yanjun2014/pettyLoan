package com.hl.loan.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hl.loan.dao.MeetDao;
import com.hl.loan.pojo.Meet;
import com.hl.loan.service.MeetService;
import com.hl.loan.util.PageModel;

@Service("meetService")
public class MeetServiceImpl implements MeetService{
	@Resource
	private MeetDao meetDao;
	public void addMeet(Meet meet){
		meetDao.addMeet(meet);
	}
	public void updateMeet(Meet meet){
		meetDao.updateMeet(meet);
	}
	public PageModel<Meet> showFiles(PageModel<Meet> pm, Meet meet){
		return meetDao.showFiles(pm, meet);
	}
	public Meet getMeetById(Long id){
		return meetDao.getMeetById(id);
	}
}



