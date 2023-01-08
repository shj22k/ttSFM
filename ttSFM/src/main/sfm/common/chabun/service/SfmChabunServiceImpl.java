package main.sfm.common.chabun.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.common.chabun.dao.SfmChabunDAO;
import main.sfm.community.vo.SfmCommunityVO;
import main.sfm.event.vo.SfmEventVO;
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;
import main.sfm.notice.vo.SfmNoticeVO;
import main.sfm.payment.vo.SfmPaymentVO;
import main.sfm.rcommunity.vo.SfmRcommunityVO;

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
	public SfmRcommunityVO getSFMrcommunityChabun() {
		return sfmChabunDAO.getSFMrcommunityChabun();
	}

	@Override
	public SfmNoticeVO getSFMnoticeChabun() {
		// TODO Auto-generated method stub
		logger.info("공지채번들어 간다~");
		return sfmChabunDAO.getSFMnoticeChabun();
	}
	
	@Override
	public SfmEventVO getSFMeventChabun() {
		// TODO Auto-generated method stub
		logger.info("이뱐트채번들어 간다~");
		return sfmChabunDAO.getSFMeventChabun();
	}
	
	@Override
	public SfmPaymentVO getSFMpaymentChabun() {
		// TODO Auto-generated method stub
		logger.info("getSFMpaymentChabun 진입");
		return sfmChabunDAO.getSFMpaymentChabun();
	}

}
