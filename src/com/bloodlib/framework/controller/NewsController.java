package com.bloodlib.framework.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bloodlib.common.utils.LayuiMessage;
import com.bloodlib.common.utils.Message;
import com.bloodlib.common.utils.MessageHelper;
import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.model.News;
import com.bloodlib.framework.service.NewsService;

@Controller
@RequestMapping(value="news/")
public class NewsController {

	@Autowired
	private NewsService newsService;
	/**
	 * 增加新闻
	 * @return
	 */
	public ResultMessage addNews(){
		ResultMessage resultMsg=new ResultMessage();
		return resultMsg;
	}
	
	public ResultMessage updateNews(){
		ResultMessage resultMsg=new ResultMessage();
		return resultMsg;
	}
	
	public ResultMessage deleteNews(){
		ResultMessage resultMsg=new ResultMessage();
		return resultMsg;
	}
	
	public Message getList(){
		List<News> list=newsService.getNewsList();
		return MessageHelper.formatToLayuiMsg(list,list.size());
	}
}
