package com.lhj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lhj.model.BoardVO;
import com.lhj.model.Criteria;
import com.lhj.model.LoginVO;
import com.lhj.model.PageVO;
import com.lhj.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String boardListGet(BoardVO boardVO,Criteria cri,Model model,HttpServletRequest req) throws Exception{
		logger.info("boardListGet..");
		
		//List<BoardVO> list = boardService.boardList(); 
		PageVO pv = new PageVO(cri, boardService.boardCount(cri));
		
		model.addAttribute("list",boardService.boardListPage(cri));
		model.addAttribute("page",pv);
		
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info(req.getRequestURI().substring(req.getContextPath().length()));
		
		return "main";
	}
	
	@RequestMapping(value="register", method = RequestMethod.GET)
	public String registerGet(HttpServletRequest req) throws Exception{
		logger.info("registerGet..");
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info(req.getRequestURI().substring(req.getContextPath().length()));
		return "main";
	}
	
	@RequestMapping(value="register", method = RequestMethod.POST)
	public String registerPost(BoardVO board , RedirectAttributes rttr) throws Exception{
		logger.info("registerPost..");
		
		boardService.boardWrite(board);
		rttr.addFlashAttribute("msg","wsuccess");
		
		return "redirect:list";
	}
	
}
