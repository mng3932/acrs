<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %> 
<html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="author" content="becom"/>
<meta name="copyright" content="北控软件版权所有"/>
<title><fmt:message key="system.title"/></title>
<script src="js/display.js" type="text/javascript"></script>
</head>
<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bgcolor="#000000" onload="load()">
<center>
<table width="100%" style="height:600px;" border="0" cellpadding="0"
	cellspacing="0" background="images/bg_display.gif">
	<tbody>
		<tr>
			<td><img height="1" width="1"
				src="images/ccc.gif" /></td>
			<td id="leftbar" style="display: none;"><a
				onClick="switchSysBar()" href="javascript:void(0);"> <img
				height="53" border="0" width="9" alt="展开左侧菜单"
				src="images/ico_display_open.gif" /></a></td>
			<td id="rightbar"><a onClick="switchSysBar()"
				href="javascript:void(0);"> <img height="53" border="0"
				width="9" alt="隐藏左侧菜单" src="images/ico_display_cls.gif" /></a></td>
		</tr>
	</tbody>
</table>
</center>
</body>
</html>
