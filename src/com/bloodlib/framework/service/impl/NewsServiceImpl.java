package com.bloodlib.framework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.framework.mapper.NewsMapper;
import com.bloodlib.framework.model.News;
import com.bloodlib.framework.service.NewsService;

@Service("newsService")
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsMapper newsMapper;
	
	@Override
	public boolean publishNews(News news) {
		if(newsMapper.insert(news)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateNews(News news) {
		if(newsMapper.updateByPrimaryKey(news)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteNews(Long newsId) {
		if(newsMapper.deleteByPrimaryKey(newsId)>0){
			return true;
		}
		return false;
	}

	@Override
	public News getNewsInfo(Long newsId) {
		return newsMapper.selectByPrimaryKey(newsId);
	}

	@Override
	public List<News> getNewsList() {
		return newsMapper.getNewsList();
	}

}
