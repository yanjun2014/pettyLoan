$(document).ready(function() {
	init();
});

/**
 * 数据初始化
 */
function init() {
}


function toMeet(fileId) {
	var basePath = $("#basePath").val();
	window.showModalDialog(basePath + "action/meet/toMeet?fileId="+fileId, "",
					"dialogWidth=700px;dialogHeight=400px;status=no;help=no;scrollbars=no");
};

// 添加开发商
function addMeets() {
	/*var areas=new Array("福田区","罗湖区","盐田区","南山区","宝安区","龙岗区","龙华区","坪山区","光明新区","大鹏新区");*/
	var basePath = $("#basePath").val();
	var times = $("#times").val();
	var state = $('#state').val();
	var fileId = $('#fileId').val();
	
	var param = {};
	param["times"] = times;
	param["state"] = state;
	param["fileId"] = fileId;
	
	jQuery.ajax({
		type : "post", // 请求方式
		url : basePath + "action/meet/addMeet", // Ajax访问地址
		data : param, // 参数
		dataType : "json", // 指定返回数据类型
		error : function() { // 出现错误时运行
			alert("保存异常");
		},
		success : function(data) { // 返回成功时运行，主要接受结果
			if (data.success) {
				alert(data.msg);
			} else {
				alert('保存异常');
			}
		}
	});
}

/*function toUpdateCompany(companyID) {
	var basePath = $("#basePath").val();
	var modId = $("#modId").val();
	window.showModalDialog(basePath + "action/company/Company?companyID="
					+ companyID+"&modId="+modId, "",
					"dialogWidth=650px;dialogHeight=350px;status=no;help=no;scrollbars=no");
	lod();
}

*/

function lod() {
	document.getElementById("searchForm").submit();
}

function lookFiles(fid){
	var basePath = $("#basePath").val();
	window.showModalDialog(basePath + "action/fileNames/lookFiles?id="+fid, "",
	"dialogWidth=700px;dialogHeight=350px;status=no;help=no;scrollbars=no");
	
}

function toUpdateMeet(fid){
	var basePath = $("#basePath").val();
	window.showModalDialog(basePath + "action/meet/toUpdate?fid="+fid, "",
	"dialogWidth=750px;dialogHeight=450px;status=no;help=no;scrollbars=no");
	lod();
}


function updateMeet(){
	/*var areas=new Array("福田区","罗湖区","盐田区","南山区","宝安区","龙岗区","龙华区","坪山区","光明新区","大鹏新区");*/
	var id = $("#id").val();
	var basePath = $("#basePath").val();
	
	var meetName = $("#meetName").val();
	var times = $('#times').val();
	var state = $('#state').val();
	var resultState = $('#resultState').val();
	var phone = $('#phone').val();
	var qq = $('#qq').val();
	var vist1 = $('#vist1').val();
	var vist2 = $('#vist2').val();
	var webxin = $('#webxin').val();
	var remark = $('#remark').val();
	var compnyName = $('#compnyName').val();
	
	if (meetName == "" || meetName == null) {
		alert("联系人不能为空");
		return;
	}
	
	

	var param = {};
	param["id"] = id;
	param["meetName"] = meetName;
	param["times"] = times;
	param["state"] = state;
	param["resultState"] = resultState;
	param["phone"] = phone;
	param["qq"] = qq;
	param["vist1"] = vist1;
	param["vist2"] = vist2;
	param["webxin"] = webxin;
	param["remark"] = remark;
	param["compnyName"] = compnyName;
	jQuery.ajax({
		type : "post", // 请求方式
		url : basePath + "action/meet/updateMeet", // Ajax访问地址
		data : param, // 参数
		dataType : "json", // 指定返回数据类型
		error : function() { // 出现错误时运行
			alert("修改异常");
		},
		success : function(data) { // 返回成功时运行，主要接受结果
			if (data.success) {
				alert(data.msg);
				window.close();
			} else {
				alert('修改异常');
			}
		}
	});
}










