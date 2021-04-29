package com.shs.s1.admin.addressInfo;

public class AInfoDTO {
	
	private long addressNum;
	private String id;
	private long zipCode;
	private String majorAddr;
	private String minorAddr;
	private String addrMessage;
	private long orderNum;

	public long getAddressNum() {
		return addressNum;
	}

	public void setAddressNum(long addressNum) {
		this.addressNum = addressNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getZipCode() {
		return zipCode;
	}

	public void setZipCode(long zipCode) {
		this.zipCode = zipCode;
	}

	public String getMajorAddr() {
		return majorAddr;
	}

	public void setMajorAddr(String majorAddr) {
		this.majorAddr = majorAddr;
	}

	public String getMinorAddr() {
		return minorAddr;
	}

	public void setMinorAddr(String minorAddr) {
		this.minorAddr = minorAddr;
	}

	public String getAddrMessage() {
		return addrMessage;
	}

	public void setAddrMessage(String addrMessage) {
		this.addrMessage = addrMessage;
	}

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}

}
