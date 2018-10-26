package com.bloodlib.framework.service;

import java.util.List;

import com.bloodlib.framework.model.News;

public interface NewsService {

	
	boolean publishNews(News news);
	
	boolean updateNews(News news);
	
	boolean deleteNews(Long newsId);
	
	News getNewsInfo(Long newsId);
	
	List<News> getNewsList();
}
