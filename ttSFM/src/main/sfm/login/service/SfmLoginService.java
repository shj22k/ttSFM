package main.sfm.login.service;

import java.util.List;

import main.sfm.login.vo.SfmTempAuthVO;
import main.sfm.login.vo.SfmTempPwVO;
import main.sfm.member.vo.SfmMemVO;

public interface SfmLoginService {

	public List<SfmMemVO> loginCheck(SfmMemVO mvo);

	// 인증번호 이메일 확인
	public List<SfmMemVO> emailCntCheck(SfmMemVO mvo);
	// 인증번호 입력
	public int tempAuthInsert(SfmTempAuthVO stvo);
	// 아이디 받기
	public List<SfmMemVO> idFind(SfmMemVO mvo);
	// 아이디 받기전 인증번호 확인
	public List<SfmMemVO> idFindAuthnum(SfmTempAuthVO stvo);

	// 임시비밀번호 이메일 확인
	public List<SfmMemVO> emailCntCheckPW(SfmMemVO mvo);
	// 임시비밀번호 입력	
	public int tempPwInsert(SfmTempPwVO stpvo);
	// 새 비밀번호 변경전 임시 비밀번호 확인   
	public List<SfmTempPwVO> pwUpdateCheck(SfmTempPwVO stpvo);
	// kakao 로그인 
	public List<SfmMemVO> kakaoLogin(SfmMemVO mvo);
	public int kakaoInsert(SfmMemVO mvo);
	// 메인페이지 이동
	public List<SfmMemVO> maingo(SfmMemVO mvo);

}
