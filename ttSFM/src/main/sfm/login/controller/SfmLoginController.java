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
import main.sfm.member.vo.SfmMemVO;

@Controller
public class SfmLoginController {
	Logger logger = LogManager.getLogger(SfmLoginController.class);

	@Autowired(required=false)	// 의존성 주입
	private SfmLoginService sfmLoginService;
	
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

		if(listLogin.size() == 1) {
			K_Session ks = K_Session.getInstance();
			String mID = ks.getSession(req);
			
			if(mID !=null && mID.equals(listLogin.get(0).getMemid())) {
				logger.info("SfmLoginController login >>> : 로그인 중 >>> : 다른 페이지로 이동 하기 >>> : " + mID);
				
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
		@GetMapping("idFindForm")
		public String IdFindForm() {
			logger.info("LoginForm 함수 진입 >>> : ");	
			return "login/idFind";
		}
		
		// 아이디 찾기 인증번호 	
		@GetMapping("idFindAuthnum")
		public String IdFindAuthnum(HttpServletRequest req, SfmMemVO mvo, Model model) {
			logger.info("IdFindAuthnum 함수 진입 >>> : ");	
			
			// 이메일 체크 서비스 호출
			List<SfmMemVO> emailCnt = sfmLoginService.emailCntCheck(mvo);
			
			if (emailCnt.size() == 1) {
				String authnum = PasswordUtil.tempPW(6);
				
				SfmTempAuthVO stvo = null;
				stvo = new SfmTempAuthVO();
				stvo.setAuthnum(authnum);
				stvo.setMememail(mvo.getMememail());	
				// avo.setMemail("jackbomb51@gmail.com");	
				int nCnt = sfmLoginService.tempAuthInsert(stvo);
				
				if (nCnt == 1) {

					String resiveMail = "XXXXXX@gmail.com";
					String sendMsg = "임시 인증번호 입니다  :::: " + authnum;			
					GoogleAuthumMail gam = new GoogleAuthumMail();
					gam.authumMail(resiveMail, sendMsg);
					
					return "login/emailCheck";				
				}			
			}
			
			return "login/idFind";
		}
		
		// 아이디 찾아서 받기  	
		@GetMapping("idFind")
		public String IdFind(HttpServletRequest req, SfmMemVO mvo, SfmTempAuthVO stvo, Model model) {
			logger.info("IdFind 함수 진입 >>> : " + stvo.getAuthnum());	
			logger.info("IdFind 함수 진입 >>> : " + mvo.getMememail());
			logger.info("IdFind 함수 진입 >>> : " + mvo.getMemname());
			
			// 아이디 인증 번호 확인 
			List<SfmMemVO> authnumFind = sfmLoginService.idFindAuthnum(stvo);
			
			if (authnumFind.size() == 1) {
				
				// 아이디 확인 서비스 호출		
				List<SfmMemVO> midFind = sfmLoginService.idFind(mvo);
				
				if (midFind.size() == 1) {
					model.addAttribute("midFind", midFind);
					return "login/idFindOK";										
				}
			}
					return "login/idFind";
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
