package main.sfm.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.sfm.common.ChabunUtil;
import main.sfm.common.CommonUtils;
import main.sfm.common.FileUploadUtil;
import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.community.service.SfmCommunityService;
import main.sfm.community.vo.SfmCommunityVO;

@Controller
public class SfmCommunityController {
	Logger logger = LogManager.getLogger(SfmCommunityController.class);
	
	@Autowired(required=false)
	private SfmCommunityService sfmCommunityService;
	@Autowired(required=false)
	private SfmChabunService sfmChabunService;

	@GetMapping("sfmCommunityInsertForm")
	public String sfmCommunityInsertForm() {
		logger.info("SfmCommunityController sfmCommunityInsertForm 진입");
		return "community/sfmCommunityInsertForm";
	}
	
	@PostMapping("sfmCommunityInsert")
	public String sfmCommunityInsert(HttpServletRequest req, SfmCommunityVO cvo) {
		logger.info("SfmCommunityController sfmCommunityInsert 진입");
		
		String cnum = ChabunUtil.getSFMcommunityChabun("D", sfmChabunService.getSFMcommunityChabun().getCnum());
		logger.info("채번으로 생성된 memnum >>> : " + sfmChabunService.getSFMcommunityChabun().getCnum());
		
		// DB에 연결되는 로직이기 때문에, 반드시 서비스를 통해 연결 해야한다.
		FileUploadUtil mu = new FileUploadUtil( CommonUtils.SFM_IMG_UPLOAD_COMMUNITY_PATH
				   ,CommonUtils.SFM_IMG_FILE_SIZE
				   ,CommonUtils.SFM_EN_CODE);
		
		HttpSession session = req.getSession();
		String memnum = (String)session.getAttribute("memnum");
		logger.info("memnum() >>> : " + memnum);
		
		boolean bool = mu.imgfileUpload(req);
		logger.info("sfmCommunityInsert bool >>> : " + bool);

		cvo.setCnum(cnum);
		cvo.setCsubject(mu.getParameter("csubject"));
		cvo.setCname(mu.getParameter("cname"));
		cvo.setCcontent(mu.getParameter("ccontent"));
		cvo.setCfile(mu.getFileName("cfile"));
		cvo.setMemnum(memnum);
		logger.info("cvo.getCnum() >>> : " + cvo.getCnum());
		logger.info("cvo.getCnum() >>> : " + cvo.getCsubject());
		logger.info("cvo.getCnum() >>> : " + cvo.getCname());
		logger.info("cvo.getCnum() >>> : " + cvo.getCcontent());
		logger.info("cvo.getCnum() >>> : " + cvo.getCfile());
		logger.info("cvo.getCnum() >>> : " + cvo.getMemnum());

		int insertCnt = sfmCommunityService.sfmCommunityInsert(cvo);
		try {
			if(insertCnt > 0) {
				logger.info("sfmCommunityInsert insertCnt >>> : " + insertCnt);
				return "community/sfmCommunityInsertForm";
			}
		}catch(Exception e) {
			System.out.println("에러가 발생" + e);
		}
		return "";
	}
	
	@GetMapping("sfmCommunitySelectAll")
	public String sfmCommunitySelectAll(HttpServletRequest req, SfmCommunityVO cvo, Model model) {
		logger.info("SfmCommunityController HttpServletRequest 진입");
		
		// 페이징 처리 ====================================================================
		int pageSize = CommonUtils.SFM_PAGE_SIZE;
		int groupSize = CommonUtils.SFM_GROUP_SIZE;
		int curPage = CommonUtils.SFM_CUR_PAGE;
		int totalCount = CommonUtils.SFM_TOTAL_COUNT;
		
		if (cvo.getCurPage() !=null){
			curPage = Integer.parseInt(cvo.getCurPage());
		}
		cvo.setPageSize(String.valueOf(pageSize));
		cvo.setGroupSize(String.valueOf(groupSize));
		cvo.setCurPage(String.valueOf(curPage));
		cvo.setTotalCount(String.valueOf(totalCount));
		logger.info("kosSpringFileUploadSelectAll cvo.getPageSize() >>> : " + cvo.getPageSize());
		logger.info("kosSpringFileUploadSelectAll cvo.getGroupSize() >>> : " + cvo.getGroupSize());
		logger.info("kosSpringFileUploadSelectAll cvo.getCurPage() >>> : " + cvo.getCurPage());
		logger.info("kosSpringFileUploadSelectAll cvo.getTotalCount() >>> : " + cvo.getTotalCount());

		List<SfmCommunityVO> alist = sfmCommunityService.sfmCommunitySelectAll(cvo);
		int nCnt = alist.size();

		try {
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				model.addAttribute("pagingCVO", cvo);
				model.addAttribute("alist", alist);		
				
				return "community/sfmCommunitySelectAll";
			}
		}catch(Exception e) {
			logger.info("에러가 >>> :" + e.getMessage());
		}
		return "";
	}
	
	@GetMapping("sfmCommunitySelectCon")
	public String sfmCommunitySelectCon(HttpServletRequest req, SfmCommunityVO cvo, Model model) {
		logger.info("SfmCommunityController sfmCommunitySelectCon 진입");
		
		List<SfmCommunityVO> listS = sfmCommunityService.sfmCommunitySelectCon(cvo);
		if(listS.size() == 1) {
			logger.info("sfmCommunitySelectCon listS.size() >>> : " + listS.size());
			model.addAttribute("listS", listS);
			return "community/sfmCommunitySelectCon";
		}
		return "";
	}

}
