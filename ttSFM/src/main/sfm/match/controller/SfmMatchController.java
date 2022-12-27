package main.sfm.match.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.sfm.common.ChabunUtil;
import main.sfm.common.CommonUtils;
import main.sfm.common.FileUploadUtil;
import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.match.dao.SfmMatchDAOImpl;
import main.sfm.match.service.SfmMatchService;
import main.sfm.match.vo.SfmMatchVO;

@Controller
public class SfmMatchController {
	Logger logger = LogManager.getLogger(SfmMatchDAOImpl.class);

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
		logger.info("getMnum() >>> : " + sfmChabunService.getSFMmatchChabun().getMatchnum());
		
		// DB에 연결되는 로직이기 때문에, 반드시 서비스를 통해 연결 해야한다.
		FileUploadUtil mu = new FileUploadUtil( CommonUtils.SFM_IMG_UPLOAD_PATH
				   ,CommonUtils.SFM_IMG_FILE_SIZE
				   ,CommonUtils.SFM_EN_CODE);

		boolean bool = mu.imgfileUpload(req);
		logger.info("shjMemInsert bool >>> : " + bool);

		mtvo.setMatchnum(matchnum);
		mtvo.setMatchgender(mu.getParameter("matchgender"));
		mtvo.setMatchpersonnel(mu.getParameter("matchpersonnel"));
		mtvo.setMatchzonecode(mu.getParameter("matchzonecode"));
		mtvo.setMatchjibunaddress(mu.getParameter("matchjibunaddress"));
		mtvo.setMatchlv(mu.getParameter("matchlv"));
		mtvo.setMatchkickoff(mu.getParameter("matchkickoff"));
		mtvo.setMatchtime(mu.getParameter("matchtime"));
		mtvo.setMatchstadium(mu.getParameter("matchstadium"));
		mtvo.setMatchparking(mu.getParameter("matchparking"));
		mtvo.setMatchsuit(mu.getParameter("matchsuit"));
		mtvo.setMatchshose(mu.getParameter("matchshose"));
		mtvo.setMemnum(mu.getParameter("memnum"));
		mtvo.setMempreferredarea(mu.getParameter("mempreferredarea"));
		mtvo.setMatchfile(mu.getFileName("matchfile"));
		logger.info("mtvo.getMatchnum()" + mtvo.getMatchnum());
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
}
