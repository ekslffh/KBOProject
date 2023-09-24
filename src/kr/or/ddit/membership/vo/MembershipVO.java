package kr.or.ddit.membership.vo;

public class MembershipVO {

	private String msName;		// 등급명
	private double ms_amount;	// 등급금액
	private String msDcRate;	// 할인율
	
	public MembershipVO() {}
	
	public MembershipVO(String msName, double ms_amount, String msDcRate) {
		this.msName = msName;
		this.ms_amount = ms_amount;
		this.msDcRate = msDcRate;
	}
	
	public String getMsName() {
		return msName;
	}
	public void setMsName(String msName) {
		this.msName = msName;
	}
	public double getMs_amount() {
		return ms_amount;
	}
	public void setMs_amount(double ms_amount) {
		this.ms_amount = ms_amount;
	}
	public String getMsDcRate() {
		return msDcRate;
	}
	public void setMsDcRate(String msDcRate) {
		this.msDcRate = msDcRate;
	}
	
	@Override
	public String toString() {
		return "MembershipVO [msName=" + msName + ", ms_amount=" + ms_amount + ", msDcRate=" + msDcRate + "]";
	}
	
}
