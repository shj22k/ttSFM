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

import main.sfm.common.K_Session;
import main.sfm.login.service.SfmLoginService;
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
				
				// 관리자 로그인
				if(mID.equals("admin1234")) {
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
	
	// 로그 아웃
	@GetMapping("logout")
	public String sfmLogout(HttpServletRequest req, SfmMemVO mvo, Model model) {	
		logger.info("SfmLoginController logout() 함수 진입 >>> : ");		
								
		K_Session ks = K_Session.getInstance();			
		ks.killSession(req);
		return "login/sfmLogout";
	}
}
