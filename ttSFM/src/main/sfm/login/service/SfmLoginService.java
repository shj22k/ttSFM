package main.sfm.login.service;

import java.util.List;

import main.sfm.member.vo.SfmMemVO;

public interface SfmLoginService {

	public List<SfmMemVO> loginCheck(SfmMemVO mvo);
}
