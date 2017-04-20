package com.hl.loan.service;

import com.hl.loan.pojo.Meet;
import com.hl.loan.util.PageModel;

public interface MeetService {
	public void addMeet(Meet meet);
	public void updateMeet(Meet meet);
	public PageModel<Meet> showFiles(PageModel<Meet> pm, Meet meet);
	public Meet getMeetById(Long id);
}
