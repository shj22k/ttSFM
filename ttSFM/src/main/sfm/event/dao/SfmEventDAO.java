package main.sfm.event.dao;

import java.util.List;

import main.sfm.event.vo.SfmEventVO;

public interface SfmEventDAO {

	public int sfmEventInsert(SfmEventVO sevo); //입력
	public List<SfmEventVO> sfmEventSelectAll(SfmEventVO sevo);//전체조회
	public List<SfmEventVO> sfmEventSelectAllUser(SfmEventVO sevo);//전체조회-사용자
	public List<SfmEventVO> sfmEventUpdate(SfmEventVO sevo);// 수정버튼
	public int sfmEventUpdate2(SfmEventVO sevo);//수정 완료 번튼
	public List<SfmEventVO> sfmEventSelectCon(SfmEventVO sevo);//조건조회
	public List<SfmEventVO> sfmEventSelectUser(SfmEventVO sevo);//조건조회-사용자
	public int sfmEventDelete(SfmEventVO sevo); //삭제
}
