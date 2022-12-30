package main.sfm.community.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.community.vo.SfmCommunityVO;

@Repository
public class SfmCommunityDAOImpl implements SfmCommunityDAO {
	Logger logger = LogManager.getLogger(SfmCommunityDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	@Override
	public int sfmCommunityInsert(SfmCommunityVO cvo) {
		logger.info("SfmCommunityDAOImpl sfmCommunityInsert 진입");
		return (Integer)sqlSession.insert("sfmCommunityInsert", cvo);
	}

}
