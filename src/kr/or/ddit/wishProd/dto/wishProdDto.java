package kr.or.ddit.wishProd.dto;

import java.util.Date;

public class wishProdDto {
	private String prodNo;
    private String prodName;
    private String prodPrice;
    private Date wiDate;
    
	public wishProdDto() {
		super();
	}

	public wishProdDto(String prodNo, String prodName, String prodPrice, Date wiDate) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.wiDate = wiDate;
	}

	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}

	public Date getWiDate() {
		return wiDate;
	}

	public void setWiDate(Date wiDate) {
		this.wiDate = wiDate;
	}

	@Override
	public String toString() {
		return "wishProdDto [prodNo=" + prodNo + ", prodName=" + prodName + ", prodPrice=" + prodPrice + ", wiDate="
				+ wiDate + "]";
	}

	
	
	

	
    
	
    
    
	
	
    
}
