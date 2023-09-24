package kr.or.ddit.cart.vo;

public class CartVO {
	private String memId;
	private String prodNo;
	private int ctQty;
	
	
	public CartVO() {
		super();
	}


	public CartVO(String memId, String prodNo, int ctQty) {
		super();
		this.memId = memId;
		this.prodNo = prodNo;
		this.ctQty = ctQty;
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


	public int getCtQty() {
		return ctQty;
	}


	public void setCtQty(int ctQty) {
		this.ctQty = ctQty;
	}


	@Override
	public String toString() {
		return "CartVO [memId=" + memId + ", prodNo=" + prodNo + ", ctQty=" + ctQty + "]";
	}


	
	
	
	
	
}
