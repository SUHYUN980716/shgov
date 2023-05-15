package org.shgov.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shgov.domain.Board;
import org.shgov.service.AdminService;
import org.shgov.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class HomeController {
	
	ObjectMapper mapper = new ObjectMapper();
	
	@Resource(name="BoardService")
	public BoardService boardService;
	
	@Resource(name="AdminService")
	public AdminService service;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index(Model model) throws JsonProcessingException {
		model.addAttribute("list",mapper.writeValueAsString(boardService.selectList2()));
		model.addAttribute("item",mapper.writeValueAsString(boardService.selectList2Notice()));
		return "index.tiles";
	}
	@RequestMapping(value="/accessError", method=RequestMethod.GET)
	public String accessError() {
		return "accessError.tiles";
	}
	
	@GetMapping("/images")
	public void images(Board bd, HttpServletRequest req, HttpServletResponse res) throws Exception {
		service.fileDownload(bd, req, res);
	}
	
}
