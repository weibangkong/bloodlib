package com.bloodlib.framework.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.framework.mapper.CityMapper;
import com.bloodlib.framework.mapper.ProvincialMapper;
import com.bloodlib.framework.model.City;
import com.bloodlib.framework.model.Provincial;
import com.bloodlib.framework.service.AreaService;

@Service("areaService")
public class AreaServiceImpl implements AreaService{

	@Autowired
	private ProvincialMapper provincialMapper;
	
	@Autowired
	private CityMapper cityMapper;
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<?> getArea() {
		List<Map> area_list =new ArrayList<Map>();
		List<Provincial> pro_list=provincialMapper.getProList();
		Iterator<Provincial> pro_iterator =pro_list.iterator();
		while(pro_iterator.hasNext()){
			Map<String,Object> map=new HashMap<String, Object>();
			Provincial pro =pro_iterator.next();
			List<City> city_list=cityMapper.getCityByPid(pro.getPid());
			map.put("pid", pro.getPid());
			map.put("provincial", pro.getProvincial());
			map.put("citys", city_list);
			area_list.add(map);
		}
		return area_list;
	}

}
