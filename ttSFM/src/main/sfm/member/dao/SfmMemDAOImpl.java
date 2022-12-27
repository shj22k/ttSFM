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
	public List<SfmMemVO> sfmIdCheck(SfmMemVO mvo){
		logger.info("sfmIdCheck 함수 진입 >>> : ");
		return sqlSession.selectList("sfmIdCheck", mvo);
	}

}
