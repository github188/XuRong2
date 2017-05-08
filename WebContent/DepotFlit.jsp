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
<script src="js/jquery-1.8.2.js" type="text/javascript" ></script>
<script type="text/javascript">

function srcToDest(srcid,destid){   
	if(document.getElementById("fileNum").value==""){
		alert("请填写调拨数量！");
		return false;
	}
	var a = document.getElementById("fileNum").value;
	var b = document.getElementById("selectsrcid");
	var c = document.getElementById("selectsrcid").options[b.selectedIndex].value;
	var d = c.split("_")[1].split("-")[0];

	if(parseInt(a) > parseInt(d)) {
		alert("调拨数量过大！");
		return false;
	}
	
	var e = c.split("_")[0]+" _ "+(parseInt(d)-parseInt(a));
	var f = c.split("_")[0]+" _ "+(parseInt(d)-parseInt(a))+"-"+c.split("-")[1];
	document.getElementById("selectsrcid").options[b.selectedIndex].text = e;
	document.getElementById("selectsrcid").options[b.selectedIndex].value = f;
	
	e = c.split("_")[0]+" _ "+parseInt(a);
	f = c.split("_")[0]+" _ "+parseInt(a)+"-"+c.split("-")[1];
	var g = document.getElementById("selectdestid");
	var i;
	var aa,bb,cc;
	for(i=0;i<g.length;i++) {
		aa = g.options[i].text;
		bb = aa.split("_")[0].trim();
		cc= e.split("_")[0].trim();
		
		if(bb == cc)
			break;
	}
	if(i<g.length) {
		g.options[i].text = g.options[i].text.split("_")[0]+"_"+(parseInt(g.options[i].text.split("_")[1])+parseInt(a));
		g.options[i].value = g.options[i].text+"-"+g.options[i].value.split("-")[1];
	}
	else
		addoptions(destid,e,f);	
}

//向目标   
function addoptions(objectid,textvalue,optionsvalue){   
	var optionsSubObjects=document.getElementById(objectid);   
	var hasexist=0;   
	for(var o=0;o<optionsSubObjects.length;o++)   
	{   
		var optionsvalue_sub=optionsSubObjects.options[o].text;   
		if(optionsvalue_sub==textvalue)   
		hasexist+=1;   
	}   
	if(hasexist==0)   
	{   
		optionsSubObjects.add(new Option(textvalue, optionsvalue));   
	}   
}   
  
  
//将对象中所选的项删除   
  
function destToSrc(objectid)   
{   
	var optionsObjects=document.getElementById(objectid);   
	  
	for(var o=0;o<optionsObjects.length;o++)   
	{   
		if(optionsObjects.options[o].selected==true)   
 		{   
			var optionsvalue=optionsObjects.options[o].value;   
			var optionstext=optionsObjects.options[o].text;   
			removeoption(objectid,optionstext,optionsvalue);
			
			var b = document.getElementById("selectsrcid");
			
			var i;
			for(i=0;i<b.length;b++) {
				if(b.options[i].text.split("_")[0].trim() == optionstext.split("_")[0].trim())
				break;
			}
			
			b.options[i].text = b.options[i].text.split("_")[0]+"_"+(parseInt(b.options[i].text.split("_")[1])+parseInt(optionstext.split("_")[1]));
		}   b.options[i].value = b.options[i].text+"-"+b.options[i].value.split("-")[1];
	}   
}   
  
  
//删除单个选项   
function removeoption(objectid,textvalue,optionsvalue)   
{   
	var optionsSubObjects=document.getElementById(objectid);   
	for(var o=0;o<optionsSubObjects.length;o++)   
	{   
		var optionsvalue_sub=optionsSubObjects.options[o].text;   
		if(optionsvalue_sub==textvalue)   
			optionsSubObjects.options.remove(o);    
	}   
}   

function removeAll(objectid)
{
	//alert("removeAll(objectid)");
	//var optionsSubObjects=document.getElementById(objectid);   
	//optionsSubObjects.options.length=0;
	document.getElementById(objectid).objSelect.options.length = 0;
}

function removeAllSel()
{
	//alert("removeAll start");
	//var optionsSubObjects=document.getElementById(objectid);   
	//optionsSubObjects.options.length=0;
	document.getElementById("selectsrcid").options.length = 0;//objSelect.
	//alert("removeAll over");
}

function moveOption(obj){   
	var oListbox=document.getElementById("selectdestid");   
	if(oListbox==null){        
		return;    
		}   
	if(oListbox.selectedIndex<0){       
		//没选        
		alert("请选择要移动的项");        
		return;    
		}
	var op=oListbox.options[oListbox.selectedIndex];//当前选中的项    
	var downOp;    
	if(obj=="up"){        
		if(oListbox.selectedIndex==0)       
		{           
			alert("已经是第一个");           
             return;        
             }        
		downOp=oListbox.options[oListbox.selectedIndex-1];        
		oListbox.insertBefore(op,downOp);    
		}    
	else if(obj=="down"){       
		if(oListbox.selectedIndex==oListbox.options.length-1){           
			alert("已经是最后一个");            
			return;        
			}        
		downOp=oListbox.options[oListbox.selectedIndex+1];        
		oListbox.insertBefore(downOp,op);    
		}
	} 

	function selectall(){
		var selectedComs = document.getElementById("selectdestid");
		for(var i=0;i<selectedComs.length;i++){
			selectedComs.options[i].selected = true;
		}
	}
	
	function checkform()
	{
	if(document.getElementById("employeeName2").value == "") {
		alert("请选择一个调拨对象");
		return false;
	}
	if(document.getElementById("selectdestid").options.length == 0){
		alert("请选择调拨商品");
		return false;
	}
	var result = "";
	var sel = document.getElementById("selectdestid");

	for(var i=0;i<sel.options.length;i++)
	{
//		alert(sel.options[i].value);  //获取option的value
//      alert(sel.options[i].text);  //获取显示的文本信息
		result += sel.options[i].value;
		result += ";";
	}

	document.getElementById("results").value = result.substring(0,result.length-1) ;
	
	/*return false;
	var tableRows = document.getElementById("table").childNodes[1].rows;
		
	for(var i=2; i<tableRows.length;i++) {
	
		var wareNum = tableRows[i].childNodes[6].childNodes[0].value;
		if(parseInt(wareNum)<=0)
			continue;
			
		var wareName = tableRows[i].childNodes[0].childNodes[0].value;		
		var warePrice = tableRows[i].childNodes[2].childNodes[0].value;
		
		result += "-" + wareName+"_" + wareNum+"_" + warePrice;
	}    
	
	document.getElementById("results").value = result.substring(1, result.length);
	*/
}

function doAjax(){
	//alert("doAjax start");
//	removeAll("selectsrcid");
	removeAllSel();
    var employeeName = $("#employeeName1").val();
    //alert(employeeName);
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_depot_searchByJSon_3',
        data: JSON.stringify({
        	employeeName: employeeName
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "true") {
            	$.each(data.wareList, function(i, item) { 
            		var a = item.split(",")[0];   				
    				var str="<option value='"+item+"'>"+item.split("-")[0]+"</option>";
    				$("#selectsrcid").append(str);
    			});
            }
            else {
            }
        },
    });
    //alert("doAjax over");
}

function doAjax2(){
	removeAll();
    var employeeName = $("#employeeName3").val();
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_depot_searchByJSon_3',
        data: JSON.stringify({
        	employeeName: employeeName
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "true") {
            	$.each(data.wareList, function(i, item) {             		
    				var table = document.getElementById("table"); 
    				var TR = table.insertRow(); 
    				
    				var TD = TR.insertCell(); 
    				TD.innerHTML = "<input type='text' value='"+item.split("_")[0]+"'/>";  
    				
    				TD = TR.insertCell(); 
    				TD.innerHTML = "<input type='text' value='"+item.split("_")[1].split("-")[0]+"'/>"; 
    				
    				TD = TR.insertCell(); 
    				TD.innerHTML = "<input type='text' value='"+item.split("-")[1]+"'/>"; 
    				
    				TD = TR.insertCell(); 
    				TD.innerHTML = "<input type='text'/>"; 
    				
    				TD = TR.insertCell(); 
    				TD.innerHTML = "<input type='button' value='添加' onClick='fun1()'/>"; 
    				
    				TD = TR.insertCell(); 
    				TD.innerHTML = "<input type='button' value='撤销' onClick='fun2()'/>"; 
    				
    				TD = TR.insertCell(); 
    				TD.innerHTML = "<input type='text' value='0'/>";
    			});
            }
            else {
            }
        },
    });
}

function removeAll() {
	var table = document.getElementById("table");
	
	var rowscount = table.rows.length;

	for(var i=rowscount - 1;i > 1; i--){
		table.deleteRow(i);
	}
}

function fun1() {
	var a = event.srcElement;
	
	var srcNum = parseInt(a.parentNode.parentNode.childNodes[1].childNodes[0].value);		
	var plusNum = parseInt(a.parentNode.parentNode.childNodes[3].childNodes[0].value == ""?"0":a.parentNode.parentNode.childNodes[3].childNodes[0].value);
	var destNum = parseInt(a.parentNode.parentNode.childNodes[6].childNodes[0].value);
	
	if(plusNum > srcNum) {
		alert("调拨数量过大！");
		return false;
	}
	
	a.parentNode.parentNode.childNodes[6].childNodes[0].value = destNum + plusNum;	
	a.parentNode.parentNode.childNodes[3].childNodes[0].value = "";
	a.parentNode.parentNode.childNodes[1].childNodes[0].value = srcNum - plusNum;	
}

function fun2() {
	var a = event.srcElement;
	
	var srcNum = parseInt(a.parentNode.parentNode.childNodes[1].childNodes[0].value);
	var destNum = parseInt(a.parentNode.parentNode.childNodes[6].childNodes[0].value);
	
	a.parentNode.parentNode.childNodes[6].childNodes[0].value = 0;	
	a.parentNode.parentNode.childNodes[1].childNodes[0].value = srcNum + destNum;	
}
</script>
<title>新建商品品牌</title>
</head>
<body>
<div id="main-content">
<font style="font-family:'微软雅黑'; font-size:30px">
商品调拨
</font>
<p>&nbsp;</p>
<div class="content-box" align="center">

<div align="center">
<form  action="<c:url value='/do_depot_flit_1'/>" name="operate" id="operate" method="post"  onSubmit="return checkform()">
 <input id="results" name="results" type="hidden"/>

  <table  style="line-height:20px;">
  	<tr><td>商品调拨：</td>
  	</tr>
    <tr>
    <td style="vertical-align: middle; width:30%">
     <div style="width:auto; margin:5px; padding:0px">
     
     	员工：&nbsp;
     <select name="employeeName1" id="employeeName1" >	  	
	  	<option value="">请选择</option>
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
	<input type="button" value="查询" onclick="doAjax()"  />
	</div>  
    
     <select size="15" multiple="multiple" name="selectsrcid" id="selectsrcid" style="width:200px">
     </select>
     </td>
      <td style="vertical-align: middle; width:5%">
      <div style="width:auto;height:130px; color:#FF0000;" align="justify">
      <p>调拨数量
      <p><input type="text" id="fileNum" style="width: 67px; ">
      <p>&nbsp;</p>
      <input type="button" value="添加"  onClick="srcToDest('selectsrcid','selectdestid')" class="button">
      <p>&nbsp;</p>
      <input  name="but_l" type="button"  value="撤销" onClick="destToSrc('selectdestid')" class="button">
   	  <p/>
     </div>     
     </td>
     <td>
     <div style="width:auto; margin:5px; padding:0px">


     员工：&nbsp;
     <select name="employeeName2" id="employeeName2">	  	
	  	<option value="">请选择</option>
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
     
     
     </div>
     <select name="destid" size="15" multiple="multiple" id="selectdestid" style="width:200px; height: 250px">

        </select>
     </td>
   </tr>
  </table>
<div align="center">
    <input type="submit" id="commit" value="提交"  class="button"/>
</div>
</form>
</div>
</div>
</div>
</body>
</html>