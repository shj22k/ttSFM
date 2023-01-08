package main.sfm.match.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import main.sfm.common.ChabunUtil;
import main.sfm.common.CommonUtils;
import main.sfm.common.FileUploadUtil;
import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.match.dao.SfmMatchDAOImpl;
import main.sfm.match.service.SfmMatchService;
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.member.vo.SfmMemVO;

@Controller
public class SfmMatchController {
	Logger logger = LogManager.getLogger(SfmMatchController.class);

	@Autowired(required=false) // 의존성 주입
	private SfmMatchService sfmMatchService;
	@Autowired(required=false) // 채번 의존성 주입
	private SfmChabunService sfmChabunService;
	
	@GetMapping("sfmMatchInsertForm")
	public String sfmMatchInsertForm() {
		logger.info("SfmMatchController sfmMatchInsertForm 진입");
		return "admin/sfmMatchInsertForm";
	}
	
	@PostMapping("sfmMatchInsert")
	public String sfmMatchInsert(HttpServletRequest req, SfmMatchVO mtvo) {
		logger.info("SfmMatchController sfmMatchInsert 진입");

		// 채번로직
		String matchnum = ChabunUtil.getSFMmatchChabun("D", sfmChabunService.getSFMmatchChabun().getMatchnum());
		logger.info("matchnum() >>> : " + sfmChabunService.getSFMmatchChabun().getMatchnum());
		
		// DB에 연결되는 로직이기 때문에, 반드시 서비스를 통해 연결 해야한다.
		FileUploadUtil mu = new FileUploadUtil( CommonUtils.SFM_IMG_UPLOAD_MATCH_PATH
				   ,CommonUtils.SFM_IMG_FILE_SIZE
				   ,CommonUtils.SFM_EN_CODE);

		HttpSession session = req.getSession();
		String memnum = (String)session.getAttribute("memnum");
		logger.info("memnum() >>> : " + memnum);

		boolean bool = mu.imgfileUpload(req);
		logger.info("shjMemInsert bool >>> : " + bool);
		
		String matchkickoff = mu.getParameter("matchkickoff");
		String[] array = matchkickoff.split(" ");
		String matchdate = array[0]; // 2022-12-29
		String matchkick = array[1]; // 16:28
		logger.info("matchdate >>> : " + matchdate);
		logger.info("matchkick >>> : " + matchkick);

		mtvo.setMatchnum(matchnum);
		mtvo.setMatchgender(mu.getParameter("matchgender"));
		mtvo.setMatchpersonnel(mu.getParameter("matchpersonnel"));
		mtvo.setMatchzonecode(mu.getParameter("matchzonecode"));
		mtvo.setMatchjibunaddress(mu.getParameter("matchjibunaddress"));
		mtvo.setMatchlv(mu.getParameter("matchlv"));
		mtvo.setMatchkickoff(matchdate); // 날짜
		mtvo.setMatchtime(matchkick); 	// 시간
		mtvo.setMatchstadium(mu.getParameter("matchstadium"));
		mtvo.setMatchparking(mu.getParameter("matchparking"));
		mtvo.setMatchsuit(mu.getParameter("matchsuit"));
		mtvo.setMatchshose(mu.getParameter("matchshose"));
		mtvo.setMatchshower(mu.getParameter("matchshower"));
		mtvo.setMemnum(memnum);
		mtvo.setMempreferredarea(mu.getParameter("mempreferredarea"));
		mtvo.setMatchfile(mu.getFileName("matchfile"));
		logger.info("mtvo.getMatchnum() >>> : " + mtvo.getMatchnum());
		logger.info("mtvo.getMatchgender() >>> :" + mtvo.getMatchgender());
		logger.info("mtvo.getMatchpersonnel() >>> :" + mtvo.getMatchpersonnel());
		logger.info("mtvo.getMatchzonecode() >>> :" + mtvo.getMatchzonecode());
		logger.info("mtvo.getMatchjibunaddress() >>> :" + mtvo.getMatchjibunaddress());
		logger.info("mtvo.getMatchlv() >>> :" + mtvo.getMatchlv());
		logger.info("mtvo.getMatchkickoff() >>> :" + mtvo.getMatchkickoff());
		logger.info("mtvo.getMatchtime() >>> :" + mtvo.getMatchtime());
		logger.info("mtvo.getMatchstadium() >>> :" + mtvo.getMatchstadium());
		logger.info("mtvo.getMatchparking() >>> :" + mtvo.getMatchparking());
		logger.info("mtvo.getMatchsuit() >>> :" + mtvo.getMatchsuit());
		logger.info("mtvo.getMatchshose() >>> :" + mtvo.getMatchshose());
		logger.info("mtvo.getMemnum() >>> :" + mtvo.getMemnum());
		logger.info("mtvo.getMempreferredarea() >>> :" + mtvo.getMempreferredarea());
		logger.info("mtvo.getMatchfile() >>> :" + mtvo.getMatchfile());
		
		int insertCnt = sfmMatchService.sfmMatchInsert(mtvo);
		try {
			if(insertCnt > 0) {
				logger.info("sfmMatchInsert insertCnt >>> : " + insertCnt);
				return "admin/sfmMatchInsertForm";
			}
		}catch(Exception e) {
			System.out.println("에러가 발생" + e);
		}
		return "";
	}
	
	// 전체 목록
	@PostMapping("sfmMatchSelectAll")
	public String sfmMatchSelectAll(SfmMatchVO mtvo, Model model) {
		logger.info("SfmMatchController sfmMatchSelectAll 진입");

		List<SfmMatchVO> listAll = sfmMatchService.sfmMatchSelectAll(mtvo);
		int nCnt = listAll.size();
		
		try {
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				
				model.addAttribute("listAll", listAll);
				return "admin/sfmMatchSelectAll";
			}
		}catch(Exception e) { System.out.println("에러가 발생" + e); }
		return "";
	}
	
	// 부분 조회
	@GetMapping("sfmMatchSelectCon")
	public String sfmMatchSelectCon(SfmMatchVO mtvo, Model model, HttpServletRequest req) {
		logger.info("SfmMatchController sfmMatchSelectAll 진입");

		String matchnum = req.getParameter("matchnum");
		logger.info("matchnum >>> : "+matchnum);
		mtvo.setMatchnum(matchnum);
		logger.info("matchnum >>> : "+matchnum);

		List<SfmMatchVO> listS = sfmMatchService.sfmMatchSelectAll(mtvo);
		int nCnt = listS.size();
		
		try {
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				
				model.addAttribute("listS", listS);
				return "admin/sfmMatchSelectCon";
			}
		}catch(Exception e) { System.out.println("에러가 발생" + e); }
		return "";
	}
	
	@GetMapping("sfmMatchSelectfilter")
	public String sfmMatchSelectfilter(SfmMatchVO mtvo, Model model, HttpServletRequest req) {
		logger.info("SfmMatchController sfmMatchSelectfilter 진입");

		List<SfmMatchVO> searchList = sfmMatchService.sfmMatchSelectfilter(mtvo);
		int nCnt = searchList.size();
		logger.info("sfmMatchSelectfilter nCnt >>> : " + nCnt);
		
		try {
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				
				model.addAttribute("searchList", searchList);
				return "admin/sfmMatchSelectAll";
			}
		}catch(Exception e) { System.out.println("에러가 발생" + e); }
		return "";
	}
	
	// 수정 폼으로 이동
	@GetMapping("sfmMatchUpdateForm")
	public String sfmMatchUpdateForm(HttpServletRequest req, Model model,SfmMatchVO mtvo) throws Exception{
		logger.info("sfmMatchUpdateForm 함수 진입 >>> : ");

		String memnum = req.getParameter("chkbox");
		
		mtvo.setMemnum(memnum);
		
		List<SfmMatchVO> sfmMatchUpdateForm = new ArrayList<SfmMatchVO>();
		sfmMatchUpdateForm = sfmMatchService.sfmMatchSelectCon(mtvo);
		
		model.addAttribute("sfmMatchUpdateForm", sfmMatchUpdateForm);
		
		return "admin/sfmMatchUpdateForm";
	}
	
	
	// 수정 폼에서 '수정하기 버튼 클릭시'
	@PostMapping("sfmMatchUpdate")
	public String sfmMatchUpdate(HttpServletRequest req, SfmMatchVO mtvo, Model model) {
		
		// DB에 연결되는 로직이기 때문에, 반드시 서비스를 통해 연결 해야한다.
		FileUploadUtil mu = new FileUploadUtil( CommonUtils.SFM_IMG_UPLOAD_MATCH_PATH
				   ,CommonUtils.SFM_IMG_FILE_SIZE
				   ,CommonUtils.SFM_EN_CODE);

		HttpSession session = req.getSession();
		String memnum = (String)session.getAttribute("memnum");
		
		boolean bool = mu.imgfileUpload(req);
		logger.info("shjMemInsert bool >>> : " + bool);

		mtvo.setMatchnum(mu.getParameter("matchnum"));
		mtvo.setMatchgender(mu.getParameter("matchgender"));
		mtvo.setMatchpersonnel(mu.getParameter("matchpersonnel"));
		mtvo.setMatchzonecode(mu.getParameter("matchzonecode"));
		mtvo.setMatchjibunaddress(mu.getParameter("matchjibunaddress"));
		mtvo.setMatchlv(mu.getParameter("matchlv"));
		mtvo.setMatchkickoff(mu.getParameter("matchkickoff"));
		mtvo.setMatchtime(mu.getParameter("matchtime"));
		mtvo.setMatchstadium(mu.getParameter("matchstadium"));
		mtvo.setMatchparking(mu.getParameter("matchparking"));
		mtvo.setMatchshower(mu.getParameter("matchshower"));
		mtvo.setMatchsuit(mu.getParameter("matchsuit"));
		mtvo.setMatchshose(mu.getParameter("matchshose"));
		mtvo.setMemnum(memnum);
		mtvo.setMempreferredarea(mu.getParameter("mempreferredarea"));
		mtvo.setMatchfile(mu.getFileName("matchfile"));
		logger.info("mtvo.getMatchnum() >>> : " + mtvo.getMatchnum());
		logger.info("mtvo.getMatchgender() >>> :" + mtvo.getMatchgender());
		logger.info("mtvo.getMatchpersonnel() >>> :" + mtvo.getMatchpersonnel());
		logger.info("mtvo.getMatchzonecode() >>> :" + mtvo.getMatchzonecode());
		logger.info("mtvo.getMatchjibunaddress() >>> :" + mtvo.getMatchjibunaddress());
		logger.info("mtvo.getMatchlv() >>> :" + mtvo.getMatchlv());
		logger.info("mtvo.getMatchkickoff() >>> :" + mtvo.getMatchkickoff());
		logger.info("mtvo.getMatchtime() >>> :" + mtvo.getMatchtime());
		logger.info("mtvo.getMatchstadium() >>> :" + mtvo.getMatchstadium());
		logger.info("mtvo.getMatchparking() >>> :" + mtvo.getMatchparking());
		logger.info("mtvo.getMatchsuit() >>> :" + mtvo.getMatchsuit());
		logger.info("mtvo.getMatchshose() >>> :" + mtvo.getMatchshose());
		logger.info("mtvo.getMempreferredarea() >>> :" + mtvo.getMempreferredarea());
		logger.info("mtvo.getMatchfile() >>> :" + mtvo.getMatchfile());
		
		int insertCnt = sfmMatchService.sfmMatchInsert(mtvo);
		try {
			if(insertCnt > 0) {
				logger.info("sfmMatchInsert insertCnt >>> : " + insertCnt);
				return "admin/sfmMatchSelectAll";
			}
		}catch(Exception e) {
			System.out.println("에러가 발생" + e);
		}
		return "";
	}
	
	@GetMapping("sfmMatchDelete")
	public String sfmMatchDelete(HttpServletRequest req, Model model,SfmMatchVO mtvo) {
		logger.info("sfmMatchDelete 함수 진입 >>> : ");

		String memnum = req.getParameter("chkbox");
		mtvo.setMemnum(memnum);
		
		int deleteCnt = sfmMatchService.sfmMatchDelete(mtvo);
		if(deleteCnt > 0) {
			model.addAttribute("deleteCnt", deleteCnt);
		}
		return "sfm/sfmMatchSelectAll";
	}
	
	@GetMapping("sfmMatchMap")
	public Object sfmIdCheck(SfmMatchVO mtvo, HttpServletRequest req, Model model) {
		logger.info("---sfmMatchMap 함수 진입---");
		
		//sfmMatchMap
		mtvo.setMatchjibunaddress(req.getParameter("jibun"));
		logger.info("mtvo.getMatchjibunaddress() >>> : " + mtvo.getMatchjibunaddress());
		mtvo.setMatchstadium(req.getParameter("jibun"));
		logger.info("mtvo.getMatchstadium() >>> : " + mtvo.getMatchstadium());

		List<SfmMatchVO> map = sfmMatchService.sfmMatchMap(mtvo);
		logger.info("mtvo.getMatchjibunaddress() >>> : " + mtvo.getMatchjibunaddress());
		int nCnt = map.size();
		
		try {
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				model.addAttribute("map", map);
				return "commons/sfmMatchMap";
			}
		}catch(Exception e) { System.out.println("에러가 발생" + e); }
		
		return "commons/sfmMatchMap";
	}
	
}
