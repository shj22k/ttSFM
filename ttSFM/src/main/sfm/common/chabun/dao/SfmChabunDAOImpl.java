package main.sfm.common.chabun.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.community.vo.SfmCommunityVO;
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;
import main.sfm.notice.vo.SfmNoticeVO;

@Repository
public class SfmChabunDAOImpl implements SfmChabunDAO {
	Logger logger = LogManager.getLogger(SfmChabunDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public SfmMemVO getSFMmemChabun() {
		return sqlSession.selectOne("getSFMmemChabun");
	}
	
	@Override
	public SfmMatchVO getSFMmatchChabun() {
		return sqlSession.selectOne("getSFMmatchChabun");
	}
	
	@Override
	public SfmCommunityVO getSFMcommunityChabun() {
		return sqlSession.selectOne("getSFMcommunityChabun");
	}

	@Override
	public SfmNoticeVO getSFMnoticeChabun() {
		// TODO Auto-generated method stub
		logger.info("다오채번~~~");
		return sqlSession.selectOne("getSFMnoticeChabun");
	}
}
