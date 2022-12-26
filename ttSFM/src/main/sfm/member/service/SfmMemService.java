package main.sfm.member.service;

import java.util.List;

import main.sfm.member.vo.SfmMemVO;

public interface SfmMemService {
	
	public int sfmMemInsert(SfmMemVO mvo);

	// 아이디 중복체크
	public List<SfmMemVO> sfmIdCheck(SfmMemVO mvo);

}
