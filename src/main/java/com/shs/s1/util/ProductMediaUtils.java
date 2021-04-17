package com.shs.s1.util;


import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class ProductMediaUtils {

	
	private static Map<String, MediaType> mediaMap;
	
	//스태틱  초기화 블럭
	static {
		mediaMap = new HashMap<String,MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		
	}
	
	public static MediaType getMediaType(String fileName){
		String formatName = getFormatName(fileName);
		return mediaMap.get(formatName);
	}
	
	
	public static String getFormatName(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
	}
	

		
	}