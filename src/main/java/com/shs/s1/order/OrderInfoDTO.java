package com.shs.s1.order;

import java.sql.Date;

public class OrderInfoDTO {

	private long oinum;
	private String id;
	private long productNum;
	private String productName;
	private long ordernum;
	private Date orderDate;
	private String orderProcess;
	private String orderCondition;
	private Long shippingNum;
	private Long orderPrice;
	
	
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getShippingNum() {
		return shippingNum;
	}
	public void setShippingNum(Long shippingNum) {
		this.shippingNum = shippingNum;
	}
	public Long getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Long orderPrice) {
		this.orderPrice = orderPrice;
	}
	public long getOinum() {
		return oinum;
	}
	public void setOinum(long oinum) {
		this.oinum = oinum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public long getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(long ordernum) {
		this.ordernum = ordernum;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderProcess() {
		return orderProcess;
	}
	public void setOrderProcess(String orderProcess) {
		this.orderProcess = orderProcess;
	}
	public String getOrderCondition() {
		return orderCondition;
	}
	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}
	
	
	
	
	
	
	
}
