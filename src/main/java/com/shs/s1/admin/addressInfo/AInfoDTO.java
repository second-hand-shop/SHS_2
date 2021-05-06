package com.shs.s1.admin.addressInfo;

import com.shs.s1.member.MemberDTO;

public class AInfoDTO extends MemberDTO {

	private long orderNum;
	private long productNum;
	private long price;
	private String productName;
	private String zipCode;
	private String addr;
	private String addrMessage;

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}

	public long getProductNum() {
		return productNum;
	}

	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrMessage() {
		return addrMessage;
	}

	public void setAddrMessage(String addrMessage) {
		this.addrMessage = addrMessage;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	

}
