<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="/acrs/message/ProjectAction.a" id=""  method="post">
<c:if test="${!empty list}">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/acrs/message/addTest.jsp"><input type="button" value="添加"></input></a>
		<input type="submit" name="delete" onclick="return deleteMessger()" value="删除" />
		<input type="submit" name="flinListById" onclick="return updateMessger()" value="修改" />
		<input type="submit" name="dl" onclick="return dlMessger()" value="下载" />
		<table border="1" cellpadding="0" cellspacing="0" align="center" width="100%" bordercolor="#e9dfd3" height="300px">
			<thead>
			
			<tr>
				<th>
					<input type="checkbox" onchange="checkAll()"/>选项
				</th>
				<th>编号</th>
				<th>项目名称</th>
				<th>模块名称</th>
				<th>修改内容</th>
				<th>修改时间</th>
				<th>修改人</th>
				<th>修改备注</th>
				<th>附件名称</th>
			</tr>
			<c:forEach items="${list}" var="test">
				<tr>
					<th>
						<input type="checkbox" name="id" onchange="changeColor()" value="${test.id}"/>
					</th>
					<th>${test.id}</th>
					<th>${test.projectname}</th>
					<th>${test.modulename}</th>
					<th>${test.modifycontent}</th>
					<th>${test.modifytime}</th>
					<th>${test.modifyperson}</th>
					<th>${test.remarks}</th>
					<th>${test.enclosure}</th>
					
				</tr>
			</c:forEach>
		</table>
	<br/>
		
</c:if>

</form>