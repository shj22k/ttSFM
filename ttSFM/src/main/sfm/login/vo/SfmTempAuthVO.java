package main.sfm.login.vo;

public class SfmTempAuthVO {
	
	private String authnum;
	private String authcertification;
	private String mememail;
	private String insertdate;
	
	public SfmTempAuthVO() {
		
	}
	
	public SfmTempAuthVO(String authnum, String authcertification, String mememail, String insertdate) {
		super();
		this.authnum = authnum;
		this.authcertification = authcertification;
		this.mememail = mememail;
		this.insertdate = insertdate;
	}

	public String getAuthnum() {
		return authnum;
	}

	public void setAuthnum(String authnum) {
		this.authnum = authnum;
	}

	public String getAuthcertification() {
		return authcertification;
	}

	public void setAuthcertification(String authcertification) {
		this.authcertification = authcertification;
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
