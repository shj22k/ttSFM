package main.sfm.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.member.vo.SfmMemVO;

@Repository
public class SfmMemDAOImpl implements SfmMemDAO{
	private Logger logger = LogManager.getLogger(SfmMemDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int sfmMemInsert(SfmMemVO mvo) {
		logger.info("sfmMemInsert 함수 진입 >>> : ");
		return (Integer)sqlSession.insert("sfmMemInsert", mvo);
	}
	
	@Override
	public List<SfmMemVO> sfmMemSelectAll(SfmMemVO mvo) {
		logger.info("sfmMemSelectAll 함수 진입 >>> : ");
		return sqlSession.selectList("sfmMemSelectAll", mvo);
	}

	@Override
	public List<SfmMemVO> sfmMemSelect(SfmMemVO mvo) {
		logger.info("sfmMemSelect 함수 진입 >>> : ");
		return sqlSession.selectList("sfmMemSelect", mvo);
	}

	@Override
	public int sfmMemUpdate(SfmMemVO mvo) {
		logger.info("sfmMemUpdate 함수 진입 >>> : ");
		return (Integer)sqlSession.update("sfmMemUpdate", mvo);
	}

	@Override
	public int sfmMemDelete(SfmMemVO mvo) {
		logger.info("sfmMemDelete 함수 진입 >>> : ");
		return (Integer)sqlSession.delete("sfmMemDelete", mvo);
	}

	@Override
	public List<SfmMemVO> sfmIdCheck(SfmMemVO mvo){
		logger.info("sfmIdCheck 함수 진입 >>> : ");
		return sqlSession.selectList("sfmIdCheck", mvo);
	}

}
