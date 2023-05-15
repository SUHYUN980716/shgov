package org.shgov.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shgov.domain.Board;
import org.shgov.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/board")
public class BoardController {
	ObjectMapper mapper = new ObjectMapper();
	
	@Resource(name="BoardService")
	public BoardService service;
	
	@GetMapping("/boardList")
	public String boardList(Board board, Model model) throws JsonProcessingException {
		board.setTotalCnt(service.CountSelectList());
		model.addAttribute("list",mapper.writeValueAsString(service.selectList(board)));
		model.addAttribute("search",mapper.writeValueAsString(board));
		return "board/boardList.tiles";
	}
	@GetMapping("/boardDetail")
	public String boardDetail(@RequestParam String boardNum, Model model) throws JsonProcessingException {
		model.addAttribute("list",mapper.writeValueAsString(service.selectDetail(boardNum)));
		return "board/boardDetail.tiles";
	}
	@GetMapping("/boardEdit")
	public String boardEdit(@RequestParam String boardNum, Model model) throws JsonProcessingException {
		model.addAttribute("list",mapper.writeValueAsString(service.selectDetail(boardNum)));
		return "board/boardEdit.tiles";
	}
	@GetMapping("/noticeList")
	public String noticeList(Board board, Model model) throws JsonProcessingException {
		board.setTotalCnt(service.CountSelectListNotice());
		model.addAttribute("list",mapper.writeValueAsString(service.selectListNotice(board)));
		model.addAttribute("search",mapper.writeValueAsString(board));
		return "board/noticeList.tiles";
	}
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam String boardNum, Model model) throws JsonProcessingException {
		model.addAttribute("list",mapper.writeValueAsString(service.selectDetail(boardNum)));
		return "board/noticeDetail.tiles";
	}
	@GetMapping("/deletePost")
	public String deletePost(@RequestParam String boardNum) throws JsonProcessingException {
		service.deletePost(boardNum);
		return "redirect:/board/boardList";
	}
	
	//===================================================================================================
	
	@PostMapping("/boardEditPro")
	public String boardEditPro(Board board) {
		service.updatePost(board);
		return "redirect:/board/boardDetail?boardNum="+board.getBoardNum();
	}
	
	@RequestMapping(value="/paging", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView pagingAjax(@RequestBody Board bd, HttpServletRequest req, HttpServletResponse res) throws Exception {
		bd.setTotalCnt(service.CountSelectList());
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("list", mapper.writeValueAsString(service.selectList(bd)));
		mav.addObject("search", mapper.writeValueAsString(bd));
		return mav;
	}
	@RequestMapping(value="/pagingNotice", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView pagingNoticeAjax(@RequestBody Board bd, HttpServletRequest req, HttpServletResponse res) throws Exception {
		bd.setTotalCnt(service.CountSelectListNotice());
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("list", mapper.writeValueAsString(service.selectListNotice(bd)));
		mav.addObject("search", mapper.writeValueAsString(bd));
		return mav;
	}
}
