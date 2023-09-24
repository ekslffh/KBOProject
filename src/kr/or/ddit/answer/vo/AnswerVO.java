package kr.or.ddit.answer.vo;

public class AnswerVO {
	String pqNo;		// 문의번호
	String paContent;	// 답변내용
	String paDate;		// 답변일시
	
	public AnswerVO() {
		// TODO Auto-generated constructor stub
	}
	public AnswerVO(String pqNo, String paContent, String paDate) {
		super();
		this.pqNo = pqNo;
		this.paContent = paContent;
		this.paDate = paDate;
	}
	public String getPqNo() {
		return pqNo;
	}
	public void setPqNo(String pqNo) {
		this.pqNo = pqNo;
	}
	public String getPaContent() {
		return paContent;
	}
	public void setPaContent(String paContent) {
		this.paContent = paContent;
	}
	public String getPaDate() {
		return paDate;
	}
	public void setPaDate(String paDate) {
		this.paDate = paDate;
	}
	
	@Override
	public String toString() {
		return "AnswerVO [pqNo=" + pqNo + ", paContent=" + paContent + ", paDate=" + paDate + "]";
	}
	
}
