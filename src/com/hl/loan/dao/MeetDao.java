package com.hl.loan.dao;

import com.hl.loan.pojo.Meet;
import com.hl.loan.util.PageModel;

public interface MeetDao {
	public void addMeet(Meet meet);
	public void updateMeet(Meet meet);
	public PageModel<Meet> showFiles(PageModel<Meet> pm, Meet meet);
	public Meet getMeetById(Long id);
}
