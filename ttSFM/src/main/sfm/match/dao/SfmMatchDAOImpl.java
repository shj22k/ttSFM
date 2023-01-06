package main.sfm.match.dao;

import java.util.List;

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
	
	@Override
	public List<SfmMatchVO> sfmMatchSelectAll(SfmMatchVO mtvo) {
		logger.info("SfmMatchDAOImpl sfmMatchSelectAll 진입");
		return sqlSession.selectList("sfmMatchSelectAll", mtvo);
	}

	@Override
	public List<SfmMatchVO> sfmMatchSelectCon(SfmMatchVO mtvo) {
		logger.info("SfmMatchDAOImpl sfmMatchSelectCon 진입");
		return sqlSession.selectList("sfmMatchSelectCon", mtvo);
	}
	
	@Override
	public List<SfmMatchVO> sfmMatchSelectfilter(SfmMatchVO mtvo) {
		logger.info("SfmMatchDAOImpl sfmMatchSelectfilter 진입");
		return sqlSession.selectList("sfmMatchSelectfilter", mtvo);
	}

	@Override
	public int sfmMatchUpdate(SfmMatchVO mtvo) {
		logger.info("SfmMatchDAOImpl sfmMatchUpdate 진입");
		return (Integer)sqlSession.update("sfmMatchUpdate", mtvo);
	}

	@Override
	public int sfmMatchDelete(SfmMatchVO mtvo) {
		logger.info("SfmMatchDAOImpl sfmMatchDelete 진입");
		return (Integer)sqlSession.delete("sfmMatchDelete", mtvo);
	}

}
