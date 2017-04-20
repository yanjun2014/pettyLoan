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
<script type="text/javascript" src="${path}/contract/contract.js"></script>
<input id="basePath" type="hidden" value="${basePath}"/>

<form action="${path}/action/contract/uploadContractTemplate" name="contractForm" method="post" enctype="multipart/form-data">
<table style="width:100%;" class="tableList">
	<tr>
    	<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">上传文件：</td>
        <td style="padding-top: 2px; padding-left: 2px;" class="style2">
        	<input type="file" id="uploadFile" name="uploadFile">
    	</td>
	</tr>
	<tr>
    	<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">文件名：</td>
        <td style="padding-top: 2px; padding-left: 2px;" class="style2">
        	<input type="text" id="fileName" name="fileName">
        	<input type="submit" value="上传" class="ui_input_btn01"/>
    	</td>
	</tr>
</table>
</form>