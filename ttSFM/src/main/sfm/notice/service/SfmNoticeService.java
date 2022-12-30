package main.sfm.notice.service;

import java.util.List;

import main.sfm.notice.vo.SfmNoticeVO;

public interface SfmNoticeService {
	public int sfmNoticeInsert(SfmNoticeVO snvo); //입력
	public List<SfmNoticeVO> sfmNoticeSelectAll(SfmNoticeVO snvo);//전체조회
	public List<SfmNoticeVO> sfmNoticeUpdate(SfmNoticeVO snvo);// 수정 버튼
	public int sfmNoticeUpdate2(SfmNoticeVO snvo); //수정 완료 버튼
	public int sfmNoticeDelete(SfmNoticeVO snvo); //삭제
	
}
