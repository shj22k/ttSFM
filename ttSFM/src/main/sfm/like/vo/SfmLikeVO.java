package main.sfm.like.vo;

public class SfmLikeVO {
	
	private String blnum;
	private String memnum;
	private String cnum;
	private String like_cnt_1;
	private String like_cnt_2;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	public SfmLikeVO() {
		
	}

	public SfmLikeVO(String blnum, String memnum, String cnum, String like_cnt_1, String like_cnt_2, String deleteyn,
			String insertdate, String updatedate) {
	
		this.blnum = blnum;
		this.memnum = memnum;
		this.cnum = cnum;
		this.like_cnt_1 = like_cnt_1;
		this.like_cnt_2 = like_cnt_2;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	public String getBlnum() {
		return blnum;
	}

	public void setBlnum(String blnum) {
		this.blnum = blnum;
	}

	public String getMemnum() {
		return memnum;
	}

	public void setMemnum(String memnum) {
		this.memnum = memnum;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getLike_cnt_1() {
		return like_cnt_1;
	}

	public void setLike_cnt_1(String like_cnt_1) {
		this.like_cnt_1 = like_cnt_1;
	}

	public String getLike_cnt_2() {
		return like_cnt_2;
	}

	public void setLike_cnt_2(String like_cnt_2) {
		this.like_cnt_2 = like_cnt_2;
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
