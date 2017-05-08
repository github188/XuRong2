<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<link href="css/title.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">

function dosubmit(choose)
{ 
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 
}

function dosearch(choose)
{ 
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 
}

function checkform(){
	var checkboxs=document.getElementsByName("check");
	for(var i=0; i<checkboxs.length;i++){
		if(checkboxs[i].checked)
		{
			if(!confirm("确定要删除记录？")){
				return false;
			}
			else return true;
		}
	}
	alert("请选择记录！");
	return false;
}

</script>
<title>查询出库信息</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
<script type="text/javascript" src="js\My97DatePicker\WdatePicker.js"></script>
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
当月出库单信息查询</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_ship_search_3?PageNo=0"/>" method="post" >
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px">
<td  style="width:9%">
	<select name="employeeName" id="employeeName">
	  	<c:if test="${d.employeeName == ''}"><option value="">请选择</option></c:if>
	  	<c:if test="${d.employeeName != ''}"><option value="${d.employeeName}">${d.employeeName}</option><option value="">请选择</option></c:if>
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
</td>
<td  style="width:9%"><input class="text-input" style="width: 80%" type="text" name="shippingId" value="${d.shippingId}"/></td>
<td  style="width:9%"><input class="text-input" style="width: 80%" type="text" name="moneyThis" value="${d.moneyThis}"/></td>
<td  style="width:9%"><input class="text-input" style="width: 80%" type="text" name="wareHouse" value="${d.wareHouse}"/></td>
<td  style="width:9%"><input class="text-input" style="width: 80%" type="text" name="driverName" value="${d.driverName}"/></td>
<td  style="width:9%"><input class="text-input" style="width: 80%" type="text" name="operator" value="${d.operator}"/></td>
<td  style="width:9%">
<!-- <input class="text-input" style="width: 80%" type="text" name="lastTime" value="${d.lastTime}"/> -->
<input class="text-input" style="width:90%" type="text" name="mintime" value="${ltime}" maxlength="8" onFocus="WdatePicker({dateFmt:'yyyyMMdd'})"/>
</td>
<td style="width:9%">
<input class="text-input" style="width:90%" type="text" name="maxtime" value="${rtime}" maxlength="8" onFocus="WdatePicker({dateFmt:'yyyyMMdd'})"/>
</td>
<td  style="width:5%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<!-- <td  style="width:5%"><input type="button" name="btncreate" id="btncreate" class="button" value="新建" onclick="location.href='<c:url value="/to_ship_addU_1"/>'"></td> -->
</tr>
</table>
</form>        

<form name="operate" action="<c:url value="/do_ship_delete_2"/>" method="post" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:9%">营业员组</th>
<th  class="title" style="width:9%">出库单号</th>
<th  class="title" style="width:9%">出库金额</th>
<th  class="title" style="width:9%">仓库</th>
<th  class="title" style="width:9%">司机</th>
<th  class="title" style="width:9%">营运</th>
<th  class="title" style="width:18%" colspan="2">更新时间</th>
<th  class="title" style="width:5%">操作</th>

</tr>
</thead>
<tbody>
<c:forEach items="${shiplist}"  var="ship" >
<tr>
<td  style="width:9%">${ship.employeeName}<input type="hidden" name="id" value="${ship.id}"></td>
<td  style="width:9%">${ship.shippingId}</td>
<td  style="width:9%">${ship.moneyThis}</td>
<td  style="width:9%">${ship.wareHouse}</td>
<td  style="width:9%">${ship.driverName}</td>
<td  style="width:9%">${ship.operator}</td>
<td  style="width:18%" colspan="2">${ship.lastTime}</td>
<td  class="td_center" width=5%><a href="<c:url value = '/do_ship_view_3?id=${ship.id}'/>" >详情</a></td>
</tr>
</c:forEach>

</tbody>
</table>
</form>
<div class="pagination">
	共有${length}页&nbsp; 当前第${PageNo+1}页&nbsp;	
	<c:if test="${PageNo+1=='1'}">
	<a ><font color="gray">首页   </font></a>
	<a ><font color="gray">上一页</font></a>	
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_ship_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_ship_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}"><!-- action="<c:url value="/do_ship_search_3?PageNo=0"/>" -->
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页    </font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_ship_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_ship_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>

</div>

</div>
</div>
</div>
</body>
</html>