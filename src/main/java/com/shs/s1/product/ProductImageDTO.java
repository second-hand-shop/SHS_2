package com.shs.s1.product;

public class ProductImageDTO {

	
	private long imageNum;
	private long productNum;
	private String thumbnail;
	private String contents;
	private String fileName;
	private String ogName;
	
	
	public long getImageNum() {
		return imageNum;
	}
	public void setImageNum(long imageNum) {
		this.imageNum = imageNum;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOgName() {
		return ogName;
	}
	public void setOgName(String ogName) {
		this.ogName = ogName;
	}
	
	
	
}
