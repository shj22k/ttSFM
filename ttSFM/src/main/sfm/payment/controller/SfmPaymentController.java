package main.sfm.payment.controller;

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
import main.sfm.match.vo.SfmMatchVO;
import main.sfm.payment.service.SfmPaymentService;
import main.sfm.payment.vo.SfmPaymentVO;

@Controller
public class SfmPaymentController {
	Logger logger = LogManager.getLogger(SfmPaymentController.class);

	@Autowired(required=false)
	private SfmPaymentService sfmPaymentService;
	@Autowired(required=false)
	private SfmChabunService sfmChabunService;
	
	@GetMapping("sfmPaymentForm")
	public String sfmPaymentForm() {
		logger.info("SfmPaymentController sfmPaymentForm 진입");
		return "payment/sfmPaymentForm";
	}
	
	@GetMapping("sfmPaymentInsert")
	public String sfmPaymentInsert(HttpServletRequest req, SfmPaymentVO pvo) {
		logger.info("SfmPaymentController sfmPaymentInsert 진입");

		// 채번로직
		String paynum = ChabunUtil.getSFMpaymentChabun("N", sfmChabunService.getSFMpaymentChabun().getPaymentnum());
		logger.info("matchnum() >>> : " + sfmChabunService.getSFMpaymentChabun().getPaymentnum());
		
		HttpSession session = req.getSession();
		String matchnum = (String)session.getAttribute("matchnum");
		logger.info("matchnum >>> : " + matchnum);
		session.setAttribute("paymentnum", paynum);

		pvo.setPaymentnum(paynum);
		pvo.setPaymentname(req.getParameter("paymentname"));
		pvo.setMatchnum(matchnum);
		logger.info("pvo.getPaymentnum() >>> : " + pvo.getPaymentnum());
		logger.info("pvo.getPaymentname() >>> : " + pvo.getPaymentname());
		logger.info("pvo.getMatchnum() >>> :" + pvo.getMatchnum());
		
		int insertCnt = sfmPaymentService.sfmPaymentInsert(pvo);
		try {
			if(insertCnt > 0) {
				logger.info("sfmPaymentInsert insertCnt >>> : " + insertCnt);
				return "payment/sfmPaymentForm1";
			}
		}catch(Exception e) {
			System.out.println("에러가 발생" + e);
		}
		return "";
	}
	
	@GetMapping("sfmPaymentSelect")
	public String sfmPaymentSelect(HttpServletRequest req, SfmPaymentVO pvo, Model model) {
		logger.info("SfmPaymentController sfmPaymentSelect 진입");

		List<SfmPaymentVO> listAll = sfmPaymentService.sfmPaymentSelect(pvo);
		int nCnt = listAll.size();

		try {
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				
				model.addAttribute("listAll", listAll);
				return "payment/sfmPaymentSelect";
			}
		}catch(Exception e) { System.out.println("에러가 발생" + e); }
		return "";
	}
	
	@GetMapping("sfmPaymentComplete")
	public String sfmPaymentComplete(HttpServletRequest req, SfmPaymentVO pvo, Model model, HttpSession ss) {
		logger.info("SfmPaymentController sfmPaymentComplete 진입");
		
		ss = req.getSession();
		String matchnum = (String)ss.getAttribute("matchnum");
		String paymentnum = (String)ss.getAttribute("paymentnum");
		logger.info("paymentnum >> "+ paymentnum);
	 	logger.info("matchnum >> "+ matchnum);
	 	
	 	pvo.setMatchnum(matchnum);
	 	pvo.setPaymentnum(paymentnum);
		logger.info("pvo.getMatchnum() >> "+ pvo.getMatchnum());
	 	logger.info("pvo.getPaymentnum() >> "+ pvo.getPaymentnum());

		List<SfmPaymentVO> listCom = sfmPaymentService.sfmPaymentComplete(pvo);
		int nCnt = listCom.size();
		
		try {
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				model.addAttribute("listCom", listCom);
				return "payment/sfmPaymentComplete";
			}
		}catch(Exception e) { System.out.println("에러가 발생" + e); }
		return "";
	}

}
