package com.bloodlib.framework.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.News;
@Repository("newsMapper")
public interface NewsMapper {
    int deleteByPrimaryKey(Long newsId);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Long newsId);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
    List<News> getNewsList();
}