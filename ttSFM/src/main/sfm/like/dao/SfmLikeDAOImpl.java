package main.sfm.like.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.like.vo.SfmLikeVO;
@Repository
public class SfmLikeDAOImpl implements SfmLikeDAO{
	Logger logger = LogManager.getLogger(SfmLikeDAOImpl.class);

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<SfmLikeVO> sfmLikeSelect(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("sfmLikeSelect 함수 진입 >>> : ");			
		return sqlSession.selectList("sfmLikeSelect", slvo);
	}
	
	@Override
	public List<SfmLikeVO> sfmLikeSelectAll(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("sfmLikeSelectAll 함수 진입 >>> : ");			
		return sqlSession.selectList("sfmLikeSelectAll", slvo);
	}

	@Override
	public int sfmLikeInsert(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("sfmLikeInsert 함수 진입 >>> : ");			
		return (Integer)sqlSession.insert("sfmLikeInsert", slvo);
	}

	@Override
	public int sfmLikeUpdate_1(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("sfmLikeUpdate_1 함수 진입 >>> : ");			
		return (Integer)sqlSession.update("sfmLikeUpdate_1", slvo);
	}

	@Override
	public int sfmLikeUpdate_2(SfmLikeVO slvo) {
		// TODO Auto-generated method stub
		logger.info("sfmLikeUpdate_2 함수 진입 >>> : ");			
		return (Integer)sqlSession.update("sfmLikeUpdate_2", slvo);
	}

}
