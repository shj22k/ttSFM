package main.sfm.calender.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.calender.vo.SfmCalenderVO;

@Repository
public class SfmCalenderDAOImpl implements SfmCalenderDAO {
	Logger logger = LogManager.getLogger(SfmCalenderDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int sfmCalenderInsert(SfmCalenderVO cvo) {
		// TODO Auto-generated method stub
		logger.info("sfmCalenderInsert 진입 성공 >>> :");
		return sqlSession.insert("sfmCalenderInsert");
	}

	@Override
	public List<SfmCalenderVO> sfmCalenderSelectAll(SfmCalenderVO cvo) {
		// TODO Auto-generated method stub
		logger.info("calendarSelectAll 진입 성공 >>> :");
		return sqlSession.selectList("sfmCalenderSelectAll");
	}

}
