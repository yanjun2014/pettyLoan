package com.hl.loan.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

@Entity
@Table(name = "meet")
public class Meet implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "meet_name")
	private String meetName;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "webxin")
	private String webxin;
	
	@Column(name = "times")
	private String times;
	
	@Column(name = "qq")
	private String qq;
	
	@Column(name = "state")
	private Integer state;     //1、约见,2、送资料,3、送样品
	
	@Column(name = "result_state")
	private Integer resultState;             //1、成交,2不买,3、未成交  4,待确定
	
	@Column(name = "vist1")
	private String vist1;
	
	@Column(name = "vist2")
	private String vist2;
	
	@Column(name = "vist3")
	private String vist3;
	
	@Column(name = "remark")
	private String remark;
	
	@Column(name = "fback1")
	private String fback1;
	
	@Column(name = "fback2")
	private String fback2;
	
	@Column(name = "file_id")
	private Long fileId;
	
	@Formula("(select c.compnyName from FileNames c where c.id = file_id)")
	private String compnyName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMeetName() {
		return meetName;
	}

	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWebxin() {
		return webxin;
	}

	public void setWebxin(String webxin) {
		this.webxin = webxin;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getResultState() {
		return resultState;
	}

	public void setResultState(Integer resultState) {
		this.resultState = resultState;
	}

	public String getVist1() {
		return vist1;
	}

	public void setVist1(String vist1) {
		this.vist1 = vist1;
	}

	public String getVist2() {
		return vist2;
	}

	public void setVist2(String vist2) {
		this.vist2 = vist2;
	}

	public String getVist3() {
		return vist3;
	}

	public void setVist3(String vist3) {
		this.vist3 = vist3;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFback1() {
		return fback1;
	}

	public void setFback1(String fback1) {
		this.fback1 = fback1;
	}

	public String getFback2() {
		return fback2;
	}

	public void setFback2(String fback2) {
		this.fback2 = fback2;
	}

	public Long getFileId() {
		return fileId;
	}

	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}

	public String getCompnyName() {
		return compnyName;
	}

	public void setCompnyName(String compnyName) {
		this.compnyName = compnyName;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}
	
}





