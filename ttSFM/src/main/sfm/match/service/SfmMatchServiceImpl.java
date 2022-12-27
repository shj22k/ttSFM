package main.sfm.match.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.match.dao.SfmMatchDAO;
import main.sfm.match.vo.SfmMatchVO;

@Service
@Transactional
public class SfmMatchServiceImpl implements SfmMatchService {
	Logger logger = LogManager.getLogger(SfmMatchServiceImpl.class);
	
	@Autowired(required=false)
	private SfmMatchDAO sfmMatchDAO;
	
	@Override
	public int sfmMatchInsert(SfmMatchVO mtvo) {
		logger.info("SfmMatchServiceImpl sfmMatchInsert 진입");
		return sfmMatchDAO.sfmMatchInsert(mtvo);
	}
	
}
