package kr.or.ddit.ticket.vo;

public class TicketVO {

	private String tNo; // 예매번호
	private String memId; // 고객아이디
	private String mNo; // 경기번호
	private String scNo; // 구역번호
	private String seNo; // 좌석번호
	private String tDate; // 예매일자
	private String tpNo; // 결제번호

	// 기본 생성자
	public TicketVO() {
	}

	// 삽입시 사용 (tDate는 기본sysdate로)
	public TicketVO(String tNo, String memId, String mNo, String scNo, String seNo) {
		super();
		this.tNo = tNo;
		this.memId = memId;
		this.mNo = mNo;
		this.scNo = scNo;
		this.seNo = seNo;
	}

	// 조회시 사용
	public TicketVO(String tNo, String memId, String mNo, String scNo, String seNo, String tDate, String tpNo) {
		super();
		this.tNo = tNo;
		this.memId = memId;
		this.mNo = mNo;
		this.scNo = scNo;
		this.seNo = seNo;
		this.tDate = tDate;
		this.tpNo = tpNo;
	}

	public String gettNo() {
		return tNo;
	}

	public void settNo(String tNo) {
		this.tNo = tNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String getScNo() {
		return scNo;
	}

	public void setScNo(String scNo) {
		this.scNo = scNo;
	}

	public String getSeNo() {
		return seNo;
	}

	public void setSeNo(String seNo) {
		this.seNo = seNo;
	}

	public String gettDate() {
		return tDate;
	}

	public void settDate(String tDate) {
		this.tDate = tDate;
	}
	
	public String getTpNo() {
		return tpNo;
	}

	public void setTpNo(String tpNo) {
		this.tpNo = tpNo;
	}

	@Override
	public String toString() {
		return "TicketVO [tNo=" + tNo + ", memId=" + memId + ", mNo=" + mNo + ", scNo=" + scNo + ", seNo=" + seNo
				+ ", tDate=" + tDate + ", tpNo=" + tpNo + "]";
	}

}
