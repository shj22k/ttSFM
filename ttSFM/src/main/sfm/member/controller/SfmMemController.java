package main.sfm.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
