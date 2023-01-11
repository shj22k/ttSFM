package main.sfm.calender.vo;

public class SfmCalenderVO {

	private String calno;				
	private String caltitle;			
	private String calstartdate;		
	private String calenddate;			
	private String caldescription;		
	private String caltype;			
	private String calbackgroundColor;		
	private String calallDay;		
	private String memid;
	private String deleteyn;		
	private String insertdate;		
	private String updatedate;			
	
	public SfmCalenderVO() {
		
	}

	public SfmCalenderVO(String calno, String caltitle, String calstartdate, String calenddate, String caldescription,
			String caltype, String calbackgroundColor, String calallDay, String memid,
			String deleteyn, String insertdate, String updatedate) {
		
		this.calno = calno;
		this.caltitle = caltitle;
		this.calstartdate = calstartdate;
		this.calenddate = calenddate;
		this.caldescription = caldescription;
		this.caltype = caltype;
		this.calbackgroundColor = calbackgroundColor;
		this.calallDay = calallDay;
		this.memid = memid;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	public String getCalno() {
		return calno;
	}

	public void setCalno(String calno) {
		this.calno = calno;
	}

	public String getCaltitle() {
		return caltitle;
	}

	public void setCaltitle(String caltitle) {
		this.caltitle = caltitle;
	}

	public String getCalstartdate() {
		return calstartdate;
	}

	public void setCalstartdate(String calstartdate) {
		this.calstartdate = calstartdate;
	}

	public String getCalenddate() {
		return calenddate;
	}

	public void setCalenddate(String calenddate) {
		this.calenddate = calenddate;
	}

	public String getCaldescription() {
		return caldescription;
	}

	public void setCaldescription(String caldescription) {
		this.caldescription = caldescription;
	}

	public String getCaltype() {
		return caltype;
	}

	public void setCaltype(String caltype) {
		this.caltype = caltype;
	}

	public String getCalbackgroundColor() {
		return calbackgroundColor;
	}

	public void setCalbackgroundColor(String calbackgroundColor) {
		this.calbackgroundColor = calbackgroundColor;
	}

	public String getCalallDay() {
		return calallDay;
	}

	public void setCalallDay(String calallDay) {
		this.calallDay = calallDay;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
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
