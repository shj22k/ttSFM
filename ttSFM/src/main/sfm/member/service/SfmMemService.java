package main.sfm.member.service;

import java.util.List;

import main.sfm.member.vo.SfmMemVO;

public interface SfmMemService {
	
	public int sfmMemInsert(SfmMemVO mvo);
	public List<SfmMemVO> sfmMemSelectAll(SfmMemVO mvo);
	public List<SfmMemVO> myPage(SfmMemVO mvo);
	public List<SfmMemVO> myPage2(SfmMemVO mvo);
	public List<SfmMemVO> sfmMemSelect(SfmMemVO mvo);
	public List<SfmMemVO> sfmMemUpdateForm(SfmMemVO mvo);
	public List<SfmMemVO> sfmMemUpdateFormUser(SfmMemVO mvo);
	public int sfmMemUpdate(SfmMemVO mvo); // - 관리자 기존 업뎃2
	public int sfmMemUpdate2(SfmMemVO mvo);// -사용자 기존 업뎃 2
	public int sfmMemDelete(SfmMemVO mvo);
	
	
	// 아이디 중복체크
	public List<SfmMemVO> sfmIdCheck(SfmMemVO mvo);
	public int pwUpdate(SfmMemVO mvo);
	
}
