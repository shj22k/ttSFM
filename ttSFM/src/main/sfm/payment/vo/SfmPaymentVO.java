package main.sfm.payment.vo;

public class SfmPaymentVO {

	private String paymentnum;
	private String paymentweek;
	private String matchnum;
	private String deleteyn;
	private String insertdate;
	
	
	public SfmPaymentVO() {
		
	}
	
	public SfmPaymentVO(String paymentnum, String paymentweek, String matchnum, String deleteyn, String insertdate) {
		this.paymentnum = paymentnum;
		this.paymentweek = paymentweek;
		this.matchnum = matchnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
	}
	
	public String getPaymentnum() {
		return paymentnum;
	}
	public void setPaymentnum(String paymentnum) {
		this.paymentnum = paymentnum;
	}
	public String getPaymentweek() {
		return paymentweek;
	}
	public void setPaymentweek(String paymentweek) {
		this.paymentweek = paymentweek;
	}
	public String getMatchnum() {
		return matchnum;
	}
	public void setMatchnum(String matchnum) {
		this.matchnum = matchnum;
	}
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	
}
