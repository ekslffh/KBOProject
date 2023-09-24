package kr.or.ddit.ques.vo;


public class QuestionVO {

	private String pqNo;
	private String pqTitle;
	private String pqContent;
	private String pqDate;
	private String prodNo;
	private String memId;
	
	
	public String getPqNo() {
		return pqNo;
	}
	public void setPqNo(String pqNo) {
		this.pqNo = pqNo;
	}
	public String getPqTitle() {
		return pqTitle;
	}
	public void setPqTitle(String pqTitle) {
		this.pqTitle = pqTitle;
	}
	public String getPqContent() {
		return pqContent;
	}
	public void setPqContent(String pqContent) {
		this.pqContent = pqContent;
	}
	public String getPqDate() {
		return pqDate;
	}
	public void setPqDate(String pqDate) {
		this.pqDate = pqDate;
	}
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "QuestionVO [pqNo=" + pqNo + ", pqTitle=" + pqTitle + ", pqContent=" + pqContent + ", pqDate=" + pqDate
				+ ", prodNo=" + prodNo + ", memId=" + memId + "]";
	}
	
	
			
	
	
	
	
	
	
}
