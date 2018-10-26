package com.bloodlib.framework.controller;
/**
 * 后台跳转控制器
 * 
 * @author WeiBang Kong
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="bgnavi/")
public class BGNavigationController {

	private static String prefix1="framework/background/";
	
	private static String user_prefix=prefix1+"user/";
	private static String police_prefix=prefix1+"police/";
	private static String hospital_prefix=prefix1+"hospital/";
	private static String bloodlib_prefix=prefix1+"bloodlib/";
	private static String bloodtype_prefix=prefix1+"bloodtype/";
	private static String needblood_prefix=prefix1+"needblood/";
	private static String bloodstock_prefix=prefix1+"bloodstock/";
	private static String donateblood_prefix=prefix1+"donateblood/";
	private static String news_prefix=prefix1+"news/";
	
	private static String common_prefix="common/error";
	
	/*---------------------------------------------------主页面跳转-----------------------------------------------------*/
	
	/**
	 * 跳转后台用户界面
	 * @return
	 */
	@RequestMapping(value="user/index")
	public String userIndex(){
		return user_prefix+"usermanage";
	}
	
	/**
	 * 跳转后台医院界面
	 * @return
	 */
	@RequestMapping(value="hospital/index")
	public String hospitalIndex(){
		return hospital_prefix+"hospitalmanage";
	}
	
	/**
	 * 跳转后台血库界面
	 * @return
	 */
	@RequestMapping(value="bloodlib/index")
	public String bloodlibIndex(){
		return bloodlib_prefix+"bloodlibmanage";
	}
	
	/**
	 * 跳转后台公安界面
	 * @return
	 */
	@RequestMapping(value="police/index")
	public String policeIndex(){
		return police_prefix+" policemanage";
	}
	
	/**
	 * 跳转到后台血型管理界面
	 * 
	 * @return
	 */
	@RequestMapping(value="bloodtype/index")
	public String getBloodTypeIndex(){
		return bloodtype_prefix+"bloodtypemanage";
	}

	/**
	 * 跳转到需血管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value="needblood/index")
	public String getNeedBloodIndex(){
		return needblood_prefix+"needbloodmanage";
	}
	
	/**
	 * 跳转到血液存量管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value="bloodstock/index")
	public String getBloodStockIndex(){
		return bloodstock_prefix+"bloodstockmanage";
	}

	/**
	 * 跳转到临时用户管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value="tempuser")
	public String getTempUserIndex(){
		return user_prefix+"tempuser";
	}
	
	/**
	 * 跳转到献血信息管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value="donateblood/index")
	public String getDonateBloodIndex(){
		return donateblood_prefix+"donatebloodmanage";
	}
	
	/**
	 * 跳转到新闻管理界面
	 * 
	 * @return
	 */
	@RequestMapping(value="news/index")
	public String getNewsIndex(){
		return news_prefix+"newsmanage";
	}
	
	/*-----------------------------------------------详细页面跳转-----------------------------------------------------------*/
	
	/**
	 * 跳转到用户相信信息页面
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="getuserdetailpage/{userId}")
	public String getUserDetail(Model model,@PathVariable("userId") String userId){
		model.addAttribute("userId", userId);
		return user_prefix+"userdetail";
	}
	
	/**
	 * 跳转到增加用户的界面
	 * @return
	 */
	@RequestMapping(value="adduser")
	public String getUserDetail(){
		return user_prefix+"adduser";
	}
	
	/**
	 * 跳转到血型详细信息页面
	 * 
	 * @param model
	 * @param operation
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getbloodtypedetailpage/add")
	public String getBloodTypeAddDetail(Model model,
			HttpServletRequest request,HttpServletResponse response){
			model.addAttribute("opera","add");
			return  bloodtype_prefix+"bloodtypedetail";
	}
	
	@RequestMapping(value="getbloodtypedetailpage/edit/{bloodtypeId}")
	public String getBloodTypeEditDetail(Model model,@PathVariable("bloodtypeId") String bloodtypeId,
			HttpServletRequest request,HttpServletResponse response){
			model.addAttribute("bloodTypeId", bloodtypeId);
			model.addAttribute("opera","edit");
			return bloodtype_prefix+"bloodtypedetail";
	}
	//废弃不用，原因，写在同意方法里，新增及修改，地址映射不同
/*	@RequestMapping(value="getbloodtypedetailpage/add/{opera}")
	public String getBloodTypeDetail(Model model,@PathVariable("opera") String opera,
			HttpServletRequest request,HttpServletResponse response){
		if("add".equals(opera)){
			return bloodtype_prefix+"bloodtypedetail";
		}
		if("edit".equals(opera)){
			String bloodtypeId=RequestHelper.getParam(request, "bloodtypeId");
			model.addAttribute("bloodtypeId", bloodtypeId);
			return bloodtype_prefix+"bloodtypeedit";
			
		}
		return common_prefix+"error";
	}*/
	
	@RequestMapping(value="getneedblooddetailpage/add")
	public String getNeedBloodDetail(Model model,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("opera","add");
		return  needblood_prefix+"needblooddetail";
	}
	
	@RequestMapping(value="getneedblooddetailpage/edit/{nbid}")
	public String getNeedBloodDetail(@PathVariable("nbid") String nbid,Model model,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("opera","edit");
		model.addAttribute("nbid", nbid);
		return  needblood_prefix+"needblooddetail";
	}
	
	@RequestMapping(value="getbloodstockdetailpage/edit/{userId}")
	public String getBloodStockDetail(@PathVariable("userId") String userId,Model model,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("opera","edit");
		model.addAttribute("userId", userId);
		return  bloodstock_prefix+"bloodstockdetail";
	}

	@RequestMapping(value="addStock/{userId}")
	public String getAddStock(@PathVariable("userId") String userId,Model model,HttpServletRequest request,HttpServletResponse response){
		model.addAttribute("userId", userId);
		return  bloodstock_prefix+"addbloodstock";
	}
	
	/**
	 * 跳转到添加献血信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getdonatedetail/add")
	public String  getDonateBloodDetail(Model model){
		model.addAttribute("opera","add");
		return donateblood_prefix+"donateblooddetail";
	}
	
	/**
	 * 跳转到修改献血信息页面
	 * @param donateBloodId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getdonatedetail/edit")
	public String getDonateBloodDetail(String donateId,Model model){
		model.addAttribute("opera","edit");
		model.addAttribute("donateId",donateId);
		return donateblood_prefix+"donateblooddetail";
	}
	
	/**
	 * 跳转到新增新闻页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getnewsdetail/add")
	public String getNewsDetail(Model model){
		model.addAttribute("opera","add");
		return news_prefix+"newsdetail";
	}
	
	/**
	 * 跳转到新闻修改页面
	 * @param newsId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getnewsdetail/edit")
	public String getNewsDetail(@PathVariable("newsId") String newsId,Model model){
		model.addAttribute("opera","edit");
		model.addAttribute("newsId",newsId);
		return news_prefix+"newsdetail";
	}
}
