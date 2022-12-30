package main.sfm.community.vo;

public class SfmCommunityVO {

	private String cnum;
	private String csubject;
	private String cname;
	private String ccontent;
	private String cfile;
	private String memnum;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	
	public SfmCommunityVO() {
		
	}
	
	public SfmCommunityVO(String cnum, String csubject, String cname, String ccontent, String cfile, String memnum,
			String deleteyn, String insertdate, String updatedate) {

		this.cnum = cnum;
		this.csubject = csubject;
		this.cname = cname;
		this.ccontent = ccontent;
		this.cfile = cfile;
		this.memnum = memnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}
	
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getCsubject() {
		return csubject;
	}
	public void setCsubject(String csubject) {
		this.csubject = csubject;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCfile() {
		return cfile;
	}
	public void setCfile(String cfile) {
		this.cfile = cfile;
	}
	public String getMemnum() {
		return memnum;
	}
	public void setMemnum(String memnum) {
		this.memnum = memnum;
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
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	
	
	
}
