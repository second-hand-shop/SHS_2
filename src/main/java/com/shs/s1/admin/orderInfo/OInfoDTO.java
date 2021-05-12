package com.shs.s1.admin.orderInfo;

import java.sql.Date;

import com.shs.s1.admin.addressInfo.AInfoDTO;

public class OInfoDTO {

	private long oiNum;
	private String id;
	private long productNum;
	private long orderNum;
	private Date orderDate;
	private String orderProcess;
	private String orderCondition;
	private long shippingNum;
	private String orderPrice;
	private String productName;

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public long getOiNum() {
		return oiNum;
	}

	public void setOiNum(long oiNum) {
		this.oiNum = oiNum;
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

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
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

	public long getShippingNum() {
		return shippingNum;
	}

	public void setShippingNum(long shippingNum) {
		this.shippingNum = shippingNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
