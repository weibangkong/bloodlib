package com.bloodlib.framework.converter;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * 时间格式转换器
 * 
 * @author WeiBang Kong
 *
 */
public class DateConverter implements Converter<String, Date>{

	@Override
	public Date convert(String date_str) {
		if(!StringUtils.isEmpty(date_str)){
			return null;
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(date_str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
