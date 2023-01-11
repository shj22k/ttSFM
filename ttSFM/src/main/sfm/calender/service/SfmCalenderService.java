package main.sfm.calender.service;

import java.util.List;

import main.sfm.calender.vo.SfmCalenderVO;

public interface SfmCalenderService {

	public int sfmCalenderInsert(SfmCalenderVO cvo);
	public List<SfmCalenderVO> sfmCalenderSelectAll(SfmCalenderVO cvo);

}
