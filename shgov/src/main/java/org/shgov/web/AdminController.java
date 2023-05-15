package org.shgov.web;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.shgov.domain.Board;
import org.shgov.domain.File;
import org.shgov.domain.MappingFileBoard;
import org.shgov.domain.UserForm;
import org.shgov.service.AdminService;
import org.shgov.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.exception.FdlException;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource(name="AdminService")
	public AdminService service;
	
	@Resource(name="MemberService")
	public MemberService memservice;
	
	ObjectMapper mapper = new ObjectMapper();
	
	@GetMapping("/userList")
	public String userList(Model model) throws JsonProcessingException {
		model.addAttribute("list", mapper.writeValueAsString(memservice.selectAllUser()));
		return "admin/userList.tiles";
	}
	@GetMapping("/boardAdd")
	public String boardAdd() throws JsonProcessingException {
		return "admin/boardAdd.tiles";
	}
	@GetMapping("/noticeAdd")
	public String noticeAdd() throws JsonProcessingException {
		return "admin/noticeAdd.tiles";
	}
//	@GetMapping("/images")
//	public void images(Board bd, HttpServletRequest req, HttpServletResponse res) throws Exception {
//		service.fileDownload(bd, req, res);
//	}
	@GetMapping("/armBoard")
	public String armBoard() {
		return "board/armBoard.tiles";
	}
 //=======================================================================
	
	@PostMapping("/approveUser")
	@ResponseBody
	public ModelAndView approveUser(@RequestParam String userId) {
		ModelAndView mav = new ModelAndView("jsonView");
		service.approveUserRole(userId);
		int count = service.approveUser(userId);
		
		if(count != 0) {
			mav.addObject("result", "success");
		} else {
			mav.addObject("result", "fail");
		}
		return mav;
	}
	
	
	@PostMapping("/banUser")
	@ResponseBody
	public ModelAndView banUser(@RequestParam String userId) {
		ModelAndView mav = new ModelAndView("jsonView");
		service.banUserRole(userId);
		int count = service.banUser(userId);
		
		if(count != 0) {
			mav.addObject("result", "success");
		} else {
			mav.addObject("result", "fail");
		}
		return mav;
	}
	
	@PostMapping("/resetPassword")
	@ResponseBody
	public ModelAndView resetPassword(UserForm user) {
		ModelAndView mav = new ModelAndView("jsonView");
		int count = service.resetPassword(user);
		
		if(count != 0) {
			mav.addObject("result", "success");
		} else {
			mav.addObject("result", "fail");
		}
		return mav;
	}
	
	@PostMapping("/boardInsert")
	public String boardInsert(@ModelAttribute Board board, @RequestParam(value="fileName") MultipartFile fileName, HttpServletRequest request, HttpServletResponse response) throws FdlException {
				
		System.out.println(board);
		System.out.println(fileName);
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		File file = new File();
		MappingFileBoard mfb = new MappingFileBoard(); 
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot;
        String fileRoot = "/home/hosting_users/shgov/tomcat/webapps/ROOT/images/";
        file.setFilePath(fileRoot);

        
        String uploadFileName = fileName.getOriginalFilename();
        file.setFileName(uploadFileName);
        uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
        
        UUID uuid = UUID.randomUUID();
        uploadFileName = uuid.toString()+"_"+uploadFileName;
        file.setFileServerName(uploadFileName);
        
        java.io.File saveFile = new java.io.File(fileRoot, uploadFileName);
        
        service.boardInsert(board, file, mfb);
        
        try {
        	fileName.transferTo(saveFile);
        }catch (Exception e) {
        	System.out.println(e.getMessage());
        }
        
        return "redirect:/";
	}
	
//	@PostMapping("/boardInsert")
//	@ResponseBody
//	public ModelAndView boardInsert(@ModelAttribute Board board, @RequestParam(value="fileName") MultipartFile fileName, HttpServletRequest request, HttpServletResponse response) throws FdlException {
//		
//		System.out.println(board);
//		System.out.println(fileName);
//		
//		ModelAndView mav = new ModelAndView("jsonView");
//		
//		File file = new File();
//		MappingFileBoard mfb = new MappingFileBoard(); 
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot + "uploadImages/images/";
//		file.setFilePath(fileRoot);
//		
//		String uploadFileName = fileName.getOriginalFilename();
//		file.setFileName(uploadFileName);
//		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
//		
//		UUID uuid = UUID.randomUUID();
//		uploadFileName = uuid.toString()+"_"+uploadFileName;
//		file.setFileServerName(uploadFileName);
//		
//		java.io.File saveFile = new java.io.File(fileRoot, uploadFileName);
//		
//		try {
//			fileName.transferTo(saveFile);
//		}catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//		
//		int count = service.boardInsert(board, file, mfb);
//		
//		if(count == 0) {
//			mav.addObject("result","fail");
//		}else {
//			mav.addObject("result", "success");
//		}
//		
//		return mav;
//	}
	
	
	
	
}
