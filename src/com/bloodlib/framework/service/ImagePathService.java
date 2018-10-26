package com.bloodlib.framework.service;

import java.util.List;

import com.bloodlib.framework.model.ImagePath;

public interface ImagePathService {
	boolean addImagePath(ImagePath imagePath);
	
	boolean updateImagePath(ImagePath imagePath);
	
	boolean deleteImagePath(Long imageId);
	
	List<ImagePath> getImageListByNewsId(Long newsId);
	
}
