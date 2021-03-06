package com.shs.s1.product;

import java.util.List;



public class ProductDTO {

	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	private long productNum;
	private String kinds;
	private String contents;
	private long price;
	private String productName;
	private long amount;
	private List<ProductImageDTO> productImages;

	
	
	
	public List<ProductImageDTO> getProductImages() {
		return productImages;
	}
	public void setProductImages(List<ProductImageDTO> productImages) {
		this.productImages = productImages;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	
	
}
