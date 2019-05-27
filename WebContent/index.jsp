<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><fmt:message key="system.title"/></title>
</head>
<frameset rows="42,*,20" cols="*" framespacing="0" frameborder="NO" border="0">
  	<frame src="header.jsp" name="topFrame" scrolling="NO" noresize title="topFrame"/>
  	<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="220,10,*" rows="*">
		<frame src="tree.jsp" name="leftFrame" frameborder="yes" scrolling="yes" noresize="" border="0"/>
	  	<frame id="leftbar" scrolling="no" noresize="" name="switchFrame" src="display.jsp"/>
	  	<frame scrolling="yes" noresize="" border="0" name="mainFrame" src="welcome.jsp"/>
	</frameset>
  <frame src="footer.jsp" name="footFrame" scrolling="no" noresize title="footFrame"/>
</frameset>
<noframes>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
</body></noframes>
</html>
