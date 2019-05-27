<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=7" /> 
<meta name="copyright" content="北控软件版权所有"/>
<title><fmt:message key="system.title"/></title>
<link href="${ctx }/css/becom_global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_login.css" rel="stylesheet" type="text/css" /></link>
<link href="${ctx }/css/becom_library.css" rel="stylesheet" type="text/css" />
<style>
.width160{
	width:160px;
}
</style>
<script src="${ctx}/js/func.js" type="text/javascript" ></script>

<script type="text/javascript">
	if(self!=top){top.location=self.location;}
	window.document.onkeydown = function (){
		if (event.keyCode==13)
		{
			checkForm();
		}
	};
	
	function ico_refresh()
	{
		$$("checkCodeId").src = "${ctx}/captcha.jpg?loginPoint=loginPoint&random="+Math.random();
	}
	
	function checkForm()
	{
		var frm = document.forms[0];
		frm.j_username.value = frm.j_username.value.trim();
	    //判断登录名是否填写。
	    if (frm.j_username.value.trim() == "")
	    {
	        frm.j_username.focus();
	        alert("请填写用户名。");
	        return false;
	    }
	   
	    //判断密码是否填写。
	     frm.j_password.value = frm.j_password.value.trim();
	    if (frm.j_password.value.trim() == "")
	    {
	        frm.j_password.focus();
	        alert("请填写密码。");
	        return false;
	    }
	    //判断验证码是否填写。
    	if ($$("j_captcha_response").value.trim() == "")
    	{
    		alert("请输入验证码。");
    		$$("j_captcha_response").focus();
    		return false;
    	}
		document.loginForm.submit();
	}

	function init()
	{
		$$("j_username").focus(); 
		ico_refresh();
	}
	<%
	//初始化session中的验证码
	String error = request.getParameter("error");
	if (error != null) {
		if ("user_psw_error".equals(error)) {
			error = "用户名或密码错误！";
		} else if ("is_not_userd_error".equals(error)) {
			error = "用户已被禁用，请联系管理员！";
		} else if ("too_many_user_error".equals(error)) {
			error = "登录用户过多，请稍候重试！";
		} else if ("db_error".equals(error)) {
			error = "数据库无法连接！";
		} else if ("check_code_error".equals(error)) {
			error = "验证码错误！";
		}else {
			error = "系统暂时无法访问，请稍候重试！";
		}%>
		alert("<%=error%>");
		<% 
	}	
	%> 
</script>
</head>
<body onload="init();">
<form name="loginForm" method="post" action="${ctx}/j_acegi_security_check">
<div id="contanier">
<div id="login">
	<div id="baseid"></div>
	<div id="form">
		<div id="form_user">
			<div class="l">用户名</div>
			<span class="r dl"> 
			<input name="j_username" type="text" class="input_color2 width160" id="j_username">
			</span>
		</div>
		<div id="form_psw">
			<div class="l">密&nbsp;&nbsp;码</div>
			<span class="r dl"> 
			<input type="password" name="j_password" class="input_color2 width160"/>
			</span>
		</div>
		<div id="form_sn">
			<div class="l">验证码</div>
			<div class="r dl">
				<input name="j_captcha_response" type="text" class="input_color2" id="j_captcha_response" style="width: 85px;">
				<span class="hint_garygreen2">请输入正确的验证码</span>
				<div class="r_number">
					<a href="#" onclick="ico_refresh();">
					<img id="checkCodeId" src="" alt="看不清？请点击刷新！" />
					</a>
				</div>
			</div>
		</div>
		<div id="form_submit">
			<input type="button" class="btn_img18" value="登录" onclick="checkForm();"/>
		</div>
	</div>
</div>
<div id="copyrights">版权所有(C) 2012 北控软件有限公司</div>
</div>
</form>
</body>
</html>
