package kr.or.ddit.match.vo;

public class MatchVO {
	private String mNo; // 경기번호
	private String mDate; // 경기 일자
	private String mPlay; // 경기 여부
	private String cbHome; // 홈팀
	private String cbAway; // 어웨이팀
	private String stNo; // 경기장 번호, 이름
	
	public MatchVO() {}

	public MatchVO(String mNo, String mDate, String mPlay, String cbHome, String cbAway, String stNo) {
		super();
		this.mNo = mNo;
		this.mDate = mDate;
		this.mPlay = mPlay;
		this.cbHome = cbHome;
		this.cbAway = cbAway;
		this.stNo = stNo;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public String getmPlay() {
		return mPlay;
	}

	public void setmPlay(String mPlay) {
		this.mPlay = mPlay;
	}

	public String getCbHome() {
		return cbHome;
	}

	public void setCbHome(String cbHome) {
		this.cbHome = cbHome;
	}

	public String getCbAway() {
		return cbAway;
	}

	public void setCbAway(String cbAway) {
		this.cbAway = cbAway;
	}

	public String getStNo() {
		return stNo;
	}

	public void setStNo(String stNo) {
		this.stNo = stNo;
	}

	@Override
	public String toString() {
		return "MatchVO [mNo=" + mNo + ", mDate=" + mDate + ", mPlay=" + mPlay + ", cbHome=" + cbHome + ", cbAway="
				+ cbAway + ", stNo=" + stNo + "]";
	}
	
	
	
	
}
