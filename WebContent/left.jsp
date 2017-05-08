<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
<script src="js/jquery-1.8.2.js" type="text/javascript" ></script> 
<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
<script language=javascript>
/*
window.onload=function(){
	
	var rname = $("#roleName").attr("value");
	
	if(rname!="营业员"&&rname!="仓库管理员"&&rname!="财务管理员"){//系统管理，不隐藏
		
	}else if(rname=="营业员"){
		$("#ust").hide();//user
		$("#nit").hide();//nodeinfo
		$("#wit").hide();//wareinfo
		$("#cit").hide();//channelinfo
		$("#nmt").hide();//nodemap
		$("#pvt").hide();//paramversion
		$("#dit").hide();//depot
		$("#mit").hide();//money
	}else if(rname=="仓库管理员"){
		$("#ust").hide();//user
		$("#nit").hide();//nodeinfo
		$("#wit").hide();//wareinfo
		$("#cit").hide();//channelinfo
		$("#nmt").hide();//nodemap
		$("#pvt").hide();//paramversion
		$("#yyt").hide();//营业员
		$("#mit").hide();//money	
	}else{
		$("#ust").hide();//user
		$("#nit").hide();//nodeinfo
		$("#wit").hide();//wareinfo
		$("#cit").hide();//channelinfo
		$("#nmt").hide();//nodemap
		$("#pvt").hide();//paramversion
		$("#yyt").hide();//营业员
		$("#dit").hide();//depot
	}
};
*/
</script>
</HEAD>
<BODY background=images/menu_bg.jpg>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=180 border=0 id="all">
  <TR>
    <TD vAlign=top align=center width="100%" >
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 id="top">
        <TR><TD height=10><input value="<%=session.getAttribute("mrname")%>" name="roleName" id="roleName" type="hidden"/></TD></TR></TABLE>

<TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="ust">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(1) 
            href="javascript:void(0);">用户管理</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
          
	<TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0  id="ustc">
  	<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A href="<c:url value="/to_user_page_3"/>" class=menuParent target="right">用户管理</a></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A href="<c:url value="/to_group_page_3"/>" class=menuParent target="right">用户组管理</a></TD></TR>
           <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A href="<c:url value="/do_role_search_3"/>" class=menuParent target="right">角色管理</a></TD></TR>
          <!-- 
          <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A href="<c:url value="/to_pwd_page_0"/>" class=menuParent target="right">修改密码</a></TD></TR>
           -->
	</TABLE>

<TABLE cellSpacing="0" cellPadding="0" width="150" border="0" id="pit">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='/to_pwd_page_0'/>" target="right">修改密码</A></TD></TR>
        <TR height="4">
          <TD/></TR></TABLE>
<!-- 
<TABLE cellSpacing="0" cellPadding="0" width="150" border="0" id="nit">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='/to_node_page_3'/>" target="right">售货机信息管理</A></TD></TR>
        <TR height="4">
          <TD/></TR></TABLE>
 -->
<TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="nit">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(8) 
            href="javascript:void(0);">售货机管理</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
          
	<TABLE id=child8 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0 id="nitc">
  		<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A href="<c:url value="/to_node_page_3"/>" class="menuParent" target="right">售货机查询</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_node_add_1'/>"  class=menuParent  target="right">添加售货机</a></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_channelgroup_page_3'/>"  class=menuParent  target="right">货道组查询</a></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_channelgroup_add_1'/>"  class=menuParent  target="right">添加货道组</a></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_channelgroup_addchann_1'/>"  class=menuParent  target="right">货道组添加货道</a></TD></TR>
        <!-- 
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_channelgroup_alledit_0'/>"  class=menuParent  target="right">编辑货道组</a></TD></TR>
        -->
        </TABLE>
                    
<TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="cit">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(2) 
            href="javascript:void(0);">货道管理</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
          
	<TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0 id="citc">
  		<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A href="<c:url value="/to_channel_page_3"/>" class="menuParent" target="right">货道信息查询</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_channelhis_page_3'/>"  class=menuParent  target="right">货道历史管理</a></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_prochannel_editnormalstock_0'/>"  class=menuParent  target="right">编辑最大数量</a></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><a href="<c:url value='/to_prochannel_updateinc_0'/>"  class=menuParent  target="right">增量更新库存</a></TD></TR>
	</TABLE>

	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="nmt">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(3) 
            href="javascript:void(0);">售货机配置</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
          
		<TABLE id=child3 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0 id="nmtc">
		<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_map_page_3'/>" target="right">售货机配置查询</A></TD></TR>
  		<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_map_nodepage_4'/>" target="right">售货机配置</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_map_gigrouppage_4'/>" target="right">售货机组配置</A></TD></TR>
       <!-- 
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/do_map_searchnodeInParamVersion_4'/>" target="right">当前售货机配置</A></TD></TR>
           
           <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_map_pvgrouppage_4'/>" target="right">当前售货机组配置</A></TD></TR>
       -->
	</TABLE>
	<TABLE cellSpacing="0" cellPadding="0" width="150" border="0" id="wit">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='/to_ware_page_3'/>" target="right">商品管理</A></TD></TR>
        <TR height="4">
          <TD/></TR></TABLE>
          
	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="pvt">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(4) 
            href="javascript:void(0);">系统管理</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
          
		<TABLE id=child4 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0 id="pvtc">
  		<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_optemp_page_3'/>" target="right">临时表管理</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_import_page_3'/>" target="right">信息导入管理</A></TD></TR>
		</TABLE>
   
   	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="dit">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(5) 
            href="javascript:void(0);">仓库管理</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
		<TABLE id=child5 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0 id="ditc">
		<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_depot_addU_1'/>" target="right">仓库出货</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_depot_flit_1'/>" target="right">调拨</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_stock_checkpage_3'/>" target="right">货物清算</A></TD></TR>
        <!--
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_stock_checkByNode_3'/>" target="right">分机器清算</A></TD></TR>
         -->
        
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_depot_page_3'/>" target="right">出库信息查询</A></TD></TR>
          <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_ship_page_3'/>" target="right">订单查询打印</A></TD></TR>
      </TABLE>
		
     <TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="mit">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(6) 
            href="javascript:void(0);">财务管理</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
		<TABLE id=child6 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0 id="mitc">
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_money_AddUN_0'/>" target="right">营业额上缴</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_finance_checkpage_3'/>" target="right">利润清算</A></TD></TR>
         <!-- 
         <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_sale_page_3'/>" target="right">特殊商品销售</A></TD></TR>
          --><TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_moneyhis_page_3'/>" target="right">上缴信息查询</A></TD></TR>
          <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_profit_page_3'/>" target="right">利润信息查询</A></TD></TR>
		</TABLE>

	<TABLE cellSpacing=0 cellPadding=0 width=150 border=0 id="yyt">
        <TR height=22>
          <TD style="PADDING-LEFT:20px;text-align:left;" background=images/menu_bt.jpg><a class=menuParent onclick=expand(7) 
            href="javascript:void(0);">营业员应用</a></TD></TR>
        <TR height=4>
          <TD></TD></TR></TABLE>
		<TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0 id="yytc">
  		<TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='MyMoneyPage.jsp'/>" target="right">我的营业额</A></TD></TR>
        <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='MyDepotPage.jsp'/>" target="right">我的取货量</A></TD></TR>
          <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='MyStockPage.jsp'/>" target="right">我的存货量</A></TD></TR>
         
         <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_mynodes_page_3'/>" target="right">我的机器</A></TD></TR>
          <!-- 
          <TR height=20>
          <TD align=left width=30><IMG height=9 
            src="images/menu_icon.gif" width=9></TD>
          <TD style="PADDING-LEFT:10px;text-align:left;"><A class="menuParent" href="<c:url value='/to_mysale_page_3'/>" target="right">特价商品销售</A></TD></TR>
           -->
          </TABLE>
          
   <TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" id="but">
        <TR><TD height="10"/></TR></TABLE>

    <TABLE cellSpacing="0" cellPadding="0" width="150" border="0" id="out">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><form class="menuParent" target="_parent" action="<c:url value="logoutCheck"/>" method="post"><input type="submit" value="退出系统" /></form></TD></TR>
        <TR height="4">
    <TD/></TR></TABLE>
  <!--  
    <TABLE cellSpacing="0" cellPadding="0" width="150" border="0">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='/do_test_combox_0'/>" target="right">页面测试</A></TD></TR>
        <TR height="4">
          <TD/></TR></TABLE>
   
	<TABLE cellSpacing="0" cellPadding="0" width="150" border="0">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='ParamPage.jsp'/>" target="right">页面测试</A></TD></TR>
        <TR height="4">
          <TD/></TR></TABLE>
          
	<TABLE cellSpacing="0" cellPadding="0" width="150" border="0">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='jQueryTable.jsp'/>" target="right">页面测试</A></TD></TR>
        <TR height="4">
          <TD/></TR></TABLE>

<TABLE cellSpacing="0" cellPadding="0" width="150" border="0">
        <TR height="22">
          <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='ImportCSV.jsp'/>" target="right">导入测试</A></TD></TR>
        <TR height="4">
          <TD/></TR></TABLE>
          
  <TABLE cellSpacing="0" cellPadding="0" width="150" border="0">
     <TR height="22">
      <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='/to_money_add2_1'/>" target="right">MoneyAdd2</A></TD></TR>
       <TR height="4">
        <TD/></TR></TABLE>
         
        <TABLE cellSpacing="0" cellPadding="0" width="150" border="0">
     <TR height="22">
      <TD style="PADDING-LEFT:20px;text-align:left;" background="images/menu_bt.jpg"><A class="menuParent" href="<c:url value='AutoAdd.jsp'/>" target="right">自动添加</A></TD></TR>
       <TR height="4">
        <TD/></TR></TABLE>
  -->
</TABLE></BODY></HTML>
