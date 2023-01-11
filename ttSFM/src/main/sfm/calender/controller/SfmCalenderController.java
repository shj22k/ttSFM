package main.sfm.calender.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.sfm.calender.service.SfmCalenderService;
import main.sfm.calender.vo.SfmCalenderVO;

@Controller
public class SfmCalenderController {
	Logger logger = LogManager.getLogger(SfmCalenderController.class);

	@Autowired(required=false)
	private SfmCalenderService sfmCalenderService;
	
	@GetMapping("calendar")
	public String calendar() {
		logger.info("calendar 함수 진입 >>> : ");	
		return "calendar/calendar";
	}
	
	// 캘린더 입력
	@GetMapping("sfmCalenderInsert")
	public String sfmCalenderInsert(HttpServletRequest req, SfmCalenderVO cvo, Model model, HttpSession session) {
		logger.info("sfmCalenderInsert 진입 성공 >>> : ");
		
		// 세션 아이디값 
		String memid = (String)session.getAttribute("memid");
		
		cvo.setCalallDay(req.getParameter("cal_allDay"));	 // 하루종일
		cvo.setCaltitle(req.getParameter("cal_title"));	 // 일정명
		cvo.setCalstartdate(req.getParameter("cal_startdate")); // 시작날짜
		cvo.setCalenddate(req.getParameter("cal_enddate"));	 // 끝날짜
		cvo.setCalbackgroundColor(req.getParameter("cal_backgroundColor"));
		cvo.setCaltype(req.getParameter("cal_type"));		 // 구분
		cvo.setCaldescription(req.getParameter("cal_description"));// 설명
		cvo.setMemid(memid);
		logger.info("cvo.getMemid >>> : " + cvo.getMemid());
		logger.info("cvo.getCaltype >>> : " + cvo.getCaltype());
		
		int nCnt = sfmCalenderService.sfmCalenderInsert(cvo);
		try {
			if(nCnt > 0) {
				logger.info("sfmCommunityInsert nCnt >>> : " + nCnt);
				return "calendar/calendarData";
			}
		}catch(Exception e) {
			System.out.println("에러가 발생" + e);
		}
		
		return "calendar/calendarData";
	}
	
	@GetMapping("sfmCalenderSelectAll")
	public String sfmCalenderSelectAll(SfmCalenderVO cvo, Model model, HttpSession session) {
		logger.info("sfmCalenderSelectAll 진입 성공 >>> : ");

		// 세션 아이디값 
		String memid = (String)session.getAttribute("memid");
		logger.info("memid >>> : " + memid);
		cvo.setMemid(memid);
		logger.info("cvo.getMemid() >>> : " + cvo.getMemid());
		
		List<SfmCalenderVO> aList = sfmCalenderService.sfmCalenderSelectAll(cvo);
		JSONArray jsonCalendar = new JSONArray();
		
		for(int i = 0 ; i < aList.size();i++){
			SfmCalenderVO cvo_1 = aList.get(i);
			JSONObject jobj = new JSONObject();
			jobj.put("_id", cvo_1.getCalno());
			jobj.put("title", cvo_1.getCaltitle());
			jobj.put("description", cvo_1.getCaldescription());
			jobj.put("start", cvo_1.getCalstartdate());
			jobj.put("end", cvo_1.getCalenddate());
			jobj.put("type", cvo_1.getCaltype());
			jobj.put("username", cvo_1.getMemid());
			jobj.put("backgroundColor", cvo_1.getCalbackgroundColor());
			boolean bool = false;
			if("true".equals(cvo_1.getCalallDay())){
				bool = true;
			}
			
			jobj.put("allDay", bool);
			jsonCalendar.add(jobj);
		}
		model.addAttribute("jsonCalendar", jsonCalendar);
		
		return "calendar/calendarData";
	}


}
