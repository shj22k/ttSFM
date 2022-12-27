package main.sfm.login.vo;

public class SfmTempPwVO {
	
	private String pwauth;
	private String pwcertification;
	private String memid;
	private String mememail;
	private String insertdate;
	
	public SfmTempPwVO(String pwauth, String pwcertification, String memid, String mememail, String insertdate) {
		super();
		this.pwauth = pwauth;
		this.pwcertification = pwcertification;
		this.memid = memid;
		this.mememail = mememail;
		this.insertdate = insertdate;
	}

	public SfmTempPwVO() {
		
	}

	public String getPwauth() {
		return pwauth;
	}

	public void setPwauth(String pwauth) {
		this.pwauth = pwauth;
	}

	public String getPwcertification() {
		return pwcertification;
	}

	public void setPwcertification(String pwcertification) {
		this.pwcertification = pwcertification;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMememail() {
		return mememail;
	}

	public void setMememail(String mememail) {
		this.mememail = mememail;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

}
