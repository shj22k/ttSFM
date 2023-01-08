package main.sfm.event.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.sfm.event.dao.SfmEventDAO;
import main.sfm.event.vo.SfmEventVO;


@Service
@Transactional
public class SfmEventServiceImpl implements SfmEventService{

	Logger logger = LogManager.getLogger(SfmEventServiceImpl.class);

	@Autowired(required=false)
	 private SfmEventDAO sfmEventDAO;
	
	//이벤트입력
	@Override
	public int sfmEventInsert(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventInsert(sevo);
	}
	//전체조회
	@Override
	public List<SfmEventVO> sfmEventSelectAll(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventSelectAll(sevo);
	}
	//수정버튼
	@Override
	public List<SfmEventVO> sfmEventUpdate(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventUpdate(sevo);
	}
	// 수정완료 번튼
	@Override
	public int sfmEventUpdate2(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventUpdate2(sevo);
	}
	//조건
	@Override
	public List<SfmEventVO> sfmEventSelectCon(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventSelectCon(sevo);
	}
	//전체조회 사용ㅇ자
	@Override
	public List<SfmEventVO> sfmEventSelectAllUser(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventSelectAllUser(sevo);
	}
	//조건조회 -사요자
	@Override
	public List<SfmEventVO> sfmEventSelectUser(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventSelectUser(sevo);
	}
	//삭제
	@Override
	public int sfmEventDelete(SfmEventVO sevo) {
		// TODO Auto-generated method stub
		return sfmEventDAO.sfmEventDelete(sevo);
	}

}
