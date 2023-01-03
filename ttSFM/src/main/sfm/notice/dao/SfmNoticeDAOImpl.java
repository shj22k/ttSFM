package main.sfm.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.notice.vo.SfmNoticeVO;

@Repository
public class SfmNoticeDAOImpl implements SfmNoticeDAO{
	Logger logger = LogManager.getLogger(SfmNoticeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	@Override
	public int sfmNoticeInsert(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("sfmNoticeInsert 함수진입 >> ");
		
		return (Integer)sqlSession.insert("sfmNoticeInsert", snvo);
	}
	
	//전체조회
	@Override
	public List<SfmNoticeVO> sfmNoticeSelectAll(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("DAO-sfmNoticeSelectAll 함수진입 >> ");
		return sqlSession.selectList("sfmNoticeSelectAll", snvo);
	}
	
	//조건조회
	@Override
	public List<SfmNoticeVO> sfmNoticeSelectCon(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("DAO-sfmNoticeSelectCon 함수진입 >> ");
		return sqlSession.selectList("sfmNoticeSelectCon", snvo);
	}
	
	//삭제 버튼
	@Override
	public int sfmNoticeDelete(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("DAO-sfmNoticeDelete 함수진입 >> ");
		return (Integer)sqlSession.delete("sfmNoticeDelete", snvo);
	}
	
	//수정완료 버튼
	@Override
	public int sfmNoticeUpdate(SfmNoticeVO snvo) {
		// TODO Auto-generated method stub
		logger.info("DAO-sfmNoticeUpdate 함수진입 >> ");
		return (Integer)sqlSession.update("sfmNoticeUpdate", snvo);
	}

}
