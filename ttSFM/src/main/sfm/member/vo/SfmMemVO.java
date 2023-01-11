package main.sfm.member.vo;

public class SfmMemVO {
	
	private String memnum;
	private String memname;
	private String memid;
	private String mempw;
	private String memgender;
	private String memphoto;
	private String memhp;
	private String memzonecode;
	private String memjibunaddress;
	private String memjibunaddressdetail;
	private String mememail;
	private String memposition;
	private String mempreferredarea;
	private String memlv;
	private String ismanager;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	 // SNS 로그인 
	private String snstype; // 01:카카오, 02:네이버
	private String snsid;
	private String snsemail;
	
	public SfmMemVO() {
		
	}

	public SfmMemVO(String memnum, String memname, String memid, String mempw, String memgender, String memphoto,
			String memhp, String memzonecode, String memjibunaddress, String memjibunaddressdetail, String mememail,
			String memposition, String mempreferredarea, String memlv, String ismanager, String deleteyn,
			String insertdate, String updatedate, String snstype, String snsid, String snsemail) {
		
		this.memnum = memnum;
		this.memname = memname;
		this.memid = memid;
		this.mempw = mempw;
		this.memgender = memgender;
		this.memphoto = memphoto;
		this.memhp = memhp;
		this.memzonecode = memzonecode;
		this.memjibunaddress = memjibunaddress;
		this.memjibunaddressdetail = memjibunaddressdetail;
		this.mememail = mememail;
		this.memposition = memposition;
		this.mempreferredarea = mempreferredarea;
		this.memlv = memlv;
		this.ismanager = ismanager;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.snstype = snstype;
		this.snsid = snsid;
		this.snsemail = snsemail;
	}

	public String getMemnum() {
		return memnum;
	}

	public void setMemnum(String memnum) {
		this.memnum = memnum;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMempw() {
		return mempw;
	}

	public void setMempw(String mempw) {
		this.mempw = mempw;
	}

	public String getMemgender() {
		return memgender;
	}

	public void setMemgender(String memgender) {
		this.memgender = memgender;
	}

	public String getMemphoto() {
		return memphoto;
	}

	public void setMemphoto(String memphoto) {
		this.memphoto = memphoto;
	}

	public String getMemhp() {
		return memhp;
	}

	public void setMemhp(String memhp) {
		this.memhp = memhp;
	}

	public String getMemzonecode() {
		return memzonecode;
	}

	public void setMemzonecode(String memzonecode) {
		this.memzonecode = memzonecode;
	}

	public String getMemjibunaddress() {
		return memjibunaddress;
	}

	public void setMemjibunaddress(String memjibunaddress) {
		this.memjibunaddress = memjibunaddress;
	}

	public String getMemjibunaddressdetail() {
		return memjibunaddressdetail;
	}

	public void setMemjibunaddressdetail(String memjibunaddressdetail) {
		this.memjibunaddressdetail = memjibunaddressdetail;
	}

	public String getMememail() {
		return mememail;
	}

	public void setMememail(String mememail) {
		this.mememail = mememail;
	}

	public String getMemposition() {
		return memposition;
	}

	public void setMemposition(String memposition) {
		this.memposition = memposition;
	}

	public String getMempreferredarea() {
		return mempreferredarea;
	}

	public void setMempreferredarea(String mempreferredarea) {
		this.mempreferredarea = mempreferredarea;
	}

	public String getMemlv() {
		return memlv;
	}

	public void setMemlv(String memlv) {
		this.memlv = memlv;
	}

	public String getIsmanager() {
		return ismanager;
	}

	public void setIsmanager(String ismanager) {
		this.ismanager = ismanager;
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

	public String getSnstype() {
		return snstype;
	}

	public void setSnstype(String snstype) {
		this.snstype = snstype;
	}

	public String getSnsid() {
		return snsid;
	}

	public void setSnsid(String snsid) {
		this.snsid = snsid;
	}

	public String getSnsemail() {
		return snsemail;
	}

	public void setSnsemail(String snsemail) {
		this.snsemail = snsemail;
	}
	
	
	

}
