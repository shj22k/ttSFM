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
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;

	
	public SfmCommunityVO() {
		
	}

	public SfmCommunityVO(String cnum, String csubject, String cname, String ccontent, String cfile, String memnum,
			String deleteyn, String insertdate, String updatedate, String keyword, String searchFilter,
			String startDate, String endDate, String pageSize, String groupSize, String curPage, String totalCount) {
		super();
		this.cnum = cnum;
		this.csubject = csubject;
		this.cname = cname;
		this.ccontent = ccontent;
		this.cfile = cfile;
		this.memnum = memnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
		this.startDate = startDate;
		this.endDate = endDate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
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


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getSearchFilter() {
		return searchFilter;
	}


	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getPageSize() {
		return pageSize;
	}


	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}


	public String getGroupSize() {
		return groupSize;
	}


	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}


	public String getCurPage() {
		return curPage;
	}


	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}


	public String getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
