<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
<script language="javascript" type="text/javascript">
function dosubmit(choose)
{ 
	document.forms["operate"].action= choose;
	document.forms["operate"].submit(); 
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
			if(!confirm("确定分配售货机？")){
				return false;
			}
			else return true;
		}
	}
	alert("请选择售货机！");
	return false;
}
/**
 * function changeclickvalue(){
		monopoly=1;
 }
 */
</script>
<title>查询售货机</title>
</head>
<body>

<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
售货机分配</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value = '/do_map_searchNodeInfoInMysql_4?PageNo=0'/>" method="post" >
<table>
<tr>
<td  style="width:7%">查询条件</td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeId" value="${nodeinfo.nodeId}" id="nodeId"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeName" value="${nodeinfo.nodeName}"/></td>

<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeAddr" value="${nodeinfo.nodeAddr}"/></td>

 <td style="width:10%">
	  	<select name="isAssign" id="isAssign">
	  	<option value="${nodeinfo.isAssign}">
	  		<c:if test="${nodeinfo.isAssign=='1'}">否</c:if>
			<c:if test="${nodeinfo.isAssign=='2'}">是</c:if>
		</option>
		<option value="">请选择</option>
	  	<option value="2">已分配</option>
	  	<option value="1">未分配</option>
	  	</select>
</td>
<td style="width:10%">
	  	<select name="machineType" id="machineType">
	  	<option value="${nodeinfo.machineType}">${nodeinfo.machineType}</option>
	  	<option value="">请选择</option>
	  	<c:forEach items="${mtypelist}" var="mt" >
			<option value="${mt}">${mt}</option>
		</c:forEach>
	  	</select>
</td>
<!-- <td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="macAddr" value="${nodeinfo.macAddr}"/></td> -->

<td  style="width:5%" colspan="1"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%" colspan="1"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
</tr>
</table>
</form>
<form name="operate" action="<c:url value="/do_map_nodes_4"/>" method="post" style="width: 100%" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" width=7%><input type="checkbox" name="chk_all" class="chk_all"/>全选</th>
<th  class="title" style="width:10%">设备编号</th>
<th  class="title" style="width:10%">设备铭牌号</th>
<th  class="title" style="width:10%">设备地址</th>
<th  class="title" style="width:10%">分配已否</th>
<th  class="title" style="width:10%">设备类型</th>

<th  class="title" style="width:10%">主板号</th>
</tr>
</thead>
<tbody>
<c:forEach items="${nilist}"  var="list_vending">
<tr>
<td  style="width:7%"><input type="checkbox" name="check" value="${list_vending.nodeId}"/></td>
<td  style="width:10%">${list_vending.nodeId}</td>
<td  style="width:10%">${list_vending.nodeName}</td>
<td  style="width:10%">${list_vending.nodeAddr}</td>
<td  style="width:10%">
<c:if test="${list_vending.isAssign=='1'}">否</c:if>
<c:if test="${list_vending.isAssign=='2'}">是</c:if>
</td>
<td  style="width:10%">${list_vending.machineType}</td>
<td  style="width:10%">${list_vending.macAddr}</td>
</tr>
</c:forEach>
</tbody>
</table>
<table>
<tr><td style="width:10%">选择用户:</td>
	<td style="width:90%">
	  	<select name="employeeName" id="employeeName" style="width:150px;">
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	  	</select>
  	</td></tr>
  </table>
<br/>
&nbsp;&nbsp;&nbsp;<input type="submit" value="分配" class="button" name="verify"/>
</form>
<div class="pagination">
	共有${length+1-1}页&nbsp; 当前第${PageNo+1}页&nbsp;
	
	<c:if test="${PageNo+1=='1'}">
	<a ><font color="gray">首页</font></a>
	<a ><font color="gray">上一页</font></a>
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_map_searchNodeInfoInMysql_4?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_map_searchNodeInfoInMysql_4?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页</font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_map_searchNodeInfoInMysql_4?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_map_searchNodeInfoInMysql_4?PageNo=${length-1}')">尾页</a>
	</c:if>	
</div>
</div>
</div>
</div>
</body>
</html>