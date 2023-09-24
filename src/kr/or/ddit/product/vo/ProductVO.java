package kr.or.ddit.product.vo;

public class ProductVO {
	
	private String prodNo;       //상품번호
	private String cgName;       //카테고리명
	private String prodName;     //상품명
	private String prodPrice;    //가격
	private int prodStock;       //재고
	private String cbNo;         //구단번호
	private String prodDetail; 	 //상세정보
	private long atchFileId = -1; //첨부파일ID
	public ProductVO(String prodNo, String cgName, String prodName, String prodPrice, int prodStock, String cbNo,
			String prodDetail, long atchFileId) {
		super();
		this.prodNo = prodNo;
		this.cgName = cgName;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodStock = prodStock;
		this.cbNo = cbNo;
		this.prodDetail = prodDetail;
		this.atchFileId = atchFileId;
	}
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}

	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}

	public String getCgName() {
		return cgName;
	}

	public void setCgName(String cgName) {
		this.cgName = cgName;
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

	public int getProdStock() {
		return prodStock;
	}

	public void setProdStock(int prodStock) {
		this.prodStock = prodStock;
	}

	public String getCbNo() {
		return cbNo;
	}

	public void setCbNo(String cbNo) {
		this.cbNo = cbNo;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public long getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}

	@Override
	public String toString() {
		return "ProductVO [prodNo=" + prodNo + ", cgName=" + cgName + ", prodName=" + prodName + ", prodPrice="
				+ prodPrice + ", prodStock=" + prodStock + ", cbNo=" + cbNo + ", prodDetail=" + prodDetail
				+ ", atchFileId=" + atchFileId + "]";
	}
	
	
	
}