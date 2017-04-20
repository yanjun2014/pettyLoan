<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/comment/comment.jsp"%>
<link rel="stylesheet" href="${path}/css/default.css" type="text/css" />
<link rel="stylesheet" href="${path}/css/outReg.css" type="text/css" />
<link rel="stylesheet" href="${path}/css/Css.css" type="text/css" />
<link rel="stylesheet" href="${path}/css/combo.select.css" type="text/css" />
<script type="text/javascript" src="${path}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${path}/meet/meet.js"></script>
<script type="text/javascript" src="${path}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/js/jquery.combo.select.js"></script>
<div class="mainbox">
	<div class="box90 bkCenter">
		<div class="infobox">
			<div class="infocontent">
				<input id="basePath" type="hidden" value="${basePath}"/>
				<div class="infotitle">
					<h3>会面${meet.compnyName}</h3>
				</div>
				<div class="infocontent">
					<table id="table1" style="width:100%;" cellpadding="0" cellspacing="0" class="tableList">
						 <tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">联系人：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	<input id="meetName" type="text" value="${meet.meetName}" name="meetName" />
		                    	<input id="id" type="hidden" value="${meet.id}" name="id" />
		                    	<input id="compnyName" type="hidden" value="${meet.compnyName}" name="compnyName" />
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">会面时间：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	<input type="text" value="${meet.times}" id="times" name="times" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH'})" />
		                    </td>
						</tr>
	                    <tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">类型：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	<select	name="meet.state" id="state">
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
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">结果状态：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	<select	name="resultState" id="resultState">
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
		                    </td>
						</tr>
						 <tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">手机：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	<input id="phone" type="text" value="${meet.phone}" name="phone"/>
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">QQ：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	<input id="qq" type="text" value="${meet.qq}" name="qq"/>
		                    </td>
						</tr>
						 <tr>
		                    <td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">会见情况1：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	<input id="vist1" type="text" value="${meet.vist1}" name="vist1" />
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">会见情况2：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	<input id="vist2" type="text" value="${meet.vist2}" name="vist2" />
		                    </td>
						</tr>
						<tr>
		                 	<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">微信：</td>
		                    <td style="padding-top: 2px; padding-left: 2px;" class="style2">
		                    	<input id="webxin" type="text"  name="webxin" value="${meet.webxin}"/>
		                    </td>
							<td style="font-weight: bold; border-right: #ccc 1px solid;" align="right">备注：</td>
		                    <td class="style2" style="padding-top: 2px; padding-left: 2px;">
		                    	<textarea rows="6" cols="40" id="remark" name="remark">${meet.remark}</textarea>
		                    </td>
						</tr>
					</table>
				</div>				
			</div>
		</div>&nbsp;
		<div class="box_btn" align="center">
			<input type="button" value="保&nbsp;&nbsp;存" onclick="updateMeet()"/> 
			<input type="button" id="reset" onclick="window.close()" value="取&nbsp;&nbsp;消"/></br></br>
		</div>
	</div>
</div>
<script>
	/* var strees = [["","园岭街道","南园街道","福田街道","沙头街道","梅林街道","华富街道","香蜜湖街道","莲花街道","华强北街道","福保街道"],
              ["","黄贝街道","南湖街道","桂园街道","东门街道","笋岗街道","翠竹街道","东湖街道","莲塘街道","东晓街道","清水河街道"],
              ["","沙头角街道","海山街道","盐田街道","梅沙街道","","","","","",""],
              ["","南头街道","南山街道","西丽街道","沙河街道","蛇口街道","招商街道","粤海街道","桃源街道","",""],
              ["","新安街道","福永街道","新桥街道","石岩街道","西乡街道","福海街道 ","松岗街道","航城街道","沙井街道","燕罗街道"],
              ["","平湖街道","布吉街道","坂田街道","南湾街道","横岗街道","龙岗街道","龙城街道","坪地街道","",""],
              ["","观湖街道","民治街道","龙华街道","大浪街道","福城街道","观澜街道","","","",""],
              ["","坪山街道","坑梓街道","龙田街道","石井街道","马峦街道","碧岭街道","","","",""],
              ["","光明街道","公明街道","新湖街道","凤凰街道","玉塘街道","马田街道","","","",""],
              ["","葵涌街道","大鹏街道","南澳街道","","","","","","",""]];
	var areas=new Array("福田区","罗湖区","盐田区","南山区","宝安区","龙岗区","龙华区","坪山区","光明新区","大鹏新区");
	window.onload = function() {	
		var area=document.getElementById("area");
		
		for(var i=0;i<10;i++){
			var objOption = document.createElement("OPTION");
			objOption.text=areas[i];
			objOption.value=i;
			area.options.add(objOption); 
		}
		var areaValue=1;
		var stree=document.getElementById("stree");
		for(var j=0;j<=10;j++){
			var objOption = document.createElement("OPTION");
			if(j==0){
				objOption.text="--";
				objOption.value="";
				stree.options.add(objOption); 
			}
			if(strees[areaValue][j]!=""){
				objOption.text=strees[areaValue][j];
				objOption.value=strees[areaValue][j];
				stree.options.add(objOption); 
			}
		}
	}
	function changeArea(){
		$("#stree").empty(); 
		var areaValue=$("#area").val();
		var stree=document.getElementById("stree");
		
		for(var j=0;j<=10;j++){
			var objOption = document.createElement("OPTION");
			if(j==0){
				objOption.text="--";
				objOption.value="";
				stree.options.add(objOption); 
			}
			if(strees[areaValue][j]!=""){
				objOption.text=strees[areaValue][j];
				objOption.value=strees[areaValue][j];
				stree.options.add(objOption); 
			}
		}
	} */

</script>



