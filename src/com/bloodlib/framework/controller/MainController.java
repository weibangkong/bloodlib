package com.bloodlib.framework.controller;
/**
 * 主程序控制器
 * 
 * @author WeiBang Kong
 * 
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bloodlib.common.utils.StringHelper;

@Controller
@RequestMapping(value="main/")
public class MainController {
	
	private static String prefix_main="framework/main/";
	private static String prefix_fg_user="forceground/user/";
	private static String prefix_fg_hospital="forceground/hospital/";
	private static String prefix_fg_bloodlib="forceground/bloodlib/";
	private static String prefix_fg_police="forceground/police/";
	private static String prefix_bg_main="framework/background/main/";
	private static String prefix_common="common/error";
	
	/**
	 * 跳转到门户首页
	 *
	 * */
	@RequestMapping(value="mainindex")
	public String index(){
		return "common/index";
	}
	
	/**
	 * 跳找到首页
	 * 
	 * @param flag
	 * @param roleid
	 * @return
	 */
	@RequestMapping(value="index/{flag}/{roleid}")
	public String mainIndex(@PathVariable("flag") String flag,@PathVariable("roleid") String roleid){
		StringBuilder path=new StringBuilder();
		if(flag.equals("true")){
			if(StringHelper.isEmpty(roleid)){
				path.append(prefix_common);
			}else{
				int role=Integer.parseInt(roleid);
				switch(role){
				case 1:
					path.append("redirect:../../fgnavi/user/index");
					//path.append(prefix_fg_user).append("index");
					break;
				case 2:
					path.append("redirect:../../fgnavi/user/index");
					//path.append(prefix_fg_hospital).append("index");
					break;
				case 3:
					path.append("redirect:../../fgnavi/user/index");
					//path.append(prefix_fg_bloodlib).append("index");
					break;
				case 4:
					path.append("redirect:../../fgnavi/user/index");
					//path.append(prefix_fg_police).append("index");
					break;
				case 99:
					path.append(prefix_bg_main).append("index");
					break;
				}
			}
		}else{
			path.append(prefix_common).append("error");
		}
		return path.toString();
	}
}


