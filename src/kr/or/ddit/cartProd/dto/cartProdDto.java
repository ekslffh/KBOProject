package kr.or.ddit.cartProd.dto;

public class cartProdDto {
	private String prodNo;
    private String prodName;
    private String prodPrice;
    private int ctQty;
    private int itemPrice;
    
	public cartProdDto() {
		super();
	}

	public cartProdDto(String prodNo, String prodName, String prodPrice, int ctQty, int itemPrice) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.ctQty = ctQty;
		this.itemPrice = itemPrice;
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

	public int getCtQty() {
		return ctQty;
	}

	public void setCtQty(int ctQty) {
		this.ctQty = ctQty;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	@Override
	public String toString() {
		return "cartProdDto [prodNo=" + prodNo + ", prodName=" + prodName + ", prodPrice=" + prodPrice + ", ctQty="
				+ ctQty + ", itemPrice=" + itemPrice + "]";
	}
	
    
}
