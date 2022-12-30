package main.sfm.notice.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.sfm.common.ChabunUtil;
import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.notice.service.SfmNoticeService;
import main.sfm.notice.vo.SfmNoticeVO;

@Controller
public class SfmNoticeController {

Logger logger = LogManager.getLogger(SfmNoticeController.class);
	
	//컨트롤러에서 SfmNotice 서비스 연결
	@Autowired(required =false)
	private SfmNoticeService sfmNoticeService;
	
	@Autowired(required=false) // 채번 의존성 주입
	private SfmChabunService sfmChabunService;


	//입력폼 호출하기
	@RequestMapping(value="sfmNoticeInsertForm",method=RequestMethod.GET)
	public String sfmNoticeInsertForm() {
		
		logger.info("sfmNoticeInsertForm 함수진입 >>>" );
		
		return "notice/sfmNoticeInsertForm";
	}


	//입력
	@RequestMapping(value = "sfmNoticeInsert" , method=RequestMethod.POST)
	public String sfmNoticeInsert(HttpServletRequest req,SfmNoticeVO snvo) {
		String noticenum = ChabunUtil.getSFMnoticeChabun("D", sfmChabunService.getSFMnoticeChabun().getNoticenum());
		
		logger.info("sfmNoticeInsert 함수진입 >>>" );
		
		HttpSession session = req.getSession();
	    String memnum = (String)session.getAttribute("memnum");
		
		//String memnum = req.getParameter("memnum"); 
		snvo.setMemnum(memnum);
		
		logger.info("memnum >>" +memnum);
		snvo.setNoticenum(noticenum);
		logger.info("noticenum >>> "+snvo.getNoticenum());
		snvo.setNoticecontent(req.getParameter("noticecontent"));
		snvo.setNoticetitle(req.getParameter("noticetitle"));
		
		logger.info("noticecontent >>> "+snvo.getNoticecontent());
		logger.info("noticetitle >>> "+snvo.getNoticetitle());

		int insertCnt =sfmNoticeService.sfmNoticeInsert(snvo);
		if(insertCnt >0) {
		logger.info("insertCnt >>> : "+insertCnt);
			return "sfmnotice/sfmNoticeSelect";// 입력한 데이터들 전체조회로 가도록 
		}
		
		return "notice/sfmNoticeInsertForm";


	}
	//전체조회
	@RequestMapping(value= "sfmNoticeSelectAll", method= RequestMethod.GET)
	public String sfmNoticeSelectAll(SfmNoticeVO snvo,Model model) {
		logger.info("sfmNoticeSelectAll 함수진입 >>>" );
		
		
		List<SfmNoticeVO> listAll = sfmNoticeService.sfmNoticeSelectAll(snvo);
		int nCnt= listAll.size();
		logger.info("sfmNoticeSelectAll Cnt >>> : "+nCnt);
		if(nCnt>0) {
			logger.info("sfmNoticeSelectAll nCnt >>> : "+ nCnt);
			
			
			model.addAttribute("listAll", listAll);
			return "sfmnotice/sfmNoticeSelectAll";
		}
		
		
		return "notice/sfmNoticeInsertForm";
	}
	//수정버튼
	@RequestMapping(value= "sfmNoticeUpdate", method= RequestMethod.GET)
	public String sfmNoticeUpdate(HttpServletRequest req,SfmNoticeVO snvo,Model model) {
		String noticenum = req.getParameter("chkbox");
		snvo.setNoticenum(noticenum);
		
		List<SfmNoticeVO> a =  new ArrayList<SfmNoticeVO>();
		
		a = sfmNoticeService.sfmNoticeUpdate(snvo);
		model.addAttribute("a", a);
		
		return "notice/sfmNoticeUpdateForm";
	}
	//수정폼에서 수정 후  - 셀렉트올로 보내기 버튼
	@RequestMapping(value = "sfmNoticeUpdate2" ,method = RequestMethod.GET)
	public String sfmNoticeUpdate2(HttpServletRequest req ,Model model) {

			logger.info("컨트롤러- sfmNoticeUpdate2  >>> : " );
			
			
			SfmNoticeVO _snvo = null;
			_snvo = new SfmNoticeVO();
			//HttpSession session = req.getSession();
		    //String memnum = (String)session.getAttribute("memnum");
			
			String memnum = req.getParameter("memnum"); 
		    _snvo.setMemnum(memnum);
			
			logger.info("memnum >>" +memnum);
			_snvo.setNoticenum(req.getParameter("noticenum"));
			//ogger.info("noticenum >>> "+_snvo.getNoticenum());
			
			_snvo.setNoticecontent(req.getParameter("noticecontent"));
			logger.info("noticecontent >>> "+_snvo.getNoticecontent());
			_snvo.setNoticetitle(req.getParameter("noticetitle"));
			logger.info("getNoticetitle >>> "+_snvo.getNoticetitle());
			
			int insertCnt =sfmNoticeService.sfmNoticeUpdate2(_snvo);
			logger.info("insertCnt >>> : "+insertCnt);
			if(insertCnt >0) {
			logger.info("insertCnt >>> : "+insertCnt);
				return "notice/sfmNoticeUpdate2";// 입력한 데이터들 전체조회로 가도록 
			}
		return "notice/sfmNoticeUpdateForm";
	}
	//삭제
	@RequestMapping(value ="sfmNoticeDelete" , method = RequestMethod.GET)
	public String sfmNoticeDelete(HttpServletRequest req,SfmNoticeVO snvo,Model model) {
		
		String chkbox = req.getParameter("chkbox");
		snvo.setNoticenum(chkbox);
		
		int a = 0;
		
		a = sfmNoticeService.sfmNoticeDelete(snvo);
		if(a>0) {
			model.addAttribute("a", a);
		}
		return "notice/sfmNoticeDelete";
	}
}
