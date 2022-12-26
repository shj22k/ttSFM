package main.sfm.login.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.login.dao.SfmLoginDAO;
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
	
}
