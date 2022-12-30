package main.sfm.notice.dao;

import java.util.List;

import main.sfm.notice.vo.SfmNoticeVO;

public interface SfmNoticeDAO {
	public int sfmNoticeInsert(SfmNoticeVO snvo);
	public List<SfmNoticeVO> sfmNoticeSelectAll(SfmNoticeVO snvo);//전체조회
	public List<SfmNoticeVO> sfmNoticeUpdate(SfmNoticeVO snvo);// 수정 버튼
	public int sfmNoticeUpdate2(SfmNoticeVO snvo); //수정 완료 버튼
	public int sfmNoticeDelete(SfmNoticeVO snvo); //입력
}
