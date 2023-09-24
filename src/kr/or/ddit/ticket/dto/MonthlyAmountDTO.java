package kr.or.ddit.ticket.dto;

public class MonthlyAmountDTO {
	
	private String month;
	private String monthAmount;
	
	public MonthlyAmountDTO() {}
	
	public MonthlyAmountDTO(String month, String monthAmount) {
		super();
		this.month = month;
		this.monthAmount = monthAmount;
	}

	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getAmount() {
		return monthAmount;
	}
	public void setAmount(String amount) {
		this.monthAmount = amount;
	}

	@Override
	public String toString() {
		return "MonthlyAmountDTO [month=" + month + ", monthAmount=" + monthAmount + "]";
	}
	
}
