package main.sfm.match.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.match.vo.SfmMatchVO;

@Repository
public class SfmMatchDAOImpl implements SfmMatchDAO {
	Logger logger = LogManager.getLogger(SfmMatchDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	@Override
	public int sfmMatchInsert(SfmMatchVO mtvo) {
		logger.info("SfmMatchDAOImpl sfmMatchInsert 진입");
		return (Integer)sqlSession.insert("sfmMatchInsert", mtvo);
	}
}
