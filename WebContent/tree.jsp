<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="system.title"/></title>
<link href="${ctx }/css/becom_global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_layout.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_tree.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/becom_library.css" rel="stylesheet" type="text/css" />
<style>
body {
	background-color: #c3e1ff;
	font:12px Tahoma;
}
.menu{
	background-repeat: no-repeat;
	background-position: bottom;
}
</style>
<script type="text/javascript" src="${ctx }/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${ctx }/jquery/jquery.ztree.core-3.3.min.js"></script>
<script type="text/javascript">
function resizeheight(){
	try{
		var h=parent.document.body.clientHeight-185-179;
		var sh=document.getElementById("nav").scrollHeight;
		if(sh<h){
			$("#nav").height(h);
		}else{
			$("#nav").height(sh);
		}	
		setTimeout("resizeheight()",100);
	}catch(e){
		setTimeout("resizeheight()",1000);
	}
}
var zTree;

var setting = {
	view: {
		expandSpeed: ($.browser.msie && parseInt($.browser.version)<=6)?"":"fast"
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("nav");
			if (treeNode.isParent) {
				var isOpen=treeNode.open;
				zTree.expandAll(false);
				if(isOpen==false)
					zTree.expandNode(treeNode);
				return false;
			}
		}
	}
};
$(document).ready(function(){
	$.post("${ctx }/MenuAction.a",
			   function(zNodes){
				   zTree=$.fn.zTree.init($("#nav"), setting, zNodes);
			   },'json');
});
</script>
</head>
<body onload="resizeheight()">
<div id="contanier">
  <div id="tree">
    <div id="treetitle">你好：${user.name }</div>
    <div id="treelist" style="height:auto; ">
      <div class="spaceline5"></div>
      <table width="170"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#e2e2e2">
        <tr>
          <td bgcolor="#f3f3f3" align="left">
            <ul id="nav"></ul>
            <img src="images/pic_treefooter.jpg" width="174" height="179">
            </td>
        </tr>
      </table>
      <div id="treefooter" style=" color:#555555; text-align:center;">
      <script language="JavaScript" src="${ctx }/js/time.js" type="text/javascript"></script>
    </div>
    </div>
  </div>
</div>
</body>
</html>
