package main.sfm.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.common.chabun.dao.SfmChabunDAO;
import main.sfm.member.vo.SfmMemVO;

@Service
@Transactional
public class SfmChabunServiceImpl implements SfmChabunService {
	Logger logger = LogManager.getLogger(SfmChabunServiceImpl.class);
	
	@Autowired(required=false)
	private SfmChabunDAO sfmChabunDAO; 
	
	@Override
	public SfmMemVO getSFMmemChabun() {
		return sfmChabunDAO.getSFMmemChabun();
	}
	
	
}
