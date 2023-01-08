package main.sfm.event.controller;

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
import main.sfm.common.CommonUtils;
import main.sfm.common.FileUploadUtil;
import main.sfm.common.chabun.service.SfmChabunService;
import main.sfm.event.service.SfmEventService;
import main.sfm.event.vo.SfmEventVO;
import main.sfm.notice.vo.SfmNoticeVO;


@Controller
public class SfmEventController {
	
	Logger logger = LogManager.getLogger(SfmEventController.class);
	
	//컨트롤러에서 SfmNotice 서비스 연결
	@Autowired(required =false)
	private SfmEventService sfmEventService;
	
	@Autowired(required=false) // 채번 의존성 주입
	private SfmChabunService sfmChabunService;
	
	//입력폼
	@RequestMapping(value="sfmEventInsertForm",method=RequestMethod.GET)
	public String sfmEventInsertForm() {
		
		logger.info("sfmEventInsertForm함수 진입");
		
		return "event/sfmEventInsertForm";
	}
	//입력
	@RequestMapping(value="sfmEventInsert", method=RequestMethod.POST)
	public String sfmEventInsert(HttpServletRequest req,SfmEventVO sevo) {
		
		String eventnum = ChabunUtil.getSFMeventChabun("D", sfmChabunService.getSFMeventChabun().getEventnum());
		logger.info("채번으로 생성된 eventnum >>> : " + sfmChabunService.getSFMeventChabun().getEventnum());
		
		FileUploadUtil fu = new FileUploadUtil( CommonUtils.SFM_IMG_UPLOAD_EVENT_PATH
											,CommonUtils.SFM_IMG_FILE_SIZE
											,CommonUtils.SFM_EN_CODE);

		boolean bool = fu.imgfileUpload(req);
		logger.info("EventInsert bool >>> : " + bool);
		
		HttpSession session = req.getSession();
	    String memnum = (String)session.getAttribute("memnum");
		
	 
	    
	    
		sevo.setEventnum(eventnum);
		logger.info("eventnum >>> "+ eventnum);
		sevo.setEventtitle(fu.getParameter("eventtitle"));
		logger.info("eventtile >>> "+fu.getParameter("eventtitle") );
		sevo.setEvent(fu.getParameter("event"));
		logger.info("event >>> "+ fu.getParameter("event"));
		sevo.setEventcontent(fu.getParameter("eventcontent"));
		logger.info("eventcontent >>> "+ fu.getParameter("eventcontent"));
		sevo.setEventphoto(fu.getFileName("eventphoto"));
		sevo.setMemnum(memnum);
		logger.info("memnum >>> "+ memnum);
		sevo.setEnddate(fu.getParameter("enddate"));
		logger.info("enddate >>> "+ fu.getParameter("enddate"));
		
		int insertCnt =sfmEventService.sfmEventInsert(sevo);
		logger.info("insertCnt >>> : "+insertCnt);
		if(insertCnt >0) {
		logger.info("insertCnt >>> : "+insertCnt);
			return "event/sfmEventSelect";// 입력한 데이터들 전체조회로 가도록 
		}
		
		return "event/sfmEventInsertForm";
	}
	//전체조회
	@RequestMapping(value= "sfmEventSelectAll", method= RequestMethod.GET)
	public String sfmEventSelectAll(HttpServletRequest req,SfmEventVO sevo, Model model) {
		logger.info("sfmEventSelectAll >>> : ");
		
		List<SfmEventVO> listAll = sfmEventService.sfmEventSelectAll(sevo);
		
		
		int nCnt= listAll.size();
		logger.info("sfmEventSelectAll Cnt >>> : "+nCnt);
		if(nCnt>0) {
			logger.info("sfmEventSelectAll nCnt >>> : "+ nCnt);
			
			
			model.addAttribute("listAll", listAll);
			return "event/sfmEventSelectAll";
		}
		
		
		return "event/sfmEventInsertForm";
	}
	//사용자 - 전체조회
		@RequestMapping(value= "sfmEventSelectAllUser", method= RequestMethod.GET)
		public String sfmEventSelectAllUser(HttpServletRequest req,SfmEventVO sevo, Model model) {
			logger.info("sfmEventSelectAll >>> : ");
			
			List<SfmEventVO> listAll = sfmEventService.sfmEventSelectAll(sevo);
			
			
			int nCnt= listAll.size();
			logger.info("sfmEventSelectAllUser Cnt >>> : "+nCnt);
			if(nCnt>0) {
				logger.info("sfmEventSelectAllUser nCnt >>> : "+ nCnt);
				
				
				model.addAttribute("listAll", listAll);
				return "eventuser/sfmEventSelectAllUser";
			}
			
			
			return "";
		}
	
	//수정버튼
	@RequestMapping(value= "sfmEventUpdate", method= RequestMethod.GET)
	public String sfmEventUpdate(HttpServletRequest req,SfmEventVO sevo,Model model) {
		
		String eventnum = req.getParameter("chkbox");
		sevo.setEventnum(eventnum);
		
//		HttpSession session = req.getSession();
//	    String memnum = (String)session.getAttribute("memnum");
		
		List<SfmEventVO> a =  new ArrayList<SfmEventVO>();
		
		a = sfmEventService.sfmEventUpdate(sevo);
		model.addAttribute("a", a);
		return "event/sfmEventUpdateForm";

		
	}
	@RequestMapping(value= "sfmEventUpdate2", method= RequestMethod.POST)
	public String sfmEventUpdate2(HttpServletRequest req,Model model) {
		FileUploadUtil fu = new FileUploadUtil( CommonUtils.SFM_IMG_UPLOAD_EVENT_PATH
												,CommonUtils.SFM_IMG_FILE_SIZE
												,CommonUtils.SFM_EN_CODE);
		
		
		HttpSession session = req.getSession();
	    String memnum = (String)session.getAttribute("memnum");
		
		boolean bool = fu.imgfileUpload(req);
		logger.info("sfmEventUpdate2 bool >>> : " + bool);
		
		SfmEventVO _sevo = null;
		_sevo = new SfmEventVO();
		_sevo.setEventnum(fu.getParameter("eventnum"));
		logger.info("eventnum >>> "+ fu.getParameter("eventnum"));
		_sevo.setEventtitle(fu.getParameter("eventtitle"));
		logger.info("eventtile >>> "+fu.getParameter("eventtitle") );
		_sevo.setEvent(fu.getParameter("event"));
		logger.info("event >>> "+ _sevo.getEvent());
		_sevo.setEventcontent(fu.getParameter("eventcontent"));
		logger.info("eventcontent >>> "+ fu.getParameter("eventcontent"));
		_sevo.setEventphoto(fu.getFileName("eventphoto"));
		_sevo.setMemnum(memnum);
		logger.info("memnum >>> "+ memnum);
		_sevo.setEnddate(fu.getParameter("enddate"));
		logger.info("enddate >>> "+ fu.getParameter("enddate"));
		
		int insertCnt =sfmEventService.sfmEventUpdate2(_sevo);
		logger.info("insertCnt >>> : "+insertCnt);
		if(insertCnt >0) {
		logger.info("insertCnt >>> : "+insertCnt);
			return "event/sfmEventSelect";// 입력한 데이터들 전체조회로 가도록 
		}
		
		return "event/sfmEventUpdateForm";

		
	}
	//조건조회
	@RequestMapping(value= "sfmEventSelectCon", method= RequestMethod.GET)
	public String sfmEventSelectCon(HttpServletRequest req,Model model,SfmEventVO sevo) {
		
		
		logger.info("sfmEventSelectCon >>> : ");
		
		List<SfmEventVO> listAll_1 = sfmEventService.sfmEventSelectCon(sevo);
		int nCnt= listAll_1.size();
		logger.info("sfmEventSelectCon Cnt >>> : "+nCnt);
		if(nCnt>0) {
			logger.info("sfmEventSelectCon nCnt >>> : "+ nCnt);
			
			
			model.addAttribute("listAll_1", listAll_1);
			return "event/sfmEventSelectCon";
		}
		return "event/sfmEventSelectAll";
	}
	//조건조회-사용자
		@RequestMapping(value= "sfmEventSelectUser", method= RequestMethod.GET)
		public String sfmEventSelectUser(HttpServletRequest req,Model model,SfmEventVO sevo) {
			
			
			logger.info("sfmEventSelectUser >>> : ");
			
			List<SfmEventVO> listAll_1 = sfmEventService.sfmEventSelectUser(sevo);
			int nCnt= listAll_1.size();
			logger.info("sfmEventSelectUser Cnt >>> : "+nCnt);
			if(nCnt>0) {
				logger.info("sfmEventSelectUser nCnt sfmEventSelectUser>>> : "+ nCnt);
				
				
				model.addAttribute("listAll_1", listAll_1);
				return "eventuser/sfmEventSelectUser";
			}
			return "";
		}
	//삭제
	@RequestMapping(value ="sfmEventDelete" , method = RequestMethod.GET)
	public String sfmEventDelete(HttpServletRequest req, SfmEventVO sevo,Model model) {
		
		String chkbox = req.getParameter("chkbox");
		sevo.setEventnum(chkbox);
		
		int a = 0;
		
		a = sfmEventService.sfmEventDelete(sevo);
		if(a>0) {
			model.addAttribute("a", a);
		}
		return "event/sfmEventDelete";
	}


}
