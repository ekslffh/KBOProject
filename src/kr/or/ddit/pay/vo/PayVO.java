package kr.or.ddit.pay.vo;

import java.util.Date;

public class PayVO {
	
	private String payNo;       //결제번호
	private String payPrice;    //상품총액
	private String payDc;       //할인금액
	private String payAmount;   //결제금액
	private Date payDate;     //결제일시
	public PayVO(String payNo, String payPrice, String payDc, String payAmount, Date payDate) {
		super();
		this.payNo = payNo;
		this.payPrice = payPrice;
		this.payDc = payDc;
		this.payAmount = payAmount;
		this.payDate = payDate;
	}
	
	public PayVO() {
		// TODO Auto-generated constructor stub
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(String payPrice) {
		this.payPrice = payPrice;
	}

	public String getPayDc() {
		return payDc;
	}

	public void setPayDc(String payDc) {
		this.payDc = payDc;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}



	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "PayVO [payNo=" + payNo + ", payPrice=" + payPrice + ", payDc=" + payDc + ", payAmount=" + payAmount
				+ ", payDate=" + payDate + "]";
	}
	
	
	
	
}
