package com.shs.s1.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.shs.s1.util.ProductFileManager;
import com.shs.s1.util.ProductPager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductFileManager fileManager;
	@Autowired
	private HttpServletRequest request;
	
	
	public List<ProductDTO> getList(ProductPager pager) throws Exception{
		
	pager.makeRow();
	long totalCount = productDAO.getTotalCount();
	pager.makeNum(totalCount);
		
		
		
		
		return productDAO.getList(pager);
		
	}
	
	public ProductDTO getSelect(ProductDTO productDTO) throws Exception{
		
		return productDAO.getSelect(productDTO);
	}
	
	
	
	public List<ProductDTO> getSelectList(ProductDTO productDTO)throws Exception{
		return productDAO.getSelectList(productDTO);
	}
	
	
	
	
	public int setInsert(ProductDTO productDTO,MultipartFile[] files)throws Exception{
		//시퀀스로 선언된 프라이머리키 가져온다
		long num =productDAO.getProductNum();
		productDTO.setProductNum(num);
		int result = productDAO.setInsert(productDTO);
		//파일처리
		for(MultipartFile mf: files) {
			
			ProductImageDTO productImageDTO = new ProductImageDTO();
			String fileName = fileManager.uploadFile( mf,request);	
			productImageDTO.setProductNum(num);
			productImageDTO.setThumbnail(fileName);
			String uuidFileName = fileName.substring(0, 12) + fileName.substring(14);
			
			productImageDTO.setFileName(uuidFileName);
			productImageDTO.setOgName(mf.getOriginalFilename());
			productDAO.setFileInsert(productImageDTO);
						
		}
		
		return result;
	}
	
	public int setUpdate(ProductDTO productDTO)throws Exception{
		
	
		
		return productDAO.setUpdate(productDTO);
	
	
	
	
	
	}
	
	public int setDelete(ProductDTO productDTO)throws Exception{
		
		return productDAO.setDelete(productDTO);
	}
	
	
	
	public List<ProductImageDTO> getFilesSelect(ProductDTO productDTO)throws Exception{
		return productDAO.getFilesSelect(productDTO);
	}

	
	
	
	
	
	public int setFileDelete(ProductImageDTO productImageDTO)throws Exception{
		
		productImageDTO = productDAO.getFileSelect(productImageDTO); 
		//db에서 삭제
		int result = productDAO.setFileDelete(productImageDTO);
		//파일 삭제
		fileManager.deleteFile(productImageDTO.getFileName(), request);
			if(result>0){
			fileManager.deleteFile(productImageDTO.getFileName(),request);
		}
		 return result;
	}
	
	
	public int setMinus(ProductDTO productDTO) throws Exception{
		return productDAO.setMinus(productDTO);
	}
	
	public ProductImageDTO getFileselect(ProductImageDTO productImageDTO)throws Exception{
		return productImageDTO = productDAO.getFileSelect(productImageDTO); 
	}
	
	
}
