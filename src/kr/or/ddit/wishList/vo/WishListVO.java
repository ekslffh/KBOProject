package kr.or.ddit.wishList.vo;

import java.util.Date;

public class WishListVO {
	
	private String memId;
	private String prodNo;
	private Date wiDate;
	
	public WishListVO() {
		super();
	}

	public WishListVO(String memId, String prodNo, Date wiDate) {
		super();
		this.memId = memId;
		this.prodNo = prodNo;
		this.wiDate = wiDate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}

	public Date getWiDate() {
		return wiDate;
	}

	public void setWiDate(Date wiDate) {
		this.wiDate = wiDate;
	}

	@Override
	public String toString() {
		return "WishListVO [memId=" + memId + ", prodNo=" + prodNo + ", wiDate=" + wiDate + "]";
	}



	

	
	
	
}
	