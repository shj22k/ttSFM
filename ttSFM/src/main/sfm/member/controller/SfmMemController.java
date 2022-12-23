package main.sfm.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.sfm.common.ChabunUtil;
import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.member.service.SfmMemService;
import main.sfm.member.vo.SfmMemVO;

@Controller
public class SfmMemController {
	Logger logger = LogManager.getLogger(SfmMemController.class);

	@Autowired(required=false) // 의존성 주입
	private SfmMemService sfmMemService;
	@Autowired(required=false) // 채번 의존성 주입
	private SfmChabunService sfmChabunService;

	@RequestMapping(value="sfmMemInsertForm", method=RequestMethod.GET)
	public String memberinsertform() {
		logger.info("sfmMemInsertForm 함수 진입 >>> : ");
		return "member/sfmMemInsertForm";
	}
	
	@RequestMapping(value="sfmMemInsert", method=RequestMethod.POST)
	public String sfmMemInsert(HttpServletRequest req) {
		logger.info("memberinsertform 함수 진입 >>> : ");
		
		String memnum = ChabunUtil.getSFMmemChabun("D", sfmChabunService.getSFMmemChabun().getMemnum());
		logger.info("채번으로 생성된 memnum >>> : " + sfmChabunService.getSFMmemChabun().getMemnum());
		
		SfmMemVO mvo = null;
		mvo = new SfmMemVO();
		
		mvo.setMemnum(memnum);
		mvo.setMemname(req.getParameter("memname"));
		mvo.setMemgender(req.getParameter("memgender"));
		
		return "member/sfmMemInsertForm";
	}

}
