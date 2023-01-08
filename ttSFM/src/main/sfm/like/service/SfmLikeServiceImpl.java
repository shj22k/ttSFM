package main.sfm.like.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.like.dao.SfmLikeDAO;
import main.sfm.like.vo.SfmLikeVO;
@Service
@Transactional
public class SfmLikeServiceImpl implements SfmLikeService{
	Logger logger = LogManager.getLogger(SfmLikeServiceImpl.class);
	
	// 서비스에서 DAO 연결하기 
	// 필드 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)	
	private SfmLikeDAO sfmLikeDAO;
	
	@Override
	public List<SfmLikeVO> sfmLikeSelect(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("kosBoardLikeSelect 함수 진입 >>> : ");			
		return sfmLikeDAO.sfmLikeSelect(slvo);
	}
	
	@Override
	public List<SfmLikeVO> sfmLikeSelectAll(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("kosBoardLikeSelectAll 함수 진입 >>> : ");			
		return sfmLikeDAO.sfmLikeSelectAll(slvo);
	}
	

	@Override
	public int sfmLikeInsert(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("kosBoardLikeInsert 함수 진입 >>> : ");			
		return sfmLikeDAO.sfmLikeInsert(slvo);
	}

	@Override
	public int sfmLikeUpdate_1(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("kosBoardLikeUpdate_1 함수 진입 >>> : ");			
		return sfmLikeDAO.sfmLikeUpdate_1(slvo);
	}

	@Override
	public int sfmLikeUpdate_2(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("kosBoardLikeUpdate_2 함수 진입 >>> : ");			
		return sfmLikeDAO.sfmLikeUpdate_2(slvo);
	}

}
