package main.sfm.member.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import main.sfm.common.ChabunUtil;
import main.sfm.common.CommonUtils;
import main.sfm.common.FileUploadUtil;
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
		logger.info("sfmMemInsert 함수 진입 >>> : ");
		
		String memnum = ChabunUtil.getSFMmemChabun("D", sfmChabunService.getSFMmemChabun().getMemnum());
		logger.info("채번으로 생성된 memnum >>> : " + sfmChabunService.getSFMmemChabun().getMemnum());
		
		SfmMemVO mvo = null;
		mvo = new SfmMemVO();
		
		// 전화번호
		String memhp = req.getParameter("memhp");
		String memhp1 = req.getParameter("memhp1");
		String memhp2 = req.getParameter("memhp2");
		memhp = memhp.concat("-" + memhp1).concat("-" + memhp2);

		mvo.setMemnum(memnum);
		mvo.setMemname(req.getParameter("memname"));
		logger.info("mvo.getMemname() >>> : " + mvo.getMemname());
		mvo.setMemgender(req.getParameter("memgender"));
		logger.info("mvo.getMemgender() >>> : " + mvo.getMemgender());
		mvo.setMemid(req.getParameter("memid"));
		logger.info("mvo.getMemid() >>> : " + mvo.getMemid());
		mvo.setMempw(req.getParameter("mempw"));
		logger.info("mvo.getMempw() >>> : " + mvo.getMempw());
		mvo.setMemzonecode(req.getParameter("memzonecode"));
		mvo.setMemjibunaddress(req.getParameter("memjibunaddress"));
		mvo.setMemjibunaddressdetail(req.getParameter("memjibunaddressdetail"));
		mvo.setMememail(req.getParameter("mememail"));
		logger.info("mvo.getMememail() >>> : " + mvo.getMememail());
		mvo.setMemposition(req.getParameter("memposition"));
		mvo.setMempreferredarea(req.getParameter("mempreferredarea"));
		mvo.setMemhp(memhp);
		logger.info("mvo.getMemhp() >>> : " + mvo.getMemhp());
		mvo.setIsmanager("0");
		logger.info("mvo.getMemid() >>> : " + mvo.getMemid());
		logger.info("mvo.getMempw() >>> : " + mvo.getMempw());
		logger.info("mvo.getMemzonecode() >>> : " + mvo.getMemzonecode());
		logger.info("mvo.getMemjibunaddress() >>> : " + mvo.getMemjibunaddress());
		logger.info("mvo.getMemjibunaddressdetail() >>> : " + mvo.getMemjibunaddressdetail());
		logger.info("mvo.getMememail() >>> : " + mvo.getMememail());
		logger.info("mvo.getMemposition() >>> : " + mvo.getMemposition());
		logger.info("mvo.getMempreferredarea() >>> : " + mvo.getMempreferredarea());

		int insertCnt = sfmMemService.sfmMemInsert(mvo);
		if(insertCnt > 0) {
			logger.info("sfmMemService insertCnt >>> : " + insertCnt);
			return "member/sfmMemInsertForm";
		}
		return "member/sfmMemInsertForm";
	}
	
	// 내정보 페이지 이동
	@GetMapping("sfmMemSelectAll")
	public String sfmMemSelectAll(SfmMemVO mvo, Model model) {
		logger.info("sfmMemSelectAll 진입");
		
		// DB에 연결되는 로직이기 때문에, 반드시 서비스를 통해 연결 해야한다.
		List<SfmMemVO> fileUploadListAll = sfmMemService.sfmMemSelectAll(mvo);
		int nCnt = fileUploadListAll.size();
		
		try {
			if(nCnt > 0) {
				logger.info("sfmMemService nCnt >>> : " + nCnt);
				model.addAttribute("fileUploadListAll", fileUploadListAll);		
				return "member/sfmMemSelectAll";	// 내정보 보기
			}
		}catch(Exception e) {
			logger.info("에러가 >>> :" + e.getMessage());
		}
		return "admin/mainPage";
	}
	
	// 수정 폼으로 이동
	@GetMapping("sfmMemUpdateForm")
	public String sfmMatchUpdateForm(HttpServletRequest req, Model model,SfmMemVO mvo) throws Exception{
		logger.info("sfmMemUpdateForm 함수 진입 >>> : ");

		HttpSession session = req.getSession();
		String memnum = (String)session.getAttribute("memnum");
		logger.info("memnum() >>> : " + memnum);
		
		mvo.setMemnum(memnum);
		
		List<SfmMemVO> updateForm = new ArrayList<SfmMemVO>();
		updateForm = sfmMemService.sfmMemSelect(mvo);
		
		model.addAttribute("updateForm", updateForm);
		
		return "member/sfmMemUpdateForm";	// 회원 수정페이지
	}
	
	// 수정 폼에서 '수정하기 버튼 클릭시'
	@PostMapping("sfmMemUpdate")
	public String sfmMemUpdate(HttpServletRequest req, SfmMemVO mvo, Model model) {
		
		// DB에 연결되는 로직이기 때문에, 반드시 서비스를 통해 연결 해야한다.
		FileUploadUtil mu = new FileUploadUtil( CommonUtils.SFM_IMG_UPLOAD_PATH
				   ,CommonUtils.SFM_IMG_FILE_SIZE
				   ,CommonUtils.SFM_EN_CODE);

		boolean bool = mu.imgfileUpload(req);
		logger.info("shjMemInsert bool >>> : " + bool);

		// 전화번호
		String memhp = mu.getParameter("memhp");
		String memhp1 = mu.getParameter("memhp1");
		String memhp2 = mu.getParameter("memhp2");
		memhp = memhp.concat("-" + memhp1).concat("-" + memhp2);

		mvo.setMemname(mu.getParameter("memname"));
		logger.info("mvo.getMemname() >>> : " + mvo.getMemname());
		mvo.setMemgender(mu.getParameter("memgender"));
		logger.info("mvo.getMemgender() >>> : " + mvo.getMemgender());
		mvo.setMemid(mu.getParameter("memid"));
		logger.info("mvo.getMemid() >>> : " + mvo.getMemid());
		mvo.setMempw(mu.getParameter("mempw"));
		logger.info("mvo.getMempw() >>> : " + mvo.getMempw());
		mvo.setMemzonecode(mu.getParameter("memzonecode"));
		mvo.setMemjibunaddress(mu.getParameter("memjibunaddress"));
		mvo.setMemjibunaddressdetail(mu.getParameter("memjibunaddressdetail"));
		mvo.setMememail(mu.getParameter("mememail"));
		logger.info("mvo.getMememail() >>> : " + mvo.getMememail());
		mvo.setMemposition(mu.getParameter("memposition"));
		mvo.setMempreferredarea(mu.getParameter("mempreferredarea"));
		mvo.setMemhp(memhp);
		logger.info("mvo.getMemhp() >>> : " + mvo.getMemhp());
		mvo.setIsmanager("0");
		logger.info("mvo.getMemid() >>> : " + mvo.getMemid());
		logger.info("mvo.getMempw() >>> : " + mvo.getMempw());
		logger.info("mvo.getMemzonecode() >>> : " + mvo.getMemzonecode());
		logger.info("mvo.getMemjibunaddress() >>> : " + mvo.getMemjibunaddress());
		logger.info("mvo.getMemjibunaddressdetail() >>> : " + mvo.getMemjibunaddressdetail());
		logger.info("mvo.getMememail() >>> : " + mvo.getMememail());
		logger.info("mvo.getMemposition() >>> : " + mvo.getMemposition());
		logger.info("mvo.getMempreferredarea() >>> : " + mvo.getMempreferredarea());
		
		int updateCnt = sfmMemService.sfmMemUpdate(mvo);
		try {
			if(updateCnt > 0) {
				logger.info("sfmMatchInsert insertCnt >>> : " + updateCnt);
				return "member/sfmMemUpdate";
			}
		}catch(Exception e) {
			System.out.println("에러가 발생" + e);
		}
		return "";
	}
	
	@GetMapping("sfmMemDelete")
	public String sfmMemDelete(HttpServletRequest req, Model model,SfmMemVO mvo) {
		logger.info("sfmMemDelete 함수 진입 >>> : ");

		String memnum = req.getParameter("chkbox");
		mvo.setMemnum(memnum);
		
		int deleteCnt = sfmMemService.sfmMemDelete(mvo);
		if(deleteCnt > 0) {
			model.addAttribute("deleteCnt", deleteCnt);
		}
		return "sfm/sfmMatchSelectAll";
	}

	
	@PostMapping("sfmIdCheck")
	@ResponseBody
	public Object sfmIdCheck(SfmMemVO mvo) {
		logger.info("---sfmIdCheck 함수 진입---");
		logger.info("sfmIdCheck mvo.getMemid()() >>> : " + mvo.getMemid());	
		
		List<SfmMemVO> list = sfmMemService.sfmIdCheck(mvo);
		logger.info("sfmIdCheck list >>> : " + list.size());

		String msg ="";
		if(list.size() == 0) {msg = "ID_YES";}
		else {msg = "ID_NO";}
		
		return msg;
	}

	@GetMapping("mainIntro")
	public String mainIntro(HttpServletRequest req, Model model,SfmMemVO mvo) {
		logger.info("mainIntro 함수 진입 >>> : ");
		return "member/mainIntro";
	}
}
