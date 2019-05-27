<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="../common/taglibs.jsp"></jsp:include>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<title></title>
	<style type="text/css">
	body{font-size: 14px;}
	#tab1 td:nth-child(2n+1){text-align: right;width: 30%;}
	div{float: right;}
	#check{float: left;}
	table thead td,th{text-align: center;}
	table thead tr:nth-child(1){background: #ffbd6f;}
	table thead tr th:nth-child(1){ width: 3%;}
	table thead tr th:nth-child(5),table thead tr th:nth-child(6){width: 8%;}
	table tr:nth-child(2n+1){background-color: #faeddc;}
	</style>

<SCRIPT type="text/javascript" src="../jquery/jquery-1.7.js" ></SCRIPT>
<script type="text/javascript" src="../jquery/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="..//My97DatePicker/WdatePicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息列表页</title>
</head>
<body>
<form action="/acrs/message/ProjectAction.a" method="post">
		<table border="0" cellpadding="0" cellspacing="20" align="center" width="100%" bgcolor="#faeddc" id="tab1">
			
			<tr>
				<td>项目名称</td>
				<td>
					<input type="text" id="projectname" name="projectname"/>
				</td>
				<td>模块名称</td>
				<<td>
				<input type="text" id="modulename" name="modulename"/>
				</td>
			</tr>
			<tr>
				<td>修改人</td>
				<td>
					<input type="text" id="modifyperson" name="modifyperson"/>
				</td>
				<td>修改时间</td>
		        <td>
		            <input type="text" onClick="WdatePicker()" id="modifytime" name="modifytime"/>
				</td>
				<td><input name="method" type="submit" id="button" value="查询" id="check"/></td>
			</tr>
		</table>
	</form>
	<br>
	<div id="ajaxDiv">
		<jsp:include page="TestListPage.jsp" />
	</div>
	
<script type="text/javascript">

function enter(){
	if(event.keyCode == 13){
		search();
	}
}
function deleteMessger(){
	var ids = []; 
	$('input[name="id"]:checked').each(function(){ 
		ids.push($(this).val()); 
	}); 
	if(null != ids && ids.length > 0){
		if(confirm("您确定要删除么？")) {
			return true;
		}
	}else{
		alert("请选择一项进行删除");
		return false;
	}
	
}

function updateMessger(){
	var ids = []; 
	$('input[name="id"]:checked').each(function(){ 
		ids.push($(this).val()); 
	}); 
	if(null != ids && ids.length > 0 && ids.length < 2){
	 	if(confirm("您确定要修改么？")) {
	 		return true;
		}
	}else{
		alert("请选择一项进行修改");
		return false;
	}
}
function checkAll(){
	var checkRows = $("input[name='id']:checkbox");
	for(var i=0;i<checkRows.length;i++){
		checkRows[i].checked = !checkRows[i].checked;
	}
}

function dlMessger(){
	var ids = []; 
	$('input[name="id"]:checked').each(function(){ 
		ids.push($(this).val()); 
	}); 
	if(null != ids && ids.length > 0 && ids.length < 2){
	 		return true;
	}else{
		return false;
	}
}


</script>
<script type="text/javascript">
  $(function(){
     $("input[type='button']").css({
		"background":"#f9ae5d",
     });
  });
	
</script>
<script type="text/javascript">
  $(function(){
     $("input[type='submit']").css({
		"background":"#f9ae5d",
     });
  });
	
</script>

</body>
</html>