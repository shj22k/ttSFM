package main.sfm.member.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.sfm.member.service.SfmMemService;

@Controller
public class SfmMemController {
	Logger logger = LogManager.getLogger(SfmMemController.class);

	@Autowired(required=false)
	private SfmMemService sfmMemService;
	
	@RequestMapping(value="memberinsertform", method=RequestMethod.GET)
	public String memberinsertform() {
		logger.info("memberinsertform 함수 진입 >>> : ");
		
		return "member/memberinsertform";
	}
	
	@RequestMapping(value="sfmMemInsert", method=RequestMethod.GET)
	public String sfmMemInsert() {
		logger.info("memberinsertform 함수 진입 >>> : ");
		
		return "member/memberinsertform";
	}

}
