package main.sfm.payment.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.payment.dao.SfmPaymentDAO;
import main.sfm.payment.vo.SfmPaymentVO;

@Service
@Transactional
public class SfmPaymentServiceImpl implements SfmPaymentService {
	Logger logger = LogManager.getLogger(SfmPaymentServiceImpl.class);
	
	@Autowired(required=false)
	private SfmPaymentDAO sfmPaymentDAO;
	
	@Override
	public int sfmPaymentInsert(SfmPaymentVO pvo) {
		logger.info("SfmPaymentServiceImpl sfmPaymentInsert 진입");
		return sfmPaymentDAO.sfmPaymentInsert(pvo);
	}
	
}
