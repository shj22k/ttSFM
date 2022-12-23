package main.sfm.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import main.sfm.member.vo.SfmMemVO;

public class SfmMemDAOImpl implements SfmMemDAO{
	private Logger logger = LogManager.getLogger(SfmMemDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int sfmMemInsert(SfmMemVO smvo) {
		logger.info("sfmMemInsert 함수 진입 >>> : ");
		return (Integer)sqlSession.insert("sfmMemInsert",smvo);
	}

}
