package main.sfm.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SfmChatController {

	@GetMapping("sfmChat")
	public String sfmChat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "chat/sfmChat";
	}
	
	
}
