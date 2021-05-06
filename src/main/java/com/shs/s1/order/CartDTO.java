package com.shs.s1.order;

import java.sql.Date;
import java.util.List;

import com.shs.s1.product.ProductDTO;
import com.shs.s1.product.ProductImageDTO;

public class CartDTO {

	private long cartNum;
	private long productNum;
	private String id;
	private long cartStock;
	private Date addDate;
	private List<ProductDTO> products;
	private List<ProductImageDTO> productImages;
	
	
	
	public List<ProductImageDTO> getProductImages() {
		return productImages;
	}
	public void setProductImages(List<ProductImageDTO> productImages) {
		this.productImages = productImages;
	}
	public List<ProductDTO> getProducts() {
		return products;
	}
	public void setProducts(List<ProductDTO> products) {
		this.products = products;
	}
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
