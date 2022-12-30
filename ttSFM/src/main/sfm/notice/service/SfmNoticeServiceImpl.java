package main.sfm.notice.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.notice.dao.SfmNoticeDAO;
import main.sfm.notice.vo.SfmNoticeVO;

@Service
@Transactional
public class SfmNoticeServiceImpl implements SfmNoticeService{
	
	Logger logger = LogManager.getLogger(SfmNoticeServiceImpl.class);

	@Autowired(required=false)
	 private SfmNoticeDAO sfmNoticeDAO;
	
	//입력
	@Override
	public int sfmNoticeInsert(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("sfmNoticeInsert() 함수 진입 >>> : ");
		return sfmNoticeDAO.sfmNoticeInsert(snvo);
	}

	//전체조회
	@Override
	public List<SfmNoticeVO> sfmNoticeSelectAll(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		
		logger.info("sfmNoticeSelectAll() 함수 진입 >>> : ");
		return sfmNoticeDAO.sfmNoticeSelectAll(snvo);
	}
	//수정버튼
	@Override
	public List<SfmNoticeVO> sfmNoticeUpdate(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("sfmNoticeUpdate() 함수 진입 >>> : ");
		return sfmNoticeDAO.sfmNoticeUpdate(snvo);
	}
	//삭제버튼
	@Override
	public int sfmNoticeDelete(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("sfmNoticeDelete() 함수 진입 >>> : ");
		return sfmNoticeDAO.sfmNoticeDelete(snvo);
	}
	//수정완료 버튼
	@Override
	public int sfmNoticeUpdate2(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("sfmNoticeUpdate2() 함수 진입 >>> : ");
		return sfmNoticeDAO.sfmNoticeUpdate2(snvo);
	}

}
