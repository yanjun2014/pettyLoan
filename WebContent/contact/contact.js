$(document).ready(function() {
	init();
});

/**
 * 数据初始化
 */
function init() {
}

/*
 * 删除联系人
 */
function delContact(contactID) {
	var basePath = $("#basePath").val();
	var modId = $("#modId").val();
	if (confirm("确定删除？")) {
		var data = {
			contactID : contactID,
			modId:modId
		};
		jQuery.ajax({
			type : "post", // 请求方式
			url : basePath + "action/contact/delContact", // Ajax访问地址
			data : data, // 参数
			dataType : "json", // 指定返回数据类型
			error : function() { // 出现错误时运行
				alert("出错了");
			},
			success : function(data) { // 返回成功时运行，主要接受结果
				if (data.success) {
					alert(data.msg);
					lod();
					return;
				}
				alert("出错了");
			}
		});
	}
}

function toAddContact() {
	var modId = $("#modId").val();
	var basePath = $("#basePath").val();
	window.showModalDialog(basePath + "action/contact/toAddContact?modId="+modId, "",
					"dialogWidth=650px;dialogHeight=500px;status=no;help=no;scrollbars=no");
	lod();
};

/*
 * 添加联系人
 */
function addContact() {
	var basePath = $("#basePath").val();
	
	var message = $('#message').val();
	var sponsor = $('#sponsor').val();
	var activity = $('#activity').val();
	var activityTime = $('#activityTime').val();
	var activityContent = $('#activityContent').val();
	var rule = $('#rule').val();
	var activityAddress = $('#activityAddress').val();
	
	var contactName = $('#contactName').val();
	var contactTel = $('#contactTel').val();
	var contactEmail = $('#contactEmail').val();
	var contactRemark = $('#contactRemark').val();
	if (activity == "" || activity == null) {
		alert("请填写活动名称");
		return;
	}
	if (contactName == "" || contactName == null) {
		alert("请填写联系人姓名");
		return;
	}
	
	if (contactTel == "" || contactTel == null) {
		alert("请填写联系人电话");
		return;
	}

	var param = {};
	param["contactName"] = contactName;
	param["contactTel"] = contactTel;
	param["contactEmail"] = contactEmail;
	param["contactRemark"] = contactRemark;
	
	param["message"] = message;
	param["sponsor"] = sponsor;
	param["activity"] = activity;
	param["activityTime"] = activityTime;
	param["activityContent"] = activityContent;
	param["rule"] = rule;
	param["activityAddress"] = activityAddress;

	jQuery.ajax({
		type : "post", // 请求方式
		url : basePath + "action/contact/addContact", // Ajax访问地址
		data : param, // 参数
		dataType : "json", // 指定返回数据类型
		error : function() { // 出现错误时运行
			alert("保存异常");
		},
		success : function(data) { // 返回成功时运行，主要接受结果
			if (data.success) {
				alert(data.msg);
				window.close();
			} else {
				alert('保存异常');
			}
		}
	});
}
function look(contactID){
	var basePath = $("#basePath").val();
	var modId = $("#modId").val();
	window.showModalDialog(basePath + "action/contact/look?contactID="+ contactID,
					"dialogWidth=650px;dialogHeight=500px;status=no;help=no;scrollbars=no");
	lod();
}
function toUpdateContact(contactID) {
	var basePath = $("#basePath").val();
	var modId = $("#modId").val();
	window.showModalDialog(basePath + "action/contact/toUpdateContact?contactID="
					+ contactID+"&modId="+modId, "",
					"dialogWidth=650px;dialogHeight=500px;status=no;help=no;scrollbars=no");
	lod();
}

function updateContact() {
	
	var contactID = $("#contactID").val();
	var basePath = $("#basePath").val();
	var contactName = $('#contactName').val();
	var contactTel = $('#contactTel').val();
	var contactEmail = $('#contactEmail').val();
	var contactRemark = $('#contactRemark').val();
	
	var message = $('#message').val();
	var sponsor = $('#sponsor').val();
	var activity = $('#activity').val();
	var activityTime = $('#activityTime').val();
	var activityContent = $('#activityContent').val();
	var rule = $('#rule').val();
	var activityAddress = $('#activityAddress').val();
	
	if (activity == "" || activity == null) {
		alert("请填写活动名称");
		return;
	}
	if (contactName == "" || contactName == null) {
		alert("请填写联系人姓名");
		return;
	}
	
	if (contactTel == "" || contactTel == null) {
		alert("请填写联系人电话");
		return;
	}

	var param = {
		contactID : contactID,
		contactName : contactName,
		contactTel : contactTel,
		contactEmail : contactEmail,
		contactRemark : contactRemark,
		message:message,
		sponsor:sponsor,
		activity:activity,
		activityTime:activityTime,
		activityContent:activityContent,
		rule:rule,
		activityAddress:activityAddress
	};

	jQuery.ajax({
		type : "post", // 请求方式
		url : basePath + "action/contact/updateContact", // Ajax访问地址
		data : param, // 参数
		dataType : "json", // 指定返回数据类型
		error : function() { // 出现错误时运行
			alert("保存异常");
		},
		success : function(data) { // 返回成功时运行，主要接受结果
			if (data.success) {
				alert(data.msg);
				parent.window.returnValue = data.msg; // 父窗口就是上一个页面
				window.close();
			} else {
				alert('保存异常');
			}
		}
	});
}

function lod() {
	var basePath = $("#basePath").val();
	var modId = $("#modId").val();
	var data = {modId:modId};
	$.post(basePath + "action/contact/goContactList", data, function(data) {
		$("#userinfoContainer").html(data);
		}, 'html');
}
