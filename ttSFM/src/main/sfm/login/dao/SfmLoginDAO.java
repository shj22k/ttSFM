package main.sfm.login.dao;

import java.util.List;

import main.sfm.member.vo.SfmMemVO;

public interface SfmLoginDAO {

	public List<SfmMemVO> loginCheck(SfmMemVO mvo);

}
