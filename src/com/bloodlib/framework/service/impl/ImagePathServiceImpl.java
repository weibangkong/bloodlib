package com.bloodlib.framework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.framework.mapper.ImagePathMapper;
import com.bloodlib.framework.model.ImagePath;
import com.bloodlib.framework.service.ImagePathService;

@Service("imageService")
public class ImagePathServiceImpl implements ImagePathService{

	@Autowired
	private ImagePathMapper imageMapper;
	
	@Override
	public boolean addImagePath(ImagePath imagePath) {
		if(imageMapper.insert(imagePath)>0){
			//复制图片到制定位置,调用FileHelper方法
			return true;
		}
		return false;
	}

	@Override
	public boolean updateImagePath(ImagePath imagePath) {
		if(imageMapper.updateByPrimaryKey(imagePath)>0){
			//修改图片内容调用FileHelper方法
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteImagePath(Long imageId) {
		if(imageMapper.deleteByPrimaryKey(imageId)>0){
			return true;
		}
		return false;
	}

	@Override
	public List<ImagePath> getImageListByNewsId(Long newsId) {
		return imageMapper.getIMGListByNewsId(newsId);
	}

}
