package main.sfm.rcommunity.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import main.sfm.rcommunity.vo.SfmRcommunityVO;

@Repository
public class SfmRcommunityDAOImpl implements SfmRcommunityDAO {
	Logger logger = LogManager.getLogger(SfmRcommunityDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int sfmRcommunityInsert(SfmRcommunityVO rcvo) {
		logger.info("SfmRcommunityDAOImpl sfmRcommunityInsert진입");
		return (Integer)sqlSession.insert("sfmRcommunityInsert", rcvo);
	}
	
	@Override
	public List<SfmRcommunityVO> sfmRcommunitySelectAll(SfmRcommunityVO rcvo) {
		logger.info("SfmRcommunityDAOImpl sfmRcommunitySelectAll 진입");
		return sqlSession.selectList("sfmRcommunitySelectAll", rcvo);
	}

	@Override
	public int sfmRcommunityDelete(SfmRcommunityVO rcvo) {
		logger.info("SfmRcommunityDAOImpl sfmRcommunityDelete진입");
		return (Integer)sqlSession.delete("sfmRcommunityDelete", rcvo);
	}

}
