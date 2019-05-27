<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>         
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="system.title"/></title>
<link href="${ctx }/css/becom_global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_library.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_master.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/szhxy.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.style1 {color: #FF0000}
.style2 {font-size: 12px}
.style3 {
	font-size: 14px;
	font-weight: bold;
	color: #003399;
}
</style>
</head>

<body>
<form action="ChangePasswordAction.a" method="POST">
<input type="hidden" name="isClick" value="${isClick}" />
<div id="main">
<div id="titlearea">
  <h1>当前操作：</h1>
  <h2>修改密码</h2>
    <c:if test="${not empty error}"><div id="errormsg">${error}</div></c:if> 
    <c:if test="${not empty message}"><div id="successmsg">${message}</div></c:if>
  </div>
  <div id="searcharea">
<table width="350" border="0" cellspacing="1" cellpadding="0">
  <tr>
    <td height="30" colspan="2"><div align="center" class="style3">修改密码</div></td>
  </tr>
  <tr>
    <td><div align="right" class="style2">原密码：</div></td>
    <td>
      <div align="left">
        <input type="password" name="oldPassword" value="${oldPassword }">
        <span class="style1">*</span></div></td>
  </tr>
  <tr>
    <td><div align="right" class="style2">新密码：</div></td>
    <td><div align="left">
      <input type="password" name="newPassword" value="${newPassword }">
      <span class="style1">*</span></div></td>
  </tr>
  <tr>
    <td><div align="right" class="style2">重复新密码：</div></td>
    <td><div align="left">
      <input type="password" name="confirmPassword" value="${confirmPassword }">
      <span class="style1">*</span></div></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    <input class="btnsearch_mouseout" onmouseover="this.className='btnsearch_mouseover'" onmouseout="this.className='btnsearch_mouseout'"  name="doSave" type="submit" id="button" value=" 确定 " />
    <input class="btnsearch_mouseout" onmouseover="this.className='btnsearch_mouseover'" onmouseout="this.className='btnsearch_mouseout'"  type="button" id="button" value=" 关闭 " onclick="window.close();"/>
    </td>
  </tr>
</table>
</div>
</div>
</form>
</body>
</html>
