package main.sfm.payment.vo;

public class SfmPaymentVO {

	private String paymentnum;
	private String paymentweek;
	private String paymentname;
	private String matchnum;
	private String deleteyn;
	private String insertdate;
	private String memnum;

	private String matchkickoff;
	private String matchtime;
	private String matchstadium;
	private String matchpersonnel;
	
	public SfmPaymentVO() {
		
	}

	public SfmPaymentVO(String paymentnum, String paymentweek, String paymentname, String matchnum, String deleteyn,
			String insertdate, String memnum, String matchkickoff, String matchtime, String matchstadium,
			String matchpersonnel) {
		this.paymentnum = paymentnum;
		this.paymentweek = paymentweek;
		this.paymentname = paymentname;
		this.matchnum = matchnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.memnum = memnum;
		this.matchkickoff = matchkickoff;
		this.matchtime = matchtime;
		this.matchstadium = matchstadium;
		this.matchpersonnel = matchpersonnel;
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

	public String getPaymentname() {
		return paymentname;
	}

	public void setPaymentname(String paymentname) {
		this.paymentname = paymentname;
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

	public String getMemnum() {
		return memnum;
	}

	public void setMemnum(String memnum) {
		this.memnum = memnum;
	}

	public String getMatchkickoff() {
		return matchkickoff;
	}

	public void setMatchkickoff(String matchkickoff) {
		this.matchkickoff = matchkickoff;
	}

	public String getMatchtime() {
		return matchtime;
	}

	public void setMatchtime(String matchtime) {
		this.matchtime = matchtime;
	}

	public String getMatchstadium() {
		return matchstadium;
	}

	public void setMatchstadium(String matchstadium) {
		this.matchstadium = matchstadium;
	}

	public String getMatchpersonnel() {
		return matchpersonnel;
	}

	public void setMatchpersonnel(String matchpersonnel) {
		this.matchpersonnel = matchpersonnel;
	}
	
}
