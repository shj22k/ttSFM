package main.sfm.event.vo;

public class SfmEventVO {

	private String eventnum;
	private String eventtitle;
	private String eventcontent;
	private String eventphoto;
	private String memnum;
	private String event;
	private String enddate;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	
	
	public SfmEventVO() {
		
	}



	public SfmEventVO(String eventnum, String eventtitle, String eventcontent, String eventphoto, String memnum,
			String deleteyn, String insertdate, String updatedate) {
		
		this.eventnum = eventnum;
		this.eventtitle = eventtitle;
		this.eventcontent = eventcontent;
		this.eventphoto = eventphoto;
		this.memnum = memnum;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}


	
	
	

	public SfmEventVO(String eventnum, String eventtitle, String eventcontent, String eventphoto, String memnum,
			String event, String deleteyn, String insertdate, String updatedate) {
		super();
		this.eventnum = eventnum;
		this.eventtitle = eventtitle;
		this.eventcontent = eventcontent;
		this.eventphoto = eventphoto;
		this.memnum = memnum;
		this.event = event;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	
	
	
	public SfmEventVO(String eventnum, String eventtitle, String eventcontent, String eventphoto, String memnum,
			String event, String enddate, String deleteyn, String insertdate, String updatedate) {
		super();
		this.eventnum = eventnum;
		this.eventtitle = eventtitle;
		this.eventcontent = eventcontent;
		this.eventphoto = eventphoto;
		this.memnum = memnum;
		this.event = event;
		this.enddate = enddate;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}



	public String getEventnum() {
		return eventnum;
	}



	public String getEventtitle() {
		return eventtitle;
	}



	public String getEventcontent() {
		return eventcontent;
	}



	public String getEventphoto() {
		return eventphoto;
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



	public void setEventnum(String eventnum) {
		this.eventnum = eventnum;
	}



	public void setEventtitle(String eventtitle) {
		this.eventtitle = eventtitle;
	}



	public void setEventcontent(String eventcontent) {
		this.eventcontent = eventcontent;
	}



	public void setEventphoto(String eventphoto) {
		this.eventphoto = eventphoto;
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



	public String getEvent() {
		return event;
	}



	public void setEvent(String event) {
		this.event = event;
	}



	public String getEnddate() {
		return enddate;
	}



	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	
	
	
}
