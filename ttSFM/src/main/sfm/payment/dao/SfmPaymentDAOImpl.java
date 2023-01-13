package main.sfm.payment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.sfm.payment.service.SfmPaymentServiceImpl;
import main.sfm.payment.vo.SfmPaymentVO;

@Repository
public class SfmPaymentDAOImpl implements SfmPaymentDAO {
	Logger logger = LogManager.getLogger(SfmPaymentServiceImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int sfmPaymentInsert(SfmPaymentVO pvo) {
		logger.info("SfmPaymentDAOImpl sfmPaymentInsert 진입");
		return (Integer)sqlSession.insert("sfmPaymentInsert", pvo);
	}
	
	@Override
	public List<SfmPaymentVO> sfmPaymentSelect(SfmPaymentVO pvo) {
		logger.info("SfmPaymentDAOImpl sfmPaymentSelect 진입");
		return sqlSession.selectList("sfmPaymentSelect", pvo);
	}
	
	@Override
	public List<SfmPaymentVO> sfmPaymentComplete(SfmPaymentVO pvo) {
		logger.info("SfmPaymentDAOImpl sfmPaymentComplete 진입");
		return sqlSession.selectList("sfmPaymentComplete", pvo);
	}
	
}
