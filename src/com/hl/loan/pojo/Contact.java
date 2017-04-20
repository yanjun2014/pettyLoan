package com.hl.loan.pojo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "contact")
public class Contact implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 联系人实体
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "contactID")
	private Long contactID; // ID

	@Column(name = "contactName")
	private String contactName; // 联系人

	@Column(name = "contactPost")
	private String contactPost; // 联系人职务
	
	@Column(name = "contactTel")
	private String contactTel; // 联系人电话
	
	@Column(name = "contactEmail")
	private String contactEmail; // 联系人电子邮箱
	
	@Column(name = "contactRemark")
	private String contactRemark; // 备注
	
	@Column(name = "createById")
	private Long createById; // 创建人
	
	@Column(name = "updateById")
	private Long updateById; // 修改人
	
	@Column(name = "createTime")
	private Date createTime; // 创建时间
	
	@Column(name = "updateTime")
	private Date updateTime; // 修改时间
	
	@Column(name = "message")
	private String message;         //信息渠道
	
	@Column(name = "rule")
	private String rule;      	//活动规则
	
	@Column(name = "sponsor")
	private String sponsor;				//主办方
	
	@Column(name = "activity")
	private String activity;    //活动名称
	
	@Column(name = "activity_content")
	private String activityContent;    //活动内容
	
	@Column(name = "activity_address")
	private String activityAddress;      //活动地址
	
	@Column(name = "activity_time")
	private String activityTime;
	public Long getContactID() {
		return contactID;
	}

	public void setContactID(Long contactID) {
		this.contactID = contactID;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactPost() {
		return contactPost;
	}

	public void setContactPost(String contactPost) {
		this.contactPost = contactPost;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactRemark() {
		return contactRemark;
	}

	public void setContactRemark(String contactRemark) {
		this.contactRemark = contactRemark;
	}

	public Long getCreateById() {
		return createById;
	}

	public void setCreateById(Long createById) {
		this.createById = createById;
	}

	public Long getUpdateById() {
		return updateById;
	}

	public void setUpdateById(Long updateById) {
		this.updateById = updateById;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getSponsor() {
		return sponsor;
	}

	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public String getActivityContent() {
		return activityContent;
	}

	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}

	public String getActivityAddress() {
		return activityAddress;
	}

	public void setActivityAddress(String activityAddress) {
		this.activityAddress = activityAddress;
	}

	public String getActivityTime() {
		return activityTime;
	}

	public void setActivityTime(String activityTime) {
		this.activityTime = activityTime;
	}
	
}
