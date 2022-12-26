package main.sfm.login.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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

}
