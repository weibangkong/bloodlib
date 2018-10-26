package com.bloodlib.framework.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.ImagePath;

@Repository("imageMapper")
public interface ImagePathMapper {
    int deleteByPrimaryKey(Long imageId);

    int insert(ImagePath record);

    int insertSelective(ImagePath record);

    ImagePath selectByPrimaryKey(Long imageId);

    int updateByPrimaryKeySelective(ImagePath record);

    int updateByPrimaryKey(ImagePath record);
    
    List<ImagePath> getIMGListByNewsId(Long newsId);
}