package main.sfm.rcommunity.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.sfm.common.ChabunUtil;
import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.rcommunity.service.SfmRcommunityService;
import main.sfm.rcommunity.vo.SfmRcommunityVO;

@Controller
public class SfmRcommunityController {
	Logger logger = LogManager.getLogger(SfmRcommunityController.class);
	
	@Autowired(required=false)
	private SfmRcommunityService sfmRcommunityService;
	@Autowired(required=false)
	private SfmChabunService sfmChabunService;

	@GetMapping("sfmRcommunitySelectAll")
	public String sfmRcommunitySelectAll() {
		logger.info("sfmRcommunitySelectAll 함수 진입 >>> : ");	
		return "rcommunity/sfmRcommunitySelectAll";
	}

	@PostMapping("sfmRcommunityInsert")
	@ResponseBody
	public String sfmRcommunityInsert(SfmRcommunityVO rcvo) {
		logger.info("SfmRcommunityController sfmRcommunityInsert 진입");
		
		// 채번 구하기
		String rcnum = ChabunUtil.getSFMrcommunityChabun("N", sfmChabunService.getSFMrcommunityChabun().getRcnum());
		logger.info("sfmRcommunityInsert 채번 rcnum >>> : " + rcnum);
		
		rcvo.setRcnum(rcnum);		
		logger.info("rcvo.getRcnum() >>> : " + rcvo.getRcnum());

		int nCnt = sfmRcommunityService.sfmRcommunityInsert(rcvo);
		logger.info("sfmRcommunityInsert nCnt >>> : " + nCnt);
		
		if (1 == nCnt) { return "GOOD"; }
		else { return "BAD"; }

	}
	
	@RequestMapping(value="sfmRcommunitySelectAll", produces="application/text; charset=UTF-8;")
	@ResponseBody
	public String sfmRcommunitySelectAll(SfmRcommunityVO rcvo){
		logger.info("sfmRcommunitySelectAll >>> : ");
		
		List<SfmRcommunityVO> list = sfmRcommunityService.sfmRcommunitySelectAll(rcvo);
		logger.info("sfmRcommunitySelectAll list >>> : " + list);

		String ss = "";
		String listStr = "";
		for (int i=0; i < list.size(); i++) {
			SfmRcommunityVO _rcvo = list.get(i);
			String s0 = _rcvo.getRcnum();
			String s1 = _rcvo.getRcname();
			String s2 = _rcvo.getRccontent();
			String s3 = _rcvo.getInsertdate();
			ss = s0+","+s1+","+s2+","+s3;
			listStr += ss+"&";
		}
		return listStr;
	}
	
	// 댓글 삭제
	@PostMapping("sfmRcommunityDelete")
	@ResponseBody
	public String sfmRcommunityDelete(SfmRcommunityVO rcvo, HttpServletRequest req) {	
		logger.info("sfmRcommunityDelete rcvo.getRcnum() >>> : " + rcvo.getRcnum());

		int nCnt = sfmRcommunityService.sfmRcommunityDelete(rcvo);
		logger.info("sfmRcommunityDelete nCnt >>> : " + nCnt);
		
		if(nCnt == 1) { return "GOOD"; }
		else { return "BAD";}
	}
	
}
