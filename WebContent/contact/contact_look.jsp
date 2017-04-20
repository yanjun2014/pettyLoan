<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("path", path);
	request.setAttribute("basePath", basePath);
%>
<link rel="stylesheet" href="${path}/css/default.css" type="text/css" />
<link rel="stylesheet" href="${path}/css/outReg.css" type="text/css" />
<link rel="stylesheet" href="${path}/css/Css.css" type="text/css" />
<script type="text/javascript" src="${path}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${path}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/contact/contact.js"></script>
<div class="mainbox">
	<div class="box90 bkCenter">
		<div class="infobox">
			<div class="infocontent">
				<input id="basePath" type="hidden" value="${basePath}"/>
				<div class="infotitle">
					<h3>活动详情</h3>
				</div>
				<div class="infocontent">
					<table id="table1" style="width:100%;" cellpadding="0" cellspacing="0" class="tableList">
						<tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">信息渠道：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	${contact.message}
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">主办方：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	${contact.sponsor}
		                    </td>
						</tr>
						<tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动名称：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	<input type="text" id="activity" name="activity"/>${contact.}
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动时间：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	${contact.activityTime}
		                    </td>
						</tr>
						<tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动内容：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	${contact.activityContent}
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动规则：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	${contact.rule}
		                    </td>
						</tr>
						
	                    <tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">联系人姓名：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	${contact.contactName}
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">活动地址：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	${contact.activityAddress}
		                    </td>
						</tr>
						<tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">联系人电话：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	${contact.contactTel}
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">联系人电子邮件：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	${contact.contactEmail}
		                    </td>
						</tr>
						
						
						
						<tr>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">备注：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	${contact.contactRemark}
		                    </td>
						</tr>
					</table>
				</div>				
			</div>
		</div>&nbsp;
		<div class="box_btn" align="center">
			<input type="button" value="保&nbsp;&nbsp;存" onclick="addContact()"/> 
			<input type="button" id="reset" onclick="window.close()" value="取&nbsp;&nbsp;消"/>
		</div>
	</div>
</div>