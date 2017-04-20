package com.hl.loan.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.tools.ant.types.FileList.FileName;
import org.springframework.beans.factory.annotation.Autowired;

import com.hl.loan.pojo.FileNames;
import com.hl.loan.pojo.FileNamesLog;
import com.hl.loan.pojo.Meet;
import com.hl.loan.pojo.SysUser;
import com.hl.loan.service.FileNamesService;
import com.hl.loan.service.MeetService;
import com.hl.loan.util.PageModel;

@Namespace("/action/meet")
@ResultPath("/")
public class MeetAction extends BaseAction{
	@Autowired
	private FileNamesService fileNamesService; 
	private PageModel<Meet> pm;
	private Meet meet;
	
	public PageModel<Meet> getPm() {
		return pm;
	}
	public void setPm(PageModel<Meet> pm) {
		this.pm = pm;
	}
	public Meet getMeet() {
		return meet;
	}
	public void setMeet(Meet meet) {
		this.meet = meet;
	}
	@Autowired
	private MeetService meetService;
	@Action(value = "showMeet", results = { @org.apache.struts2.convention.annotation.Result(name = "success", location = "/meet/meet_list.jsp") })
	public String showMeet() throws IOException {
		PageModel<Meet> pm = new PageModel<Meet>();
		if (getPm() != null) {
			pm = getPm();
		}
		Meet meet=getMeet();
		pm=meetService.showFiles(pm, meet);
		this.getRequest().setAttribute("pm", pm);
		return "success";
	}
	@Action(value = "toMeet", results = { @org.apache.struts2.convention.annotation.Result(name = "success", location = "/meet/meet_add.jsp") })
	public String toMeet(){
		String strfile=this.getRequest().getParameter("fileId");
		Long fileId=(long) 1;
		if(strfile!=null && strfile.length()>0){
			fileId=Long.parseLong(strfile);
		}
		FileNames fileName=fileNamesService.getFileNamesByID(fileId);
		this.getRequest().setAttribute("fileName", fileName);
		return "success";
	}
	@Action("addMeet")
	public void addMeet() throws ParseException {
		SysUser sysUsers = (SysUser) getRequest().getSession().getAttribute(
				"user");
		String times = getRequest().getParameter("times");
		if(times==null || times.length()==0){
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
			times=sdf.format(dt);
		}
		String strfile = getRequest().getParameter("fileId");
		Long fileId=(long) 1;
		if(strfile!=null && strfile.length()>0){
			fileId=Long.parseLong(strfile);
		}
		String strstate = getRequest().getParameter("state");
		int state=1;
		if(strstate!=null && strstate.length()>0){
			state=Integer.parseInt(strstate);
		}
		Meet mt=new Meet();
		FileNames fileName=fileNamesService.getFileNamesByID(fileId);
		mt.setFileId(fileId);
		mt.setMeetName(fileName.getLinkmn());
		mt.setPhone(fileName.getPhone());
		mt.setQq(fileName.getQq());
		mt.setFback1(sysUsers.getUserName());
		mt.setState(state);
		mt.setResultState(4);
		mt.setTimes(times);
		try {
			meetService.addMeet(mt);
			writeResult(true, "保存成功！", getResponse());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Action(value = "toUpdate", results = { @org.apache.struts2.convention.annotation.Result(name = "success", location = "/meet/meet_update.jsp") })
	public String toUpdate(){
		String strfile=this.getRequest().getParameter("fid");
		Long fid=(long) 1;
		if(strfile!=null && strfile.length()>0){
			fid=Long.parseLong(strfile);
		}
		Meet meet=meetService.getMeetById(fid);
		this.getRequest().setAttribute("meet", meet);
		return "success";
	}
	@Action("updateMeet")
	public void updateMeet() throws ParseException {
		SysUser sysUsers = (SysUser) getRequest().getSession().getAttribute(
				"user");
		String sid = getRequest().getParameter("id");
		Long id = Long.valueOf(0L);
		if ((sid != null) && (sid.length() > 0)) {
			id = Long.valueOf(Long.parseLong(sid));
		}
		String meetName = getRequest().getParameter("meetName");
		String times = getRequest().getParameter("times");
		String state = getRequest().getParameter("state");
		String resultState = getRequest().getParameter("resultState");
		String phone = getRequest().getParameter("phone");
		String qq = getRequest().getParameter("qq");
		String vist1 = getRequest().getParameter("vist1");
		String vist2 = getRequest().getParameter("vist2");
		String webxin = getRequest().getParameter("webxin");
		String remark = getRequest().getParameter("remark");
		String compnyName=getRequest().getParameter("compnyName");
		Meet mt=new Meet();
		mt.setMeetName(meetName);
		mt.setTimes(times);
		mt.setState(Integer.parseInt(state));
		mt.setResultState(Integer.parseInt(resultState));
		mt.setPhone(phone);
		mt.setQq(qq);
		mt.setVist1(vist1);
		mt.setVist2(vist2);
		mt.setWebxin(webxin);
		mt.setRemark(remark);
		mt.setId(id);
		mt.setCompnyName(compnyName);
		try {
			meetService.updateMeet(mt);
			writeResult(true, "修改成功！", getResponse());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}






