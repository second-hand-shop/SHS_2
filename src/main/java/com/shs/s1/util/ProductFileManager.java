package com.shs.s1.util;


import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;

import org.springframework.web.multipart.MultipartFile;


@Component
public class ProductFileManager {

	
	
	
	//--------------------------경로 생성
	
	
	
	//기본 경로 추출
	public String getRootPath(String fileName, HttpServletRequest request) {
		
		String rootPath ="/resources/upload";
		
		MediaType mediaType = ProductMediaUtils.getMediaType(fileName);
		if(mediaType!=null)
			return request.getSession().getServletContext().getRealPath(rootPath+"/images");
		//사진파일 일 경우
		
		
		return request.getSession().getServletContext().getRealPath(rootPath+"/files");
		
	}
	
	
	
	//날짜별로 폴더 생성
	private String getDatePath(String uploadPath) {
		
		Calendar calendar = Calendar.getInstance();
		String yearPath = File.separator+calendar.get(Calendar.YEAR);
		String monthPath= yearPath+File.separator+new DecimalFormat("00").format(calendar.get(Calendar.MONTH)+1);
		//칼렌더의 month는 1을 더해줘야한다 ,,, 
		String datePath = monthPath+File.separator+new DecimalFormat("00").format(calendar.get(Calendar.DATE));
		
		makeDateDir(uploadPath,yearPath,monthPath,datePath);
		return "";
	}
	

	private void makeDateDir(String uploadPath, String...paths) {
	///...은 가변인자, String 배열 계속 올 수 있음	
		
		if(new File(uploadPath + paths[paths.length-1]).exists())
			return;
		
		for(String path:paths) {
			
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists())
				dirPath.mkdir();
		}
	}
	
	//썸네일
	private static String makeThumbnail(String uploadRootPath, String datePath, String fileName) throws Exception{
		
		//원본이미지 메모리에 로딩
		BufferedImage ogImg=ImageIO.read(new File(uploadRootPath+datePath,fileName));
		//원본이미지 축
		BufferedImage thumbImg = Scalr.resize(ogImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
		//bufferdimage 객체, 너비,높이,reisize옵션
		String thumbnailImgName = "s_"+fileName;
		String fullPath = uploadRootPath+datePath+File.separator+thumbnailImgName;
		
		//썸네일 객체 생성
		File newFile = new File(fullPath);
		
		String formatName = ProductMediaUtils.getFormatName(fileName);
		ImageIO.write(thumbImg, formatName, newFile);
		
		return thumbnailImgName;
		
	}
	
	
	//---------------------------------------------파일처리
	
	
	//중복방지
	private String getUUIDFileName(String originalFileName) {
		return UUID.randomUUID().toString()+"_"+originalFileName;
	}
	
	
	
	
	
	
	
	
	
	
	
	public String uploadFile(String name,MultipartFile multipartFile, HttpServletRequest request)throws Exception {
		
	
		String ogFileName = multipartFile.getOriginalFilename();
		
		//1.중복방지처리
		String fileName = getUUIDFileName(ogFileName);
		
		//2.파일 업로드 경로 설정
		String rootPath = getRootPath(ogFileName, request);
		String datePath = getDatePath(rootPath);
		
		//3.서버에 파일 저장
		
		File file = new File(rootPath+datePath,fileName);
		multipartFile.transferTo(file);
		
		
		//4. 이미지 파일일 경우 썸네일 생성
		if(ProductMediaUtils.getMediaType(ogFileName)!=null) {
			
			fileName = makeThumbnail(rootPath, datePath, fileName);
		}
		
		
		
		
		
		String savedFilePath = datePath + File.separator+fileName;
	
		return savedFilePath;
	}
	
	
	
	
	
	
	
	
	
	
}
