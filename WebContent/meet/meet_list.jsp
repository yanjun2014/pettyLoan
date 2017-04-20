<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="w" uri="http://ley.Page.com/tags/pager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>小额贷系统</title>
<%@include file="/comment/comment.jsp"%>
<link href="${path}/syscss/basic_layout.css" rel="stylesheet" type="text/css"/>
<link href="${path}/syscss/common_style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${path}/css/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="${path}/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="${path}/js/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript" src="${path}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${path}/meet/meet.js"></script>
<script type="text/javascript" src="${path}/js/My97DatePicker/WdatePicker.js"></script>
<style>
.alt td {
	background: black !important;
}

#box_bottom {
	height: 40px;
	line-height: 40px;
	text-align: right;
}

.ui_frt {
	float: right;
}

tr:hover {
	background: #f6f6f6;
}

.ui_tb_h30 {
	margin-top: 20px;
}
</style>
</head>
<body id="body">
<div id="userinfoContainer" class="container">
<input id="basePath" type="hidden" value="${basePath}"/>
<%-- <form action="${path}/action/fileNames/upload" method="post" enctype="multipart/form-data">  
						<input type="file" name="files" id="files"/> </br>
						<input type="submit" value="导入数据" />
					</form>  --%>
<form id="searchForm" action="${path}/action/meet/showMeet" method="post">
 <input type="hidden" value="${modId}" name="modId" id="modId"/> 
<div class="place"><ul class="placeul"></ul></div>
<div id="container">
	<div class="ui_content">
		<div class="ui_text_indent">
			<div id="box_border">
				<div class="box_bottom">
					<label class="input_label">公司名称：</label>
					<input id="compnyName" name="meet.compnyName" value="${meet.compnyName}"  type="text" class="input_text" />
					&nbsp&nbsp<label class="input_label">联系人：</label>
					<input id="meetName" name="meet.meetName" value="${meet.meetName}"  type="text" class="input_text" />
					&nbsp&nbsp<label class="input_label">联系人电话：</label>
					<input id="phone" name="phone" value="${meet.phone}"  type="text" class="input_text" /></br>
					&nbsp&nbsp<label class="input_label">类别：</label>
					<select	name="meet.state" id="state">
						<option value="">--</option>
						<c:choose>
						<c:when test="${meet.state==1}">
							<option value="1" selected="selected">约见</option>
							<option value="2">送资料</option>
							<option value="3">送样品</option>
						</c:when>
						<c:when test="${meet.state==2}">
							<option value="1">约见</option>
							<option value="2" selected="selected">送资料</option>
							<option value="3">送样品</option>
						</c:when>
						<c:when test="${meet.state==3}">
							<option value="1">约见</option>
							<option value="2">送资料</option>
							<option value="3" selected="selected">送样品</option>
						</c:when>
						<c:otherwise>
							<option value="1">约见</option>
							<option value="2">送资料</option>
							<option value="3">送样品</option>
						</c:otherwise>
						</c:choose>
					</select>
					&nbsp&nbsp<label class="input_label">结果：</label>
					<select	name="meet.resultState" id="resultState">
						<option value="">--</option>
						<c:choose>
						<c:when test="${meet.resultState==1}">
							<option value="1" selected="selected">成交</option>
							<option value="2">不买</option>
							<option value="3">未成交</option>
							<option value="4">待确定</option>
						</c:when>
						<c:when test="${meet.resultState==2}">
							<option value="1">成交</option>
							<option value="2" selected="selected">不买</option>
							<option value="3">未成交</option>
							<option value="4">待确定</option>
						</c:when>
						<c:when test="${meet.resultState==3}">
							<option value="1">成交</option>
							<option value="2">不买</option>
							<option value="3" selected="selected">未成交</option>
							<option value="4">待确定</option>
						</c:when>
						<c:when test="${meet.resultState==4}">
							<option value="1">成交</option>
							<option value="2">不买</option>
							<option value="3">未成交</option>
							<option value="4" selected="selected">待确定</option>
						</c:when>
						<c:otherwise>
							<option value="1">成交</option>
							<option value="2">送资料</option>
							<option value="3">未成交</option>
							<option value="4">待确定</option>
						</c:otherwise>
						</c:choose>
					</select>
					<input type="submit" id="searchBtn" value="查&nbsp;&nbsp;询" class="ui_input_btn01"/>
				</div>
				
			</div>
		</div>
	</div>
	<div class="ui_content">
		<div class="ui_tb">
			<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				<tr class="TableHeader"> 
					<th>单位名称</th>
					<th>负责人</th>
					<th>手机</th>
					<th>微信</th>
					<th>时间</th>
					<th>类别</th>
					<th>处理结果</th>
					 <th>操作人</th> 
					<th>约见情况</th>
					<th>操作</th>
				</tr>
				<c:choose>
				<c:when test="${empty pm.datas}">
					<tr><td colspan="11"></td></tr>
				</c:when>
					<c:otherwise>
						<c:forEach var="bean" items="${pm.datas}">
							<tr>
								<td>${bean.compnyName}</td>
								<td>${bean.meetName}</td>
								<td>${bean.phone}</td>
								<td>${bean.webxin}</td>
								<td>${fn:substring(bean.times, 0, 10)}</td>
								<td>
									<c:if test="${bean.state==1}">约见</c:if>
									<c:if test="${bean.state==2}">送资料</c:if>
									<c:if test="${bean.state==3}">送样品</c:if>
								</td>
								<td>
									<c:if test="${bean.resultState==1}">成交</c:if>
									<c:if test="${bean.resultState==2}">不买</c:if>
									<c:if test="${bean.resultState==3}">未成交</c:if>
									<c:if test="${bean.resultState==4}">待确定</c:if>
								</td>
								<td>
									${bean.fback1}
								</td>
								<%-- <td>
									<c:forEach items="${userList}" var="userList">
										<c:if test="${userList.userID==bean.userId}">
											${userList.userName}
										</c:if>
									</c:forEach>
								</td> --%>
								<td>${bean.vist1}<br /> <%-- ${bean.lastExcelTime} --%> </td>
								<%-- <td><fmt:formatDate value="${bean.birthday}" pattern="yyyy年MM月dd日"/></td> --%>
								
								
								<td>
									<%-- <a href="javascript:void(0)" onclick="lookMeet('${bean.id}')">查看</a> --%>
									<a href="javascript:void(0)" onclick="toUpdateMeet('${bean.id}')">编辑</a>
								
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</div>
</form>
<w:pager pageSize="${pm.pageSize}" pageNo="${pm.pageNo}" url="${path}/action/fileNames/showFileNames" recordCount="${pm.recordCount}" />
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</div>
</body>
</html>
<%-- <fmt:formatNumber value="${userM.testSum }" pattern="#,##0.00#" /> --%>
<%-- <fmt:formatDate value="${bean.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> --%>

</script>








