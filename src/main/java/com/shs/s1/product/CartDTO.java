package com.shs.s1.product;

import java.sql.Date;

public class CartDTO {

	private long cartNum;
	private long productNum;
	private String id;
	private long cartStock;
	private Date addDate;
	
	
	public long getCartNum() {
		return cartNum;
	}
	public void setCartNum(long cartNum) {
		this.cartNum = cartNum;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getCartStock() {
		return cartStock;
	}
	public void setCartStock(long cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	
	
	
	
}
