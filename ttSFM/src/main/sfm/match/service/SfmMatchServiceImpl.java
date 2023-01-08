package main.sfm.match.service;

import java.util.List;

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
	
	@Override
	public List<SfmMatchVO> sfmMatchSelectAll(SfmMatchVO mtvo) {
		logger.info("SfmMatchServiceImpl sfmMatchSelectAll 진입");
		return sfmMatchDAO.sfmMatchSelectAll(mtvo);
	}

	@Override
	public List<SfmMatchVO> sfmMatchSelectCon(SfmMatchVO mtvo) {
		logger.info("SfmMatchServiceImpl sfmMatchSelectCon 진입");
		return sfmMatchDAO.sfmMatchSelectCon(mtvo);
	}
	
	@Override
	public List<SfmMatchVO> sfmMatchSelectfilter(SfmMatchVO mtvo) {
		logger.info("SfmMatchServiceImpl sfmMatchSelectfilter 진입");
		return sfmMatchDAO.sfmMatchSelectfilter(mtvo);
	}
	
	@Override
	public List<SfmMatchVO> sfmMatchMap(SfmMatchVO mtvo) {
		logger.info("SfmMatchServiceImpl sfmMatchMap 진입");
		return sfmMatchDAO.sfmMatchMap(mtvo);
	}

	@Override
	public int sfmMatchUpdate(SfmMatchVO mtvo) {
		logger.info("SfmMatchServiceImpl sfmMatchUpdate 진입");
		return sfmMatchDAO.sfmMatchUpdate(mtvo);
	}

	@Override
	public int sfmMatchDelete(SfmMatchVO mtvo) {
		logger.info("SfmMatchServiceImpl sfmMatchUpdate 진입");
		return sfmMatchDAO.sfmMatchDelete(mtvo);
	}

}
