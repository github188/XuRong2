<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.8.2.js"></script>
<link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
<script type="text/javascript" src="js/jquery.treeview.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<script>
$(document).ready(function(){
$("#example").treeview();
});
</script>
<script type="text/javascript">
function checkform()
{
	var m=0;
	if(document.getElementById("wareName").value==""){
		alert("请填写用户名！");
		return false;
	}
	if ($("#wareCheck").val() == "1") {
        alert("用户名重复！");
        return false;
    }
	if(document.getElementById("wareCode").value==""){
		alert("请填写商品编码！");
		return false;
	}
	if(document.getElementById("wareBasePrice").value==""){
		alert("请填写进价！");
		return false;
	}
	if(document.getElementById("passWord").value!=document.getElementById("wareType").value){
		alert("请填写类型！");
		return false;
	}
		
}

function modelCheckAll(name, v){
	var checks = document.getElementsByName(name); 
	if(checks.length)
	{ 
		for(var i=0;i<checks.length;i++) 
		{ 
			checks[i].checked = v; 
		} 
	}
	else
	{ 
		checks.checked = v; 
	} 
}

function allCheck(v){
	var from=document.getElementById("createuser");
	for (var i=0 ; i <from.elements.length;i++)
	{
		if (from.elements[i].type=="checkbox")
		{
			from.elements[i].checked=v;
		}
	}
}

function doAjax(){
    var wName = $("#wareName").val();
    if(wName==""){$("#wareInfo").html("<font color=\"red\">请填写商品名！</font>");$("#wareCheck").val("1");return false;}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_ware_find_3',
        data: JSON.stringify({
            wareName: wName
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#wareInfo").html("<font color=\"red\">您输入的商品名已存在！请重新输入！</font>");
                $("#wareCheck").val("1");
            }
            else {
                $("#wareInfo").html("");
                $("#wareCheck").val("0");
            }
        },
    });
}

</script>
<title>新建用户</title>
</head>
<body>
<div id="main-content">

<font  style="font-family:'微软雅黑'; font-size:30px">添加新商品</font>
<p>&nbsp;</p>

<div class="content-box">

<form id="createuser" name="createuser" action="<c:url value='/do_ware_add_1'/>" method="post" onsubmit="return checkform()">

<input id="wareCheck" type="hidden" value="0"/>
<table>
  <tr>
    <td style="width:15%">商品名称:</td>
    <td><input class="text-input" name="wareName" type="text" id="wareName" onblur="doAjax()"/><font color="red">*</font><span id="wareInfo"></span></td>
  </tr>
 <tr>
    <td>编码:</td>
    <td><input class="text-input" type="text" name="wareCode" id="wareCode"/><font color="red">*</font></td>
  </tr>
  <tr>
    <td>进价:</td>
    <td><input class="text-input" name="wareBasePrice" type="text" id="wareBasePrice" /><font color="red">*</font></td>
  </tr>
  <tr>
    <td>类型:</td>
    <td><input class="text-input" type="text" name="wareType" id="wareType"/><font color="red">*</font></td>
  </tr>
  <tr>
    <td>规格:</td>
    <td><input class="text-input" type="text" name="wareNorm" id="wareNormallll"/><font color="red">*</font></td>
  </tr>
  <tr>
    <td>单位:</td>
    <td><input class="text-input" type="text" name="wareUnit" id="wareUnit"/><font color="red">*</font></td>
  </tr>
   
  <tr>
    <td style="vertical-align: middle;">描述信息:</td>
    <td><textarea name="wareDesc" id="wareDesc" rows="5"></textarea></td>
  </tr>
  <tr>
    <td></td>
    <td>
    <input type="submit" name="Submit" id="Submit" value="提交"  class="button" />
	  <!--   -->
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="reset" value="重置"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_ware_page_3"/>'"/>
    </td>
  </tr>
</table>
</div>
</div>
</body>
</html>