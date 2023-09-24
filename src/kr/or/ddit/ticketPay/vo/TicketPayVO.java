package kr.or.ddit.ticketPay.vo;

public class TicketPayVO {

	private String tpNo;	// 결제번호
	private String tpPrice;	// 예매금액
	private String tpDc;	// 할인금액
	private String tpAmount;// 결제금액
	private String tpDate;	// 결제일시
	
	public TicketPayVO() {}
	
	public TicketPayVO(String tpNo, String tpPrice, String tpDc, String tpAmount, String tpDate) {
		this.tpNo = tpNo;
		this.tpPrice = tpPrice;
		this.tpDc = tpDc;
		this.tpAmount = tpAmount;
		this.tpDate = tpDate;
	}
	
	public String getTpNo() {
		return tpNo;
	}
	public void setTpNo(String tpNo) {
		this.tpNo = tpNo;
	}
	public String getTpPrice() {
		return tpPrice;
	}
	public void setTpPrice(String tpPrice) {
		this.tpPrice = tpPrice;
	}
	public String getTpDc() {
		return tpDc;
	}
	public void setTpDc(String tpDc) {
		this.tpDc = tpDc;
	}
	public String getTpAmount() {
		return tpAmount;
	}
	public void setTpAmount(String tpAmount) {
		this.tpAmount = tpAmount;
	}
	public String getTpDate() {
		return tpDate;
	}
	public void setTpDate(String tpDate) {
		this.tpDate = tpDate;
	}

	@Override
	public String toString() {
		return "TicketPayVO [tpNo=" + tpNo + ", tpPrice=" + tpPrice + ", tpDc=" + tpDc + ", tpAmount=" + tpAmount
				+ ", tpDate=" + tpDate + "]";
	}
	
}
