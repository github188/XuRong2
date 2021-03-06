package org.ecnu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.ChannelGroup;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.NodeGroupInfo;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.NodeMapping;
import org.ecnu.orm.Users;
import org.ecnu.service.ChannelGroupService;
import org.ecnu.service.ChannelInfoService;
import org.ecnu.service.NodeGroupInfoService;
import org.ecnu.service.NodeInfoService;
import org.ecnu.service.NodeMappingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("nodeInfoController")
public class NodeInfoController {

	@Autowired
	private NodeInfoService nis;
	
	@Autowired
	private NodeMappingService nms;
	
	@Autowired
	private ChannelGroupService cgs;
	
	@Autowired
	private NodeGroupInfoService ngis;
	
	@Autowired
	private ChannelInfoService cis;
	
	@RequestMapping("/to_node_page_3")
	public ModelAndView nodeInfoPage()
	{
//		System.out.println("isclick "+isclick);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeInfoSearch");
		mav.addObject("mtypelist", nis.searchAllType());

		return mav;
	}
	
	@RequestMapping("/do_node_search_3")
	public ModelAndView nodeSearch(NodeInfo nodeInfo, @RequestParam("PageNo") int pageNo)
	{
//		System.out.println("isclick "+isclick);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeInfoSearch");
		mav.addObject("list_vending", nis.searchByLike(nodeInfo, pageNo));
		long rows = nis.countRowsByLike(nodeInfo);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("nodeinfo", nodeInfo);
		mav.addObject("mtypelist", nis.searchAllType());
		return mav;
	}
	
	@RequestMapping("/do_node_searchAll_3")
	public ModelAndView nodeSearchAll(NodeInfo nodeInfo)
	{
//		System.out.println("isclick "+isclick);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeMapping");
		mav.addObject("list_vending", nis.searchAllNode());
		mav.addObject("nodeinfo", nodeInfo);
		return mav;
	}
	
	@RequestMapping("/to_node_edit_0")	//进入node信息编辑界面，并通过nodeId查找完全信息
	public ModelAndView nodeInfoEdit(@RequestParam("nodeId") String nodeId)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeInfoEdit");
		NodeInfo nf= new NodeInfo();
		nf.setNodeId(nodeId);
		
		mav.addObject("nodeinfo", nis.search(nf, 0).get(0));
		
		mav.addObject("vnames", cgs.searchAllVersion2());
		NodeGroupInfo ngi = new NodeGroupInfo();
		mav.addObject("ngilist", ngis.searchAll(ngi));
		mav.addObject("mtypelist", nis.searchAllType());
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_node_update_0")	//填好nodeinfo信息后，进入下一步的选择点位，并传递nodeinfo
	public ModelAndView nodeInfoUpdate(NodeInfo nodeinfo, @RequestParam("hversionName") String hvn)//@RequestParam("his") int hisFlag
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeInfoSearch");
		if(!hvn.equals(nodeinfo.getVersionName())){//更换了货道组，删除以前的，添加新的货道组
			//删除所有nodeId为nodeinfo.getNodeId()的channel_info中记录
			cis.deleteByNodeId(nodeinfo.getNodeId());
			//插入
			ChannelGroup cg = new ChannelGroup();
			cg.setVersionName(nodeinfo.getVersionName());
			List<ChannelGroup> cglist = (List<ChannelGroup>) cgs.searchAll(cg);
			for(int i = 0; i< cglist.size(); i++){
				ChannelInfo ci = new ChannelInfo();
				ci.setChannelId(cglist.get(i).getChannelId());
				ci.setNodeInfo(nodeinfo);
				ci.setNormalStock(cglist.get(i).getNormalStock());
//				ci.setWareId(cglist.get(i).getWares().getWareId());
				ci.setWareName(cglist.get(i).getWares().getWareName());
				
				Date time=new Date();
				
				ci.setLastTime(time);
				cis.insert(ci);
			}
		}
		nis.update(nodeinfo);
		mav.addObject("mtypelist", nis.searchAllType());
		return mav;
	}
	
	@RequestMapping("/do_node_view_3")
	public ModelAndView nodeInfoView(@RequestParam("nodeId") String nodeId)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeInfoView");
		//System.out.println("read by nodeId "+nodeId);
	
		NodeInfo nf= new NodeInfo();
		nf.setNodeId(nodeId);

		mav.addObject("nodeinfo", nis.search(nf, 0).get(0));
		return mav;
	}
	
	@RequestMapping("/to_mynodes_page_3")
	public ModelAndView myNodeSearch(ServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MyNodesPage");
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
//		Long uid = user.getUserId();
		String ename = user.getEmployeeName();
		
		List<NodeMapping> nmlist = new ArrayList<NodeMapping>();
		nmlist = nms.searchAllByEname(ename);
		
		List<NodeInfo> nilist = new ArrayList<NodeInfo>();
		NodeInfo ni = new NodeInfo();
		for(int i=0; i<nmlist.size(); i++){
			ni.setNodeId(nmlist.get(i).getNodeId());
			nilist.add((NodeInfo) nis.search(ni, 0).get(0));
		}
		mav.addObject("list_vending", nilist);

		return mav;
	}
	
	@RequestMapping("/to_node_add_1")
	public ModelAndView nodeInfoAdd()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeInfoAdd");
		
		mav.addObject("vnames", cgs.searchAllVersion2());
		NodeGroupInfo ngi = new NodeGroupInfo();
		mav.addObject("ngilist", ngis.searchAll(ngi));
		mav.addObject("mtypelist", nis.searchAllType());
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_node_add_1")
	public ModelAndView donodeInfoAdd(NodeInfo ni)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NodeInfoAdd");
		
		mav.addObject("vnames", cgs.searchAllVersion2());
		NodeGroupInfo ngi = new NodeGroupInfo();
		mav.addObject("ngilist", ngis.searchAll(ngi));

		ni.setIsAssign("1");
		ni.setNodeFrom("2");//2013-06-29
		nis.insert(ni);
		
		//insert channel into channel_info
		ChannelGroup cg = new ChannelGroup();
		cg.setVersionName(ni.getVersionName());
		List<ChannelGroup> cglist = (List<ChannelGroup>) cgs.searchAll(cg);
		for(int i = 0; i< cglist.size(); i++){
			ChannelInfo ci = new ChannelInfo();
			ci.setChannelId(cglist.get(i).getChannelId());
			ci.setNodeInfo(ni);
			ci.setNormalStock(cglist.get(i).getNormalStock());
//			ci.setWareId(cglist.get(i).getWares().getWareId());
			ci.setWareName(cglist.get(i).getWares().getWareName());
			
			Date time=new Date();
			
			ci.setLastTime(time);
			cis.insert(ci);
		}
		return mav;
	}
	
	//use JSON
	@RequestMapping(value="/do_node_findid_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> nodeIdfind(@RequestBody Map<String, String> model)
	{
		Map<String, String> map = new HashMap<String, String>(1);  
		NodeInfo ni = new NodeInfo();
		ni.setNodeId(model.get("nodeId"));
		if(nis.searchAll(ni).size()<=0)
		{
			map.put("success", "true");  
		}
		else 
		{
			map.put("success", "false");  
		}
		return map;
	}
	
	//use JSON
	@RequestMapping(value="/do_node_findname_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> nodeNamefind(@RequestBody Map<String, String> model)
	{
		Map<String, String> map = new HashMap<String, String>(1);  
		NodeInfo ni = new NodeInfo();
		ni.setNodeName(model.get("nodeName"));
		if(nis.searchAll(ni).size()<=0)
		{
			map.put("success", "true");  
		}
		else 
		{
			map.put("success", "false");  
		}
		return map;
	}
}
