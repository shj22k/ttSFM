package main.sfm.calender.dao;

import java.util.List;

import main.sfm.calender.vo.SfmCalenderVO;

public interface SfmCalenderDAO {

	public int sfmCalenderInsert(SfmCalenderVO cvo);
	public List<SfmCalenderVO> sfmCalenderSelectAll(SfmCalenderVO cvo);

}
