package kr.or.ddit.orders.vo;

import java.util.Date;

public class OrdersVO {
	
	private String orNo;        //주문번호
	private Date orDate;      //주문날짜
	private String orAdd;       //배송지
	private String memId;       //고객아이디
	private String payNo;       //결제번호
	
	public OrdersVO(String orNO, Date orDate, String orAdd, String memId, String payNo) {
		super();
		this.orNo = orNO;
		this.orDate = orDate;
		this.orAdd = orAdd;
		this.memId = memId;
		this.payNo = payNo;
	}
	
	public OrdersVO() {
		// TODO Auto-generated constructor stub
	}

	
	

	public String getOrNo() {
		return orNo;
	}

	public void setOrNo(String orNo) {
		this.orNo = orNo;
	}

	public Date getOrDate() {
		return orDate;
	}

	public void setOrDate(Date orDate) {
		this.orDate = orDate;
	}

	public String getOrAdd() {
		return orAdd;
	}

	public void setOrAdd(String orAdd) {
		this.orAdd = orAdd;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	@Override
	public String toString() {
		return "OrdersVO [orNo=" + orNo + ", orDate=" + orDate + ", orAdd=" + orAdd + ", memId=" + memId + ", payNo="
				+ payNo + "]";
	}
	
}
