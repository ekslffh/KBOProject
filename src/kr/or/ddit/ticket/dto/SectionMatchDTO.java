package kr.or.ddit.ticket.dto;

/**
 *	특정경기에 따른 섹션정보 DTO
 */
public class SectionMatchDTO {

	private String scNo;	// 구역번호
	private String scName;	// 구역이름
	private int scCapacity;	// 수용인원
	private String scPrice;	// 가격
	private String stNo;	// 경기장번호
	private int rNum;		// 예매인원
	
	public String getScNo() {
		return scNo;
	}
	public void setScNo(String scNo) {
		this.scNo = scNo;
	}
	public String getScName() {
		return scName;
	}
	public void setScName(String scName) {
		this.scName = scName;
	}
	public int getScCapacity() {
		return scCapacity;
	}
	public void setScCapacity(int scCapacity) {
		this.scCapacity = scCapacity;
	}
	public String getScPrice() {
		return scPrice;
	}
	public void setScPrice(String scPrice) {
		this.scPrice = scPrice;
	}
	public String getStNo() {
		return stNo;
	}
	public void setStNo(String stNo) {
		this.stNo = stNo;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	
	@Override
	public String toString() {
		return "SectionAboutMatchDTO [scNo=" + scNo + ", scName=" + scName + ", scCapacity=" + scCapacity + ", scPrice="
				+ scPrice + ", stNo=" + stNo + ", rNum=" + rNum + "]";
	}
	
}
