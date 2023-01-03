package main.sfm.login.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.login.dao.SfmLoginDAO;
import main.sfm.login.vo.SfmTempAuthVO;
import main.sfm.login.vo.SfmTempPwVO;
import main.sfm.member.vo.SfmMemVO;

@Service
@Transactional
public class SfmLoginServiceImpl implements SfmLoginService {
	Logger logger = LogManager.getLogger(SfmLoginServiceImpl.class);
	
	@Autowired(required=false)
	private SfmLoginDAO sfmLoginDAO;
	
	@Override
	public List<SfmMemVO> loginCheck(SfmMemVO mvo){
		logger.info("loginCheck 진입");
		return sfmLoginDAO.loginCheck(mvo);
	}
	
	@Override
	public List<SfmMemVO> emailCntCheck(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("sfmLoginCheck 함수 진입 >>> : ");
		return sfmLoginDAO.emailCntCheck(mvo);
	}
	
	@Override
	public int tempAuthInsert(SfmTempAuthVO stvo) {
		// TODO Auto-generated method stub
		logger.info("tempAuthInsert 함수 진입 >>> : ");
		return sfmLoginDAO.tempAuthInsert(stvo);
	}

	@Override
	public List<SfmMemVO> idFind(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("idFind 함수 진입 >>> : ");
		return sfmLoginDAO.idFind(mvo);
	}

	@Override
	public List<SfmMemVO> idFindAuthnum(SfmTempAuthVO stvo) {
		// TODO Auto-generated method stub
		logger.info("idFindAuthnum 함수 진입 >>> : ");
		return sfmLoginDAO.idFindAuthnum(stvo);
	}
	
	@Override
	public List<SfmMemVO> emailCntCheckPW(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("emailCntCheckPW 함수 진입 >>> : ");
		return sfmLoginDAO.emailCntCheckPW(mvo);
	}

	@Override
	public int tempPwInsert(SfmTempPwVO stpvo) {
		// TODO Auto-generated method stub
		logger.info("tempPwInsert 함수 진입 >>> : ");
		return sfmLoginDAO.tempPwInsert(stpvo);
	}

	@Override
	public List<SfmTempPwVO> pwUpdateCheck(SfmTempPwVO stpvo) {
		// TODO Auto-generated method stub
		logger.info("pwUpdateCheck 함수 진입 >>> : ");
		return sfmLoginDAO.pwUpdateCheck(stpvo);
	}
}
