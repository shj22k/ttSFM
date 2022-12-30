package main.sfm.notice.vo;

public class SfmNoticeVO {
	
	private String noticenum;//공지번호 - 채번
	private String noticetitle;//제목
	private String noticecontent;//내용
	private String memnum;//회원번호
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	
	public SfmNoticeVO() {
		
	}


	public SfmNoticeVO(String noticenum, String noticetitle, String noticecontent, String memnum, String deleteyn,
			String insertdate, String updatedate) {
		
		this.noticenum = noticenum;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.memnum = memnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}


	public String getNoticenum() {
		return noticenum;
	}


	public String getNoticetitle() {
		return noticetitle;
	}


	public String getNoticecontent() {
		return noticecontent;
	}


	public String getMemnum() {
		return memnum;
	}


	public String getDeleteyn() {
		return deleteyn;
	}


	public String getInsertdate() {
		return insertdate;
	}


	public String getUpdatedate() {
		return updatedate;
	}


	public void setNoticenum(String noticenum) {
		this.noticenum = noticenum;
	}


	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}


	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}


	public void setMemnum(String memnum) {
		this.memnum = memnum;
	}


	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}


	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}


	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

}
