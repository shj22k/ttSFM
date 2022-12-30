package main.sfm.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.community.service.SfmCommunityService;
import main.sfm.match.dao.SfmMatchDAOImpl;
import main.sfm.match.vo.SfmMatchVO;

@Controller
public class SfmCommunityController {
	Logger logger = LogManager.getLogger(SfmCommunityController.class);
	
	@Autowired(required=false)
	private SfmCommunityService sfmCommunityService;
	@Autowired(required=false)
	private SfmChabunService sfmChabunService;

	@GetMapping("sfmCommunityInsertForm")
	public String sfmCommunityInsertForm(HttpServletRequest req, SfmMatchVO mtvo) {
		logger.info("SfmCommunityController sfmCommunityInsertForm 진입");
		
		HttpSession session = req.getSession();
		String memnum = (String)session.getAttribute("memnum");
		
		
		return "community/sfmCommunityInsertForm";
	}
	
	@PostMapping("sfmCommunityInsert")
	public String sfmCommunityInsert() {
		logger.info("SfmCommunityController sfmCommunityInsert 진입");
		
		
		return "";
	}

}
