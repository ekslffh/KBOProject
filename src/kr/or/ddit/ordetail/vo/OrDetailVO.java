package kr.or.ddit.ordetail.vo;

public class OrDetailVO {
	
	private String orNo;        //주문번호
	private String prodNo;      //상품번호
	private int odQty;          //수량
	private String doAmount;    //금액
	
	public OrDetailVO(String orNo, String prodNo, int odQty, String doAmount) {
		super();
		this.orNo = orNo;
		this.prodNo = prodNo;
		this.odQty = odQty;
		this.doAmount = doAmount;
	}
	
	public OrDetailVO() {
		// TODO Auto-generated constructor stub
	}

	public String getOrNo() {
		return orNo;
	}

	public void setOrNo(String orNo) {
		this.orNo = orNo;
	}

	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}

	public int getOdQty() {
		return odQty;
	}

	public void setOdQty(int odQty) {
		this.odQty = odQty;
	}

	public String getDoAmount() {
		return doAmount;
	}

	public void setDoAmount(String doAmount) {
		this.doAmount = doAmount;
	}

	@Override
	public String toString() {
		return "OrDetailVO [orNo=" + orNo + ", prodNo=" + prodNo + ", odQty=" + odQty + ", doAmount=" + doAmount + "]";
	}
	
}
