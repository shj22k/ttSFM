package main.sfm.member.dao;

import java.util.List;

import main.sfm.member.vo.SfmMemVO;

public interface SfmMemDAO {
	
	public int sfmMemInsert(SfmMemVO mvo);
	public List<SfmMemVO> sfmMemSelectAll(SfmMemVO mvo);
	public List<SfmMemVO> sfmMemSelect(SfmMemVO mvo);
	public int sfmMemUpdate(SfmMemVO mvo);
	public int sfmMemDelete(SfmMemVO mvo);

	// 아이디 중복체크
	public List<SfmMemVO> sfmIdCheck(SfmMemVO mvo);

}
