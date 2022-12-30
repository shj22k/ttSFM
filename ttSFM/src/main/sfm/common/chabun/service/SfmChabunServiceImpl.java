package main.sfm.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.common.chabun.dao.SfmChabunDAO;
import main.sfm.community.vo.SfmCommunityVO;
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;
import main.sfm.notice.vo.SfmNoticeVO;

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
	
	@Override
	public SfmMatchVO getSFMmatchChabun() {
		return sfmChabunDAO.getSFMmatchChabun();
	}

	@Override
	public SfmCommunityVO getSFMcommunityChabun() {
		return sfmChabunDAO.getSFMcommunityChabun();
	}

	@Override
	public SfmNoticeVO getSFMnoticeChabun() {
		// TODO Auto-generated method stub
		logger.info("공지채번들어 간다~");
		return sfmChabunDAO.getSFMnoticeChabun();
	}
}
