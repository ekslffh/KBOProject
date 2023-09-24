package kr.or.ddit.review.vo;

import java.util.Date;

public class ReviewVO {
	
	private String prNo;
	private String prContent;
	private String prFile;
	private String prDate;
	private int prHeart;
	private String memId;
	private String prodNo;
	private int atchFileId;
	
	
	public ReviewVO() {
		super();
	}


	public ReviewVO(String prNo, String prContent, String prFile, String prDate, int prHeart, String memId,
			String prodNo, int atchFileId) {
		super();
		this.prNo = prNo;
		this.prContent = prContent;
		this.prFile = prFile;
		this.prDate = prDate;
		this.prHeart = prHeart;
		this.memId = memId;
		this.prodNo = prodNo;
		this.atchFileId = atchFileId;
	}


	public String getPrNo() {
		return prNo;
	}


	public void setPrNo(String prNo) {
		this.prNo = prNo;
	}


	public String getPrContent() {
		return prContent;
	}


	public void setPrContent(String prContent) {
		this.prContent = prContent;
	}


	public String getPrFile() {
		return prFile;
	}


	public void setPrFile(String prFile) {
		this.prFile = prFile;
	}


	public String getPrDate() {
		return prDate;
	}


	public void setPrDate(String prDate) {
		this.prDate = prDate;
	}


	public int getPrHeart() {
		return prHeart;
	}


	public void setPrHeart(int prHeart) {
		this.prHeart = prHeart;
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


	public int getAtchFileId() {
		return atchFileId;
	}


	public void setAtchFileId(int atchFileId) {
		this.atchFileId = atchFileId;
	}


	@Override
	public String toString() {
		return "ReviewVO [prNo=" + prNo + ", prContent=" + prContent + ", prFile=" + prFile + ", prDate=" + prDate
				+ ", prHeart=" + prHeart + ", memId=" + memId + ", prodNo=" + prodNo + ", atchFileId=" + atchFileId
				+ "]";
	}


	
	
	
	
	
}
