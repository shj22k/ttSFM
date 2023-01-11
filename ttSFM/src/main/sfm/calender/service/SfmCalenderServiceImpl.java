package main.sfm.calender.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.calender.dao.SfmCalenderDAO;
import main.sfm.calender.vo.SfmCalenderVO;

@Service
@Transactional
public class SfmCalenderServiceImpl implements SfmCalenderService {
	Logger logger = LogManager.getLogger(SfmCalenderServiceImpl.class);
	
	@Autowired(required = false)
	private SfmCalenderDAO sfmCalenderDAO;
	
	@Override
	public int sfmCalenderInsert(SfmCalenderVO cvo) {
		// TODO Auto-generated method stub
		logger.info("SfmCalenderServiceImpl sfmCalenderInsert 진입 성공 >>> : ");
		return sfmCalenderDAO.sfmCalenderInsert(cvo);
	}

	@Override
	public List<SfmCalenderVO> sfmCalenderSelectAll(SfmCalenderVO cvo) {
		// TODO Auto-generated method stub
		logger.info("SfmCalenderServiceImpl sfmCalenderSelectAll 진입 성공 >>> : ");
		
		return sfmCalenderDAO.sfmCalenderSelectAll(cvo);
	}


}
