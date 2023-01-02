package main.sfm.community.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.community.dao.SfmCommunityDAO;
import main.sfm.community.vo.SfmCommunityVO;

@Service
@Transactional
public class SfmCommunityServiceImpl implements SfmCommunityService {
	Logger logger = LogManager.getLogger(SfmCommunityServiceImpl.class);
	
	@Autowired(required=false)
	private SfmCommunityDAO sfmCommunityDAO;
	
	@Override
	public int sfmCommunityInsert(SfmCommunityVO cvo) {
		logger.info("SfmCommunityServiceImpl sfmCommunityInsert 진입");
		return sfmCommunityDAO.sfmCommunityInsert(cvo);
	}
	
	@Override
	public List<SfmCommunityVO> sfmCommunitySelectAll(SfmCommunityVO cvo) {
		logger.info("SfmCommunityServiceImpl sfmCommunitySelectAll 진입");
		return sfmCommunityDAO.sfmCommunitySelectAll(cvo);
	}

}
