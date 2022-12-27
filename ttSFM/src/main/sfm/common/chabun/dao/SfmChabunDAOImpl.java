package main.sfm.common.chabun.dao;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;

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
	
}
