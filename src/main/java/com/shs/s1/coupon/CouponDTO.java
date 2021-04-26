package com.shs.s1.coupon;

public class CouponDTO {

	private String couponNum;
	private String id;
	private long disRate;
	private long disPrice;
	private String usage;

	public String getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(String couponNum) {
		this.couponNum = couponNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getDisRate() {
		return disRate;
	}

	public void setDisRate(long disRate) {
		this.disRate = disRate;
	}

	public long getDisPrice() {
		return disPrice;
	}

	public void setDisPrice(long disPrice) {
		this.disPrice = disPrice;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

}
