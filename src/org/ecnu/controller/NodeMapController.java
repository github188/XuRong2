package org.ecnu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.ecnu.oracle.orm.GroupInfo;
import org.ecnu.oracle.orm.ONodeInfo;
import org.ecnu.oracle.orm.PWareInfo;
import org.ecnu.oracle.orm.ParamVersion;
import org.ecnu.oracle.orm.ParamVersionId;
import org.ecnu.oracle.service.OGroupInfoDtlService;
import org.ecnu.oracle.service.OGroupInfoService;
import org.ecnu.oracle.service.ONodeInfoService;
import org.ecnu.oracle.service.OPWareInfoService;
import org.ecnu.oracle.service.OParamVersionService;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.NodeMapping;
import org.ecnu.orm.Users;
import org.ecnu.service.ChannelInfoService;
import org.ecnu.service.NodeInfoService;
import org.ecnu.service.NodeMappingService;
import org.ecnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("nodeMapController")
public class NodeMapController {
	@Autowired
	private NodeMappingService nms;
	
	@Autowired
	private UserService us;
	
	@Autowired
	private ONodeInfoService onis;
	
	@Autowired
	private NodeInfoService nis;
	
	@Autowired
	private ChannelInfoService cis;
	
	@Autowired
	private OParamVersionService opvs;
	
	@Autowired
	private OPWareInfoService opwis;
	
	@Autowired
	private OGroupInfoService ogis;
	
	@Autowired
	private OGroupInfoDtlService ogids;
	
	@RequestMapping("/to_map_page_3")
	public ModelAndView nodeMapPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapSearch");
		
		NodeMapping nodeMap = new NodeMapping();
		int pageNo =0;
		mav.addObject("maplist", nms.searchByLike(nodeMap, pageNo ));
		long rows = nms.countRowsByLike(nodeMap);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("nm", nodeMap);
		return mav;
//		return "NodeMapSearch";
	}
	
	@RequestMapping("/do_map_search_3")
	public ModelAndView nodeMapSearch(NodeMapping nodeMap, @RequestParam("PageNo") int pageNo)//@RequestParam("id") long id, @RequestParam("userId") long uid, @RequestParam("nodeId") String nid
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapSearch");
		
		mav.addObject("maplist", nms.searchByLike(nodeMap, pageNo));
		long rows = nms.countRowsByLike(nodeMap);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("nm", nodeMap);
		return mav;
	}
	
	@RequestMapping("/do_map_del_2")
	public ModelAndView nodeMapDel(@RequestParam("check") List<Long> mycheck, NodeMapping nodeMap, @RequestParam("PageNo") int pageNo)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapSearch");
		
		nms.deleteMoreByHql(mycheck);
		NodeMapping nm = new NodeMapping();
		for(int i =0; i<mycheck.size(); i++){//更新售货机为未分配状态
			nm.setId(mycheck.get(i));
			NodeMapping nm2 = (NodeMapping) nms.search(nm, 0).get(0);
			nis.updateIsAssign(nm2.getNodeId(), "1");
		}
		
		
		mav.addObject("maplist", nms.searchByLike(nodeMap, pageNo));
		long rows = nms.countRowsByLike(nodeMap);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("nm", nodeMap);
		
		return mav;
	}
	
	@RequestMapping("/to_map_edit_0")
	public ModelAndView tonodeMapEdit(@RequestParam("id") long mapid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapEdit");
		NodeMapping nmtemp = (NodeMapping) nms.read(mapid);
		mav.addObject("mapinfo", nmtemp);
		List<Users> users = us.searchAllEmp();
		mav.addObject("users", users);
		
		return mav;
	}
	
	@RequestMapping("/do_map_edit_0")
	public ModelAndView donodeMapEdit(NodeMapping nodeMap)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapSearch");

		nodeMap.setEmployeeName(((Users)us.read(nodeMap.getUserId())).getEmployeeName());
		nms.update(nodeMap);
		return mav;
	}
	
	@RequestMapping("/to_map_allnodemappingpage_4")
	public ModelAndView tonodeMapping()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMappingAll");
//		List<Users> users=us.searchAllEmp();
//		mav.addObject("users", users);
		return mav;
	}
	
//	@RequestMapping("/do_map_searchnodeInNodeInfo_4")//查询oracle node_info表, 有大量冗余
//	public ModelAndView nodeMappingSearch2(ONodeInfo oni)
//	{
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("NodeMappingAll");
//		try {
//			mav.addObject("nodelist", onis.searchNoPage(oni));
//		} catch (IllegalArgumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		List<Users> users=us.searchAllEmp();
//		mav.addObject("users", users);
//		
//		mav.addObject("onodeinfo", oni);
//		return mav;
//	}
	
	@RequestMapping("/to_map_nodepage_4")
	public ModelAndView tonodeMapPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapping");
		mav.addObject("mtypelist", nis.searchAllType());
//		List<Users> users=us.searchAllEmp();
//		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping("/do_map_searchNodeInfoInMysql_4")//查询mysql node_info表, 有大量冗余
	public ModelAndView nodeMappingSearch3(NodeInfo ni, @RequestParam("PageNo") int pageNo)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapping");
		mav.addObject("nilist", nis.searchByLike(ni, pageNo));
		
		long rows = nis.countRowsByLike(ni);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);

		mav.addObject("mtypelist", nis.searchAllType());
		
		List<Users> users=us.searchAllEmp();
		mav.addObject("users", users);
		
		mav.addObject("nodeinfo", ni);
		return mav;
	}
	
	@RequestMapping("/do_map_searchnodeInParamVersion_4")//查询param_version表中nodeId不为80开头的记录
	public ModelAndView nodeMappingSearch(ONodeInfo oni)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapping");
		
		List<ONodeInfo> onodeinfos = new ArrayList<ONodeInfo>();
		ONodeInfo oni2 = new ONodeInfo();
		ONodeInfo oni3 = new ONodeInfo();
		
		List<ParamVersion> paramversions = new ArrayList<ParamVersion>();
		paramversions = opvs.searchAll();
//		System.out.println("paramversions.size():"+paramversions.size());
		for(int i=0; i<paramversions.size(); i++){
			ParamVersion pv = new ParamVersion();
			pv = paramversions.get(i);
//			System.out.println("pv.getCurVersionNo():"+pv.getCurVersionNo());
//			System.out.println("pv.getId().getNodeId():"+pv.getId().getNodeId());
//			System.out.println("pv.getId().getParamTag():"+pv.getId().getParamTag());
			if(pv.getId().getParamTag().equals("0306")){
//				System.out.println("0306");
//				System.out.println("pv.getId().getNodeId().substring(0, 2)"+pv.getId().getNodeId().substring(0, 2));
				if(!pv.getId().getNodeId().substring(0, 2).equals("80")){
					System.out.println("pv.getId().getNodeId():"+pv.getId().getNodeId());
					oni3.setNodeId(pv.getId().getNodeId());
					oni2 = (ONodeInfo) onis.read(pv.getId().getNodeId());//可用，快速
					//oni2 = onis.searchNoPage(oni3).get(0);

					onodeinfos.add(oni2);
				}
			}
		}
		
		System.out.println("onodeinfos:"+onodeinfos.size());

		List<Users> users=us.searchAllEmp();
		mav.addObject("users", users);
		
		mav.addObject("onodeinfo", onodeinfos);
		return mav;
	}
	
	@RequestMapping("/do_map_nodes_4")
	public String donodeMapping(@RequestParam("check") List<String> nodeIds, @RequestParam("employeeName") String eName)
	{
		
//		List<NodeMapping> nmps = new ArrayList<NodeMapping>();
		for(int i = 0; i<nodeIds.size(); i++){
			
			String temp = nodeIds.get(i);
			//将选择的nodeId插入到node_map表中
			NodeMapping nmp = new NodeMapping();
			nmp.setNodeId(temp);
			NodeInfo ni2 = new NodeInfo();
			ni2.setNodeId(temp);
			NodeInfo ni =(NodeInfo) nis.search(ni2,0).get(0);
			nmp.setNodeName(ni.getNodeName());
			nmp.setEmployeeName(eName);
			nmp.setUserId(us.findUsersByEmpName(eName).getUserId());
//			nmps.add(nmp);
			if(!nms.nodeMapIsExist(nmp))
			{//一台机器不能多次分配给一个人
				nms.insert(nmp);
			}
			
			String state ="2";
			nis.updateIsAssign(temp, state);
/*		
			NodeInfo ni = new NodeInfo();
			ni.setNodeId(nodeIds.get(i));
			ONodeInfo oni = new ONodeInfo();
			ONodeInfo oni2 = new ONodeInfo();
//			ONodeInfo oni3 = new ONodeInfo();
			oni2.setNodeId(temp);
			oni = (ONodeInfo) onis.search(oni2, 0).get(0);
//			oni = (ONodeInfo) onis.read(temp);
			ni.setNodeName(oni.getNodeName());
			
			ni.setIsAssign("2");
			
			if(!nis.nodeIsExist(temp)){//nodeId在nodeInfo表中不存在时插入
				nis.insert(ni);
			}
			
			//将选择的nodeId的channelInfo插入到channel_info表中
			String nodeId = nodeIds.get(i);
			String paramTag = "0306";
			ParamVersion pv = new ParamVersion();
			//联合主键查询--始
			ParamVersionId id = new ParamVersionId();
			id.setNodeId(nodeId);
			id.setParamTag("0306");
			ParamVersion pv2 = new ParamVersion();
			pv2.setId(id);
//			System.out.println("pv2.getId().getNodeId():"+pv2.getId().getNodeId());
//			pv = (ParamVersion) opvs.search(pv2, 0).get(0);//search by object 方法
			pv = (ParamVersion) opvs.read(id);//测试可以如此用法，联合主键查询--完
//			System.out.println("联合主键查询:"+pv.getCurVersionNo());
			//pv = opvs.readByNodeId(nodeId, paramTag);
			long curVersionNo = pv.getCurVersionNo();
			List<PWareInfo> pWareInfos = new ArrayList<PWareInfo>();
			pWareInfos = opwis.searchAllPWareInfoByCurVersionNo(curVersionNo);//从oracle中的P_WARE_INFO表获得该nodeId的P_WARE_INFO(channelInfo)信息：PASS_NO，WARE_ID
//			System.out.println("pWareInfos.size():"+pWareInfos.size());
			
			Date now = new Date();
//			SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			for(int k=0; k<pWareInfos.size(); k++){
				PWareInfo pwi = new PWareInfo();
				pwi = pWareInfos.get(k);
				ChannelInfo ci = new ChannelInfo();
				ci.setChannelId(pwi.getId().getPassNo());
				ci.setWareId(pwi.getPGoodsInfo().getWareId());
				ci.setWareName(pwi.getPGoodsInfo().getWareName());
				ci.setLastTime(now);
				ci.setNodeInfo(ni);
				ci.setCurrentNumber(0);
				ci.setNormalStock(0);
				ci.setIncrementNumber(0);
				
				if(!cis.channelIsExist(temp, pwi.getId().getPassNo())){
					cis.insert(ci);
				}
				
			}
*/
		
	}
//		nms.insertMore(nmps, nodeIds.size());
		return "NodeMapping";

	}
	
	//to_groupmap_page_4
	@RequestMapping("/to_map_gigrouppage_4")
	public ModelAndView togroupMapping()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeGroupMapping");
//		List<Users> users=us.searchAllEmp();
//		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping("/do_map_searchgroupInGroupInfo_4")//查询oracle group_info表, 方便显示和查询
	public ModelAndView groupMappingSearch(GroupInfo groupInfo, @RequestParam("PageNo") int pageNo)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeGroupMapping");
		
		List<Users> users=us.searchAllEmp();
		mav.addObject("users", users);
		mav.addObject("nglist", ogis.searchByLike(groupInfo, pageNo));
		long rows = ogis.countRowsByLike(groupInfo);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("onginfo", groupInfo);
		return mav;
	}
	
	@RequestMapping("/to_map_pvgrouppage_4")
	public ModelAndView togroupMapping2()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeGroupMapNoPage");
//		List<Users> users=us.searchAllEmp();
//		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping("/do_map_searchgroupInParamVersion_4")//查询oracle param_version表中存在的的, 数据真实
	public ModelAndView groupMappingSearch2(GroupInfo groupInfo)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeGroupMapNoPage");
		
		List<Users> users=us.searchAllEmp();
		mav.addObject("users", users);
		mav.addObject("nglist", ogis.searchPvGi(groupInfo));

		mav.addObject("onginfo", groupInfo);
		return mav;
	}
	
	@RequestMapping("/do_map_groups_4")
	public String dogroupMapping(@RequestParam("check") List<String> groupIds, @RequestParam("employeeName") String eName)
	{
		for(int i = 0; i<groupIds.size(); i++){
			String gtemp = groupIds.get(i);
			
			Long uid = us.findUsersByEmpName(eName).getUserId();
			
			//在group_info_dtl表中查询groupId的所有记录
			List<String> nodeids = new ArrayList<String>();
			System.out.println("start search all nodeId");
			nodeids = ogids.getAllNodeIdByGroupId(gtemp);
//			List<NodeInfo> nilist = new ArrayList<NodeInfo>();
//			nilist = nis.getAllNodeIdByGroupId(gtemp);
//			for(int k=0; k<nilist.size(); k++){
//				nodeids.add(nilist.get(k).getNodeId());
//			}
//			nodeids = nis.getAllNodeIdByGroupId(gtemp);
			System.out.println("nodeids.size():"+nodeids.size());
			for(int j=0; j<nodeids.size(); j++){
				String ntemp = nodeids.get(j);
				System.out.println(j+" nodeids[j]= "+nodeids.get(j));
				//将选择的nodeId插入到node_map表中
				NodeMapping nmp = new NodeMapping();
				nmp.setEmployeeName(eName);
				nmp.setUserId(uid);
				nmp.setNodeId(nodeids.get(j));
				NodeInfo ni2 = new NodeInfo();
				ni2.setNodeId(nodeids.get(j));
				NodeInfo ni =(NodeInfo) nis.search(ni2,0).get(0);
				nmp.setNodeName(ni.getNodeName());
				
				if(!nms.nodeMapIsExist(nmp))nms.insert(nmp);
				
				//将选择的nodeId插入到node_map表中
				
//				NodeInfo ni2 = new NodeInfo();
//				ni2.setNodeId(ntemp);
//				NodeInfo ni = (NodeInfo) nis.search(ni2, 0).get(0);
//				ni.setIsAssign("2");
				String state ="2";
				nis.updateIsAssign(ntemp, state);
/*				
				//******查询组的CurVersionNo***********
				String paramTag = "0306";
				ParamVersion pv = new ParamVersion();
				//联合主键查询--始
				ParamVersionId id = new ParamVersionId();
				id.setNodeId(gtemp);//----此处须设置为组编号-----
				id.setParamTag(paramTag);
				ParamVersion pv2 = new ParamVersion();
				pv2.setId(id);
				System.out.println("pv2.getId().getNodeId():"+pv2.getId().getNodeId());
//				pv = (ParamVersion) opvs.search(pv2, 0).get(0);//search by object 方法
				pv = (ParamVersion) opvs.read(id);//测试可以如此用法，联合主键查询--完
				System.out.println("联合主键查询:"+pv.getCurVersionNo());
				//pv = opvs.readByNodeId(nodeId, paramTag);
				long curVersionNo = pv.getCurVersionNo();
				List<PWareInfo> pWareInfos = new ArrayList<PWareInfo>();
				pWareInfos = opwis.searchAllPWareInfoByCurVersionNo(curVersionNo);//从oracle中的P_WARE_INFO表获得该VersionNo的P_WARE_INFO(channelInfo)信息：PASS_NO，WARE_ID
				System.out.println("pWareInfos.size():"+pWareInfos.size());
				
				Date now = new Date();
//				SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
				//将选择的nodeId插入到node_info表中
				NodeInfo ni = new NodeInfo();
				ni.setNodeId(nodeids.get(j));
				
				ni.setIsAssign("2");
				
				ONodeInfo oni = new ONodeInfo();
				ONodeInfo oni2 = new ONodeInfo();
//				ONodeInfo oni3 = new ONodeInfo();
				oni2.setNodeId(ntemp);
				oni = (ONodeInfo) onis.search(oni2, 0).get(0);
//				oni = (ONodeInfo) onis.read(temp);
				ni.setNodeName(oni.getNodeName());
				if(!nis.nodeIsExist(ntemp)){
//					System.out.println("ntemp: "+ntemp);
					nis.insert(ni);
				}
				
				ParamVersionId opvi = new ParamVersionId();
				opvi.setNodeId(ntemp);
				opvi.setParamTag(paramTag);
				ParamVersion opv = new ParamVersion();
				opv.setId(opvi);
				if(opvs.read(opv) != null){
					//groupId下的nodeId在paramVersion中单独存在，则须查询后另外处理
					ParamVersion opv2 = new ParamVersion();
					opv2 = (ParamVersion) opvs.read(opv);
					if(pv.getLastTime().compareTo(opv2.getLastTime())>0){//待查
						//组的更新时间更新，则直接覆盖掉之前的值，否则跳过
						for(int k=0; k<pWareInfos.size(); k++){
							//将选择的nodeId的channelInfo插入到channel_info表中
							PWareInfo pwi = new PWareInfo();
							pwi = pWareInfos.get(k);
							ChannelInfo ci = new ChannelInfo();
							ci.setChannelId(pwi.getId().getPassNo());
							ci.setWareId(pwi.getPGoodsInfo().getWareId());
							ci.setWareName(pwi.getPGoodsInfo().getWareName());
							ci.setLastTime(now);
							ci.setCurrentNumber(0);
							ci.setNormalStock(0);
							ci.setIncrementNumber(0);
							ci.setNodeInfo(ni);

							if(!cis.channelIsExist(nodeids.get(j), pwi.getId().getPassNo())){
								cis.insert(ci);
							}
						}
					}
				}*/
			}
		}
		return "NodeGroupMapping";
	}
	
	@RequestMapping("/do_map_usersearch_3")
	public ModelAndView searchNodeByEname(NodeMapping nm)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MoneyAddU");
		mav.addObject("nmlist", nms.searchAllByEname(nm.getEmployeeName()));
		mav.addObject("users", nms.searchAllUser());
		mav.addObject("ename", nm.getEmployeeName());
//		List<Users> users=us.searchAllEmp();
//		mav.addObject("users", users);
		return mav;
	}
}
