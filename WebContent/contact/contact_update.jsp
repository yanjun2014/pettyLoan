<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="page" uri="/WEB-INF/page-tag.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", path);
	request.setAttribute("basePath", basePath);
%>
<link rel="stylesheet" href="${path}/css/default.css" type="text/css"/>
<link rel="stylesheet" href="${path}/css/outReg.css" type="text/css"/>
<link rel="stylesheet" href="${path}/css/Css.css" type="text/css"/>
<script type="text/javascript" src="${path}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${path}/contact/contact.js"></script>
<div class="container" id="tb_WarnSelect_div">
<input id="basePath" type="hidden" value="${basePath}"/>
<input type="hidden" value="${contact.contactID}" id="contactID">
<table id="table1" style="width:100%;" cellpadding="0" cellspacing="0" class="tableList">
	<tr>
		<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">信息渠道：</td>
		<td style="padding-top: 2px; padding-left: 2px;" class="style2">
		    <input type="text" id="message" name="message" value="${contact.message}"/>
		</td>
		<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">主办方：</td>
		<td class="style2" style="padding-top: 2px; padding-left: 2px;">
		     <input type="text" id="sponsor" name="sponsor" value="${contact.sponsor}"/>
		</td>
	</tr>
	<tr>
		<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动名称：</td>
		<td style="padding-top: 2px; padding-left: 2px;" class="style2">
		    <input type="text" id="activity" name="activity" value="${contact.activity}"/>
		</td>
		<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动时间：</td>
		<td class="style2" style="padding-top: 2px; padding-left: 2px;">
		    <input type="text" id="activityTime" value="${contact.activityTime}" name="activityTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
		</td>
	</tr>
	<tr>
		<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动内容：</td>
		<td style="padding-top: 2px; padding-left: 2px;" class="style2">
		    <input type="text" id="activityContent" name="activityContent" value="${contact.activityContent}"/>
		</td>
		<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动规则：</td>
		<td class="style2" style="padding-top: 2px; padding-left: 2px;">
		    <input type="text" id="rule" name="rule" value="${contact.rule}"/>
		</td>
	</tr>

	<tr>
		<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">联系人姓名：</td>
        <td style="padding-top: 2px; padding-left: 2px;" class="style2">
        	<input type="text" value="${contact.contactName}" id="contactName" value="${contact.contactName}">
        </td>
        <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动地址：</td>
		<td class="style2" style="padding-top: 2px; padding-left: 2px;">
		     <input type="text" id="activityAddress" name="activityAddress" value="${contact.activityAddress}"/>
		</td>
	</tr>
	<tr>
        <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">联系人电话：</td>
        <td style="padding-top: 2px; padding-left: 2px;" class="style2">
        	<input type="text" value="${contact.contactTel}" id="contactTel" value="${contact.contactTel}" />
        </td>
        <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">联系人电子邮件：</td>
        <td style="padding-top: 2px; padding-left: 2px;" class="style2">
           	<input type="text" value="${contact.contactEmail}" id="contactEmail" value="${contact.contactEmail}">
        </td>
	</tr>
	<tr>
    	<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">备注：</td>
        <td style="padding-top: 2px; padding-left: 2px;" class="style2">
			<input type="text" value="${contact.contactRemark}" id="contactRemark">
        </td>
	</tr>
</table>
&nbsp;
<div class="box_btn" align="center">
<input type="button" value="保&nbsp;&nbsp;存" onclick="updateContact()"/> 
<input type="button" id="reset" onclick="window.close()" value="取&nbsp;&nbsp;消"/>
</div>
</div>