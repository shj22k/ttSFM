package main.sfm.rcommunity.vo;

public class SfmRcommunityVO {

	private String rcnum;
	private String rcname;
	private String rccontent;
	private String deleteyn;
	private String insertdate;
	private String cnum;
	
	public SfmRcommunityVO() {
		
	}
	
	public SfmRcommunityVO(String rcnum, String rcname, String rccontent, String deleteyn, String insertdate,
			String cnum) {
		
		this.rcnum = rcnum;
		this.rcname = rcname;
		this.rccontent = rccontent;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.cnum = cnum;
	}
	
	public String getRcnum() {
		return rcnum;
	}
	public void setRcnum(String rcnum) {
		this.rcnum = rcnum;
	}
	public String getRcname() {
		return rcname;
	}
	public void setRcname(String rcname) {
		this.rcname = rcname;
	}
	public String getRccontent() {
		return rccontent;
	}
	public void setRccontent(String rccontent) {
		this.rccontent = rccontent;
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
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}


}
