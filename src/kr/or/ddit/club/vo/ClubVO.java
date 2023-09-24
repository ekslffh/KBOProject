package kr.or.ddit.club.vo;

public class ClubVO {
	
	private String cbNo;          //구단번호
	private String cbName;        //구단이름
	private String cbManager;     //구단관리자
    private int atchFileId;       //첨부파일ID
    
	public ClubVO(String cbNo, String cbName, String cbManager, int atchFileId) {
		super();
		this.cbNo = cbNo;
		this.cbName = cbName;
		this.cbManager = cbManager;
		this.atchFileId = atchFileId;
	}
    
	public ClubVO() {
		// TODO Auto-generated constructor stub
	}

	public String getCbNo() {
		return cbNo;
	}

	public void setCbNo(String cbNo) {
		this.cbNo = cbNo;
	}

	public String getCbName() {
		return cbName;
	}

	public void setCbName(String cbName) {
		this.cbName = cbName;
	}

	public String getCbManager() {
		return cbManager;
	}

	public void setCbManager(String cbManager) {
		this.cbManager = cbManager;
	}

	public int getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(int atchFileId) {
		this.atchFileId = atchFileId;
	}

	@Override
	public String toString() {
		return "ClubVO [cbNo=" + cbNo + ", cbName=" + cbName + ", cbManager=" + cbManager + ", atchFileId=" + atchFileId
				+ "]";
	}
	
}
