<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT type="text/javascript" src="../jquery/jquery-1.7.js" ></SCRIPT>
<link rel="stylesheet" href="../js/validform/css/demo.css" type="text/css" media="all"/>
<link rel="stylesheet" href="../js/validform/css/style.css" type="text/css" media="all"/>
<script type="text/javascript" src="../js/validform/js/Validform_v5.3.2.js"></script>
<script type="text/javascript"src="../js/validform/plugin/passwordStrength/passwordStrength-min.js"></script>
<script type="text/javascript" src="../js/validform/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/validform/js/Validform_v5.3.2_min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form id="regform" action="${ctx}/acrs/message/ProjectAction.a" method="post">
<table border="0" cellpadding="0" cellspacing="20" align="center" width="50%" bgcolor="#faeddc">

<c:if test="${not empty  list}">
<c:forEach items="${list}" var="test">
	<tr>
		<td>项目名称:</td>
		<td><input type="text" name="projectname" value="${test.projectname}" class="inputxt" datatype="s6-10" errormsg="昵称至少6个字符,最多10个字符"/></td>
		<td><div class="Validform_checktip">昵称为6~10个字符</div></td>
	</tr>
	<input type="hidden" name="proId" value="${test.id}"/>
	<tr>
		<td>模块名称:</td>
		<td><input type="text" name="modulename" value="${test.modulename}" class="inputxt" datatype="s5-10" errormsg="请输入5-10位,只能是数字和字符"></td>
		<td><div class="Validform_checktip">请输入5-10位,只能是数字和字</div></td>
	</tr>
	<tr>
		<td>修改内容:</td>
		<td><input type="text" name="modifycontent" value="${test.modifycontent}" class="inputxt" datatype="s6-20" tip="请在这里输入您修改的内容", errormsg="请输入6-20位,只能是数字和字符"></td>
		<td><div class="Validform_checktip">请输入6-20位,只能是数字和字符</div></td>
	</tr>
	<tr>
		<td>修改人</td>
		<td><input type="text" name="modifyperson" value="${test.modifyperson}" class="inputxt" datatype="/^[\u4e00-\u9fa5]{2,4}$/" errormsg="请填写2-4位中文或字母"/>
		<td><div class="Validform_checktip">请填写2-4位中文或字母</div></td>
	</tr>
	<tr>
		<td>备注</td>
		<td><input type="text" name="remarks" value="${test.remarks }" >
	</tr>
	</c:forEach>
	</c:if>
	<tr>
		<td>附件:</td>
		<td>
			<input type="file" name="attachFiles"><br>
			${test.enclosure }
		</td>
	</tr>
	
	<tr>
		<td></td>
		<td><input type="submit" name="doSave" value="提交数据"></td>
	</tr>
</table>
</form>
</body>
<script type="text/javascript">
	var demo = $("#regform").Validform({
		/*tiptype为提示方式,参数有1-4 默认为1  */
		tiptype:1,
		showAllError:true,
		label:".globle_alert",
		/* ajaxPost:true, */
		 datatype:{
			 //指定绑定规则
			"modifyperson":/^[u4e00-u9fa5]{2,4}$/,
		},
	});
</script>

</html>