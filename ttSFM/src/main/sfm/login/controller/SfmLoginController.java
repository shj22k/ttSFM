package main.sfm.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.sfm.common.GoogleAuthumMail;
import main.sfm.common.K_Session;
import main.sfm.common.PasswordUtil;
import main.sfm.login.service.SfmLoginService;
import main.sfm.login.vo.SfmTempAuthVO;
import main.sfm.login.vo.SfmTempPwVO;
import main.sfm.member.service.SfmMemService;
import main.sfm.member.vo.SfmMemVO;

@Controller
public class SfmLoginController {
	Logger logger = LogManager.getLogger(SfmLoginController.class);

	@Autowired(required=false)	// 의존성 주입
	private SfmLoginService sfmLoginService;
	@Autowired(required=false)	// 의존성 주입
	private SfmMemService sfmMemService;

	// 로그인 폼 이동
	@GetMapping("sfmLoginForm")
	public String sfmLoginForm() {
		logger.info("sfmLoginForm 진입");
		return "login/sfmLoginForm";
	}
	
	// 로그인
	@PostMapping("sfmLogin")
	public String sfmLogin(HttpServletRequest req, SfmMemVO mvo, Model model) {
		logger.info("sfmLogin 진입");
		
		
		List<SfmMemVO> listLogin = sfmLoginService.loginCheck(mvo);
		logger.info("login listLogin.size() >>> : " + listLogin.size());
		String mpw = listLogin.get(0).getMempw();
		logger.info("req.getParamet >>> : " + req.getParameter("mempw"));
		logger.info("mpw : " + mpw);

		if(listLogin.size() == 1) {
			K_Session ks = K_Session.getInstance();
			String mID = ks.getSession(req);

			if(mID !=null && mID.equals(listLogin.get(0).getMemid())) {
				logger.info("SfmLoginController login >>> : 로그인 중 >>> : 다른 페이지로 이동 하기 >>> : " + mID);
				ks.setSession(req, mvo.getMemnum());

				// 관리자 로그인
				if(mID.equals("admin1234") && req.getParameter("mempw").equals("admin1234") ) {
					model.addAttribute("listLogin", listLogin);
					return "admin/sfmAdminPage";
				}
				
				model.addAttribute("listLogin", listLogin);
				return "main/mainPage";
			}else {
				ks.setSession(req, mvo.getMemid());
				logger.info("SfmLoginController login >>> : 세션부여 하기  >>> : " + mvo.getMemid());
				
				model.addAttribute("listLogin", listLogin);
				return "main/mainPage";
			}
		}
		return "login/sfmLoginForm";
	}
	
// 아이디 찾기 ========================================================================================	
	@GetMapping("sfmidfind")
	public String IdFindForm() {
		logger.info("LoginForm 함수 진입 >>> : ");	
		return "login/sfmidfind";
	}
	
	// 아이디 찾기 인증번호 	
	@GetMapping("idFindAuthnum")
	public String IdFindAuthnum(HttpServletRequest req, SfmMemVO mvo, Model model) {
		logger.info("IdFindAuthnum 함수 진입 >>> : ");	
		
		// 이메일 체크 서비스 호출
		List<SfmMemVO> emailCnt = sfmLoginService.emailCntCheck(mvo);
		
		if (emailCnt.size() == 1) {
			String authcertification = PasswordUtil.tempPW(6);
			logger.info("authcertification >>> : " + authcertification );
			SfmTempAuthVO stvo = null;
			stvo = new SfmTempAuthVO();
			stvo.setAuthcertification(authcertification);
			logger.info("Authcertification >>> : " + stvo.getAuthcertification());
			stvo.setMememail(mvo.getMememail());	
			logger.info("mememail >>> : " + stvo.getMememail());
			// avo.setMemail("jackbomb51@gmail.com");	
			int nCnt = sfmLoginService.tempAuthInsert(stvo);
			logger.info("nCnt >>> : " + nCnt);
			
			if (nCnt == 1) {

				String resiveMail = "XXXXXX@gmail.com";
				String sendMsg = "임시 인증번호 입니다  :::: " + authcertification;			
				GoogleAuthumMail gam = new GoogleAuthumMail();
				gam.authumMail(resiveMail, sendMsg);
				
				return "login/sfmemailCheck";				
			}			
		}
		
		return "login/sfmidFind";
	}
		
	// 아이디 찾아서 받기  	
	@GetMapping("idFind")
	public String IdFind(HttpServletRequest req, SfmMemVO mvo, SfmTempAuthVO stvo, Model model) {
		logger.info("IdFind 함수 진입 >>> : " + stvo.getAuthnum());	
		logger.info("IdFind 함수 진입 >>> : " + mvo.getMememail());
		logger.info("IdFind 함수 진입 >>> : " + mvo.getMemname());
		
		// 아이디 인증 번호 확인 
		List<SfmMemVO> authnumFind = sfmLoginService.idFindAuthnum(stvo);
		logger.info("authnumFind.size() >>> : " + authnumFind.size());
		if (authnumFind.size() == 1) {
			
			// 아이디 확인 서비스 호출		
			List<SfmMemVO> midFind = sfmLoginService.idFind(mvo);
			
			if (midFind.size() == 1) {
				model.addAttribute("midFind", midFind);
				return "login/sfmidFindOK";										
			}
		}
				return "login/sfmidFind";
	}
		
	// 패스워드찾기 ========================================================================================	
	@GetMapping("sfmpwfind")
	public String sfmPwFindForm() {
		logger.info("sfmPwFindForm 함수 진입 >>> : ");	
		return "login/sfmpwfind";
	}
	
	// 임시 패스워드 받기  	
	@GetMapping("pwFindAuthnum")
	public String sfmPwFindAuthnum(HttpServletRequest req, SfmMemVO mvo, Model model) {
		logger.info("sfmPwFindAuthnum 함수 진입 >>> : ");	
		logger.info("sfmPwFindAuthnum 함수 진입 >>> : " + mvo.getMemid());	
		logger.info("sfmPwFindAuthnum 함수 진입 >>> : " + mvo.getMememail());
	
		// id/email 체크해서 임시 비밀번호 발급하고 임시비밀번호 아이디 이메일 디비에 저장하기 	
		// id / email 체크  체크 서비스 호출
		List<SfmMemVO> pwEmailCnt = sfmLoginService.emailCntCheckPW(mvo);
		
		if (pwEmailCnt.size() == 1) {
			
			// 임시 비밀번호 
			String pwcertification = PasswordUtil.tempPW(10);
			
			// 임시비밀번호 아이디 이메일 디비에 저장하기 
			SfmTempPwVO stpvo = null;
			stpvo = new SfmTempPwVO();
			stpvo.setPwcertification(pwcertification);		
			stpvo.setMemid(mvo.getMemid());
			stpvo.setMememail(mvo.getMememail());
			
			// 임시 비밀번호 메일로 발급 하기 
			int nCnt = sfmLoginService.tempPwInsert(stpvo);
			
			if (nCnt == 1) {

				String resiveMail = "XXXXXX@gmail.com";
				String sendMsg = "임시 비밀번호 입니다  :::: " + pwcertification;			
				GoogleAuthumMail gam = new GoogleAuthumMail();
				gam.authumMail(resiveMail, sendMsg);
				
				return "login/sfmpwUpdateForm";				
			}		
		}

		return "login/sfmidfind";
	}
		
	// 새 비밀번호로 변경하기 위한 폼 태크 
	@GetMapping("pwUpdateForm")
	public String sfmPwUpdate(SfmTempPwVO stpvo, Model model, SfmMemVO mvo, HttpServletRequest req) {
		logger.info("sfmPwUpdate 함수 진입 >>> : ");	
		logger.info("sfmPwUpdate 함수 진입 >>> : " + stpvo.getPwcertification());	
		logger.info("sfmPwUpdate 함수 진입 >>> : " + stpvo.getMemid());
				
		// 임시비밀 번호 확인 
		List<SfmTempPwVO> tempPwCheck = sfmLoginService.pwUpdateCheck(stpvo);
		logger.info("tempPwCheck.size() >>> : " + tempPwCheck.size());
		if (tempPwCheck.size() == 1) {
			
			mvo.setMempw(req.getParameter("mempw"));
			stpvo.setMemid(req.getParameter("memid"));
			logger.info("mvo.getMempw >>> : " + mvo.getMempw());
			logger.info("stpvo.getMemid >>> : " + stpvo.getMemid());
			int a = sfmMemService.pwUpdate(mvo);
	
			if(a > 0) {
				return "login/sfmpwUpdate";				
			}
		}

		return "login/sfmpwfind";
	}
		
	  //kakao Login ========================================================================================       
	  @PostMapping("kakaoLogin")
	  public String kakaoLogin(HttpServletRequest req, SfmMemVO mvo, Model model) {
	     logger.info("kakaoLogin 함수 진입 성공 >>> : ");
	     
	     String snstype = req.getParameter("snstype");
	     String snsid = req.getParameter("snsid");
	     String snsemail = req.getParameter("snsemail");
	     
	     logger.info("snstype >>> : " + snstype);
	     logger.info("snsid >>> : " + snsid);
	     logger.info("snsemail >>> : " + snsemail);
	     
	     mvo.setSnstype(snstype); // snstype :: 01:카카오, 02:네이버
	     logger.info("mvo.setSnstype >>> : " + mvo.getSnstype());
	     mvo.setSnsid(snsid);
	     logger.info("mvo.setSnsid >>> : " + mvo.getSnsid());
	     mvo.setSnsemail(snsemail);
	     logger.info("mvo.setSnsemail >>> : " + mvo.getSnsemail());
	     
	     List<SfmMemVO> listLogin = sfmLoginService.kakaoLogin(mvo);
	     logger.info("listLogin.size() >>> : " + listLogin.size());
	     
	     // 로직 처리하기 
	     if (listLogin.size() == 1) {
	        logger.info("sfmCommunitySelectCon listS.size() >>> : " + listLogin.size());
	        model.addAttribute("listLogin", listLogin);
	        return "main/mainPage";
	     }
	     return "";
	  }
	
	// 로그 아웃
	@GetMapping("logout")
	public String sfmLogout(HttpServletRequest req, SfmMemVO mvo, Model model) {	
		logger.info("SfmLoginController logout() 함수 진입 >>> : ");		
								
		K_Session ks = K_Session.getInstance();			
		ks.killSession(req);
		return "login/sfmLogout";
	}
}
