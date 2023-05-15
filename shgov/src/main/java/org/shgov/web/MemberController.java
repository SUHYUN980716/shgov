package org.shgov.web;

import javax.annotation.Resource;

import org.shgov.domain.User;
import org.shgov.domain.UserForm;
import org.shgov.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.exception.FdlException;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	ObjectMapper mapper = new ObjectMapper();
	
	@Resource(name="MemberService")
	public MemberService service;
	
	
	//=============================================================
	@GetMapping("/register")
	public String register() {
		return "member/register.tiles";
	}
	
	@GetMapping("/login")
	public String login(String error, String logout, Model model) {
			if(error != null) {
			model.addAttribute("error", "로그인 에러입니다. 로그인 정보를 다시 확인하여 주십시요.");
			}
			if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
			}
		return "member/login.tiles";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "member/logout.tiles";
	}
	
	@GetMapping("/myPage")
	public String myPage(@RequestParam String userId, Model model) throws JsonProcessingException {
		model.addAttribute("list",mapper.writeValueAsString(service.read(userId)));
		return "member/myPage.tiles";
	}
	
	
	//==============================================================
	
	@RequestMapping(value="/registerPro", method=RequestMethod.POST)
	@ResponseBody
	public String registerPro(UserForm user) throws FdlException {
		service.register(user);
		return "redirect:/";
	}
	
	@RequestMapping(value="/myPagePro", method=RequestMethod.POST)
	@ResponseBody
	public String myPagePro(UserForm user) throws FdlException {
		service.updateUser(user);
		return "redirect:/";
	}
	
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView loginCheck(String userId) throws FdlException, JsonProcessingException {
		ModelAndView mav = new ModelAndView("jsonView");
		User user = service.read(userId);
		
		if(user.getUserApproved() == 0) {
			mav.addObject("result","notApproved");
		}
		if(user.getUserAvailable() == 1) {
			mav.addObject("result","banned");
		}
		
		return mav;
	}
	
	
}
