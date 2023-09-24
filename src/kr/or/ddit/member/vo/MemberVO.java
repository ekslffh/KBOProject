package kr.or.ddit.member.vo;

public class MemberVO {
	
	private String memId; // 고객아이디
	private String memPw; // 고객비밀번호
	private String memName; // 고객이름
	private String memBirth; // 고객생년월일
	private String memGender; // 고객성별
	private String memEmail; // 고객이메일
	private String memTel; // 고객전화번호
	private String memAdd; // 고객주소
	private String memAdd1;
	private String memAdd2;
	private String msName; // 등급명
	private String cbNo; // 구단번호
	
	public MemberVO() {}
	
	public MemberVO(String memPw, String memName, String memEmail, String memTel, String memAdd, String cbNo) {
		super();
		this.memPw = memPw;
		this.memName = memName;
		this.memEmail = memEmail;
		this.memTel = memTel;
		this.memAdd = memAdd;
		this.cbNo = cbNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	
	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemAdd() {
		return memAdd;
	}

	public void setMemAdd(String memAdd) {
		this.memAdd = memAdd;
	}

	public String getMemAdd1() {
		return memAdd1;
	}

	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}

	public String getMemAdd2() {
		return memAdd2;
	}

	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}

	public String getMsName() {
		return msName;
	}

	public void setMsName(String msName) {
		this.msName = msName;
	}

	public String getCbNo() {
		return cbNo;
	}

	public void setCbNo(String cbNo) {
		this.cbNo = cbNo;
	}

	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memBirth=" + memBirth
				+ ", memGender=" + memGender + ", memEmail=" + memEmail + ", memTel=" + memTel + ", memAdd=" + memAdd
				+ ", msName=" + msName + ", cbNo=" + cbNo + "]";
	}

}
