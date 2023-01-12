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
	public List<SfmMemVO> sfmMemSelectAll(SfmMemVO mvo){
		logger.info("sfmMemSelectAll() 함수 진입 >>> : ");
		return sfmMemDAO.sfmMemSelectAll(mvo);
	}

	@Override
	public List<SfmMemVO> sfmMemSelect(SfmMemVO mvo){
		logger.info("sfmMemSelect() 함수 진입 >>> : ");
		return sfmMemDAO.sfmMemSelectAll(mvo);
	}
	
	@Override 
	public int sfmMemUpdate(SfmMemVO mvo) {
		logger.info("sfmMemUpdate() 함수 진입 >>> : ");
		return sfmMemDAO.sfmMemUpdate(mvo);
	}
	
	@Override 
	public int sfmMemDelete(SfmMemVO mvo) {
		logger.info("sfmMemDelete() 함수 진입 >>> : ");
		return sfmMemDAO.sfmMemDelete(mvo);
	}

	@Override
	public List<SfmMemVO> sfmIdCheck(SfmMemVO mvo){
		logger.info("sfmIdCheck() 함수 진입 >>> : ");
		return sfmMemDAO.sfmIdCheck(mvo);
	}
	
    @Override
    public int pwUpdate(SfmMemVO mvo) {
       // TODO Auto-generated method stub
       logger.info("pwUpdate 함수 진입 >>> : ");
       return sfmMemDAO.pwUpdate(mvo);
    }

	@Override
	public int sfmMemUpdate2(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		return sfmMemDAO.sfmMemUpdate2(mvo);
	}

	@Override
	public List<SfmMemVO> sfmMemUpdateForm(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		return sfmMemDAO.sfmMemUpdateForm(mvo);
	}

	@Override
	public List<SfmMemVO> sfmMemUpdateFormUser(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		return sfmMemDAO.sfmMemUpdateFormUser(mvo);
	}

	@Override
	public List<SfmMemVO> myPage(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		return sfmMemDAO.myPage(mvo);
	}
	
}
