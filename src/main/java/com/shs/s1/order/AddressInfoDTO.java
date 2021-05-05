package com.shs.s1.order;

import java.util.List;

import com.shs.s1.product.ProductDTO;



public class AddressInfoDTO {
	
	private long addressNum;
	private long orderNum;
	private String id;
	private long productNum;
	private long price;
	private long amount;
	private String name;
	private String zipCode;
	private String addr;
	private String phone;
	private String email;
	private String addrMessage;
	
	private List<ProductDTO> products;
	
	
	
	
	

	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public List<ProductDTO> getProducts() {
		return products;
	}
	public void setProducts(List<ProductDTO> products) {
		this.products = products;
	}
	public long getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(long addressNum) {
		this.addressNum = addressNum;
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
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddrMessage() {
		return addrMessage;
	}
	public void setAddrMessage(String addrMessage) {
		this.addrMessage = addrMessage;
	}
	
	
	
	
	
	
	
	
}
