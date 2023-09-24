package kr.or.ddit.notice.vo;

public class NoticeVO {
	
	private String nbNo;
	private String nbTitle;
	private String nbContent;
	private String nbCreatedDt;
	private String nbUpdatedDt;
	private String memId;
	private String atchFileId;
	
	public NoticeVO(String nbNo, String nbTitle, String nbContent, String nbCreatedDt, String nbUpdatedDt, String memId,
			String atchFileId) {
		super();
		this.nbNo = nbNo;
		this.nbTitle = nbTitle;
		this.nbContent = nbContent;
		this.nbCreatedDt = nbCreatedDt;
		this.nbUpdatedDt = nbUpdatedDt;
		this.memId = memId;
		this.atchFileId = atchFileId;
	}
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public String getNbNo() {
		return nbNo;
	}

	public void setNbNo(String nbNo) {
		this.nbNo = nbNo;
	}

	public String getNbTitle() {
		return nbTitle;
	}

	public void setNbTitle(String nbTitle) {
		this.nbTitle = nbTitle;
	}

	public String getNbContent() {
		return nbContent;
	}

	public void setNbContent(String nbContent) {
		this.nbContent = nbContent;
	}

	public String getNbCreatedDt() {
		return nbCreatedDt;
	}

	public void setNbCreatedDt(String nbCreatedDt) {
		this.nbCreatedDt = nbCreatedDt;
	}

	public String getNbUpdatedDt() {
		return nbUpdatedDt;
	}

	public void setNbUpdatedDt(String nbUpdatedDt) {
		this.nbUpdatedDt = nbUpdatedDt;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	@Override
	public String toString() {
		return "NoticeVO [nbNo=" + nbNo + ", nbTitle=" + nbTitle + ", nbContent=" + nbContent + ", nbCreatedDt="
				+ nbCreatedDt + ", nbUpdatedDt=" + nbUpdatedDt + ", memId=" + memId + ", atchFileId=" + atchFileId
				+ "]";
	}
	
}
