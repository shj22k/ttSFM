package main.sfm.login.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.login.vo.SfmTempAuthVO;
import main.sfm.member.vo.SfmMemVO;

@Repository
public class SfmLoginDAOImpl implements SfmLoginDAO {
	Logger logger = LogManager.getLogger(SfmLoginDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<SfmMemVO> loginCheck(SfmMemVO mvo){
		logger.info("loginCheck 진입");
		return sqlSession.selectList("loginCheck", mvo);
	}
	
	@Override
	public List<SfmMemVO> emailCntCheck(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("emailCntCheck 함수 진입 >>> : ");
		return sqlSession.selectList("emailCntCheck", mvo);
	}

	@Override
	public int tempAuthInsert(SfmTempAuthVO stvo) {
		// TODO Auto-generated method stub
		logger.info("tempAuthInsert 함수 진입 >>> : ");
		return sqlSession.insert("tempAuthInsert", stvo);
	}

	@Override
	public List<SfmMemVO> idFind(SfmMemVO mvo) {
		// TODO Auto-generated method stub
		logger.info("idFind 함수 진입 >>> : ");
		return sqlSession.selectList("idFind", mvo);
	}

	@Override
	public List<SfmMemVO> idFindAuthnum(SfmTempAuthVO stvo) {
		// TODO Auto-generated method stub
		logger.info("idFindAuthnum 함수 진입 >>> : ");
		return sqlSession.selectList("idFindAuthnum", stvo);
	}

}
