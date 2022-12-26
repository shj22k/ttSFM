package main.sfm.member.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.member.dao.SfmMemDAO;
import main.sfm.member.vo.SfmMemVO;

@Service
@Transactional
public class SfmMemServiceImpl implements SfmMemService{
	private Logger logger = LogManager.getLogger(SfmMemServiceImpl.class);
	
	@Autowired(required=false)
	private SfmMemDAO sfmMemDAO;
	
	@Override
	public int sfmMemInsert(SfmMemVO mvo){
		logger.info("sfmMemInsert() 함수 진입 >>> : ");
		return sfmMemDAO.sfmMemInsert(mvo);
	}
	
	@Override
	public List<SfmMemVO> sfmIdCheck(SfmMemVO mvo){
		logger.info("sfmIdCheck() 함수 진입 >>> : ");
		return sfmMemDAO.sfmIdCheck(mvo);
	}
	
}
