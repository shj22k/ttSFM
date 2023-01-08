package main.sfm.like.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.sfm.community.vo.SfmCommunityVO;
import main.sfm.like.service.SfmLikeService;
import main.sfm.like.vo.SfmLikeVO;

@Controller
public class SfmLikeController {
	Logger logger = LogManager.getLogger(SfmLikeController.class);

	// 필드 오토와이어드 
	@Autowired(required=false)
	private SfmLikeService sfmLikeService;
	
	// like_1 등록
	@GetMapping("like_cnt_1")
	@ResponseBody
	public String sfmLikecnt_1(SfmLikeVO slvo, HttpServletRequest req) {	
		logger.info("sfmLikecnt_1 >>> : ");
		
		HttpSession session = req.getSession();
	    
	    String memnum = (String)session.getAttribute("memnum");
	    String cnum = (String)session.getAttribute("cnum");
	    
	    slvo.setMemnum(memnum);
	    slvo.setCnum(cnum);
		
		logger.info("sfmLikecnt_1 slvo.getLike_cnt_1() >>> : " + slvo.getLike_cnt_1());
		logger.info("sfmLikecnt_1 slvo.getMemnum() >>> : " + slvo.getMemnum());
		logger.info("sfmLikecnt_1 slvo.getCnum() >>> : " + slvo.getCnum());
		
		List<SfmLikeVO> listCnt = sfmLikeService.sfmLikeSelect(slvo);
		logger.info("sfmLikecnt_1 listCnt >>> : " + listCnt);
		
		int nCnt = 0;
		if (listCnt !=null && listCnt.size() > 0) {
			nCnt = sfmLikeService.sfmLikeUpdate_1(slvo);
			logger.info("sfmLikecnt_1 nCnt >>> : " + nCnt);			
		}else {
			nCnt = sfmLikeService.sfmLikeInsert(slvo);
			logger.info("sfmLikecnt_1 nCnt >>> : " + nCnt);		
		}
							
		String blike_cnt_1 = "";
		List<SfmLikeVO> listAll = sfmLikeService.sfmLikeSelectAll(slvo);
		if (listAll !=null && listAll.size() > 0) {
			blike_cnt_1 = listAll.get(0).getLike_cnt_1();
		}
				
		return blike_cnt_1;
	}
	
	// like_2 등록
	@GetMapping("like_cnt_2")
	@ResponseBody
	public String sfmLikecnt_2(SfmLikeVO slvo, HttpServletRequest req) {	
		logger.info("sfmLikecnt_2 >>> : ");
		
		HttpSession session = req.getSession();
	    String cnum = (String)session.getAttribute("cnum");
	    String memnum = (String)session.getAttribute("memnum");
	    slvo.setMemnum(memnum);
		slvo.setCnum(cnum);
		
		logger.info("sfmLikecnt_2 blvo.getLike_cnt_2() >>> : " + slvo.getLike_cnt_2());
		logger.info("sfmLikecnt_2 blvo.getMemnum() >>> : " + slvo.getMemnum());
		logger.info("sfmLikecnt_2 blvo.getCnum() >>> : " + slvo.getCnum());
		
		List<SfmLikeVO> listCnt = sfmLikeService.sfmLikeSelect(slvo);
		logger.info("sfmLikecnt_2 listCnt >>> : " + listCnt);
		
		int nCnt = 0;
		if (listCnt !=null && listCnt.size() > 0) {
			nCnt = sfmLikeService.sfmLikeUpdate_2(slvo);
			logger.info("sfmLikecnt_2 nCnt >>> : " + nCnt);			
		}else {
			nCnt = sfmLikeService.sfmLikeInsert(slvo);
			logger.info("sfmLikecnt_2 nCnt >>> : " + nCnt);		
		}
							
		String blike_cnt_2 = "";
		List<SfmLikeVO> listAll = sfmLikeService.sfmLikeSelectAll(slvo);
		if (listAll !=null && listAll.size() > 0) {
			blike_cnt_2 = listAll.get(0).getLike_cnt_2();
		}
				
		return blike_cnt_2;
	}	
}
