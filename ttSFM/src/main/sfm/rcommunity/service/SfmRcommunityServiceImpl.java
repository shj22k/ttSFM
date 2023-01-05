package main.sfm.rcommunity.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.rcommunity.dao.SfmRcommunityDAO;
import main.sfm.rcommunity.vo.SfmRcommunityVO;

@Service
@Transactional
public class SfmRcommunityServiceImpl implements SfmRcommunityService {
	Logger logger = LogManager.getLogger(SfmRcommunityServiceImpl.class);
	
	@Autowired(required=false)
	private SfmRcommunityDAO sfmRcommunityDAO;
	
	@Override
	public int sfmRcommunityInsert(SfmRcommunityVO rcvo) {
		logger.info("SfmRcommunityServiceImpl sfmRcommunityInsert 진입");
		return sfmRcommunityDAO.sfmRcommunityInsert(rcvo);
	}
	
	@Override
	public List<SfmRcommunityVO> sfmRcommunitySelectAll(SfmRcommunityVO rcvo) {
		logger.info("SfmRcommunityServiceImpl sfmRcommunitySelectAll 진입");
		return sfmRcommunityDAO.sfmRcommunitySelectAll(rcvo);
	}

	@Override
	public int sfmRcommunityDelete(SfmRcommunityVO rcvo) {
		logger.info("SfmRcommunityServiceImpl sfmRcommunityDelete 진입");
		return sfmRcommunityDAO.sfmRcommunityDelete(rcvo);
	}

	
}
