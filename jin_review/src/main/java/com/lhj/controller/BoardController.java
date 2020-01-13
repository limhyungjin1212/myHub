package com.lhj.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lhj.model.BoardVO;
import com.lhj.service.BoardService;

@Controller
/* @RequestMapping("/board") */
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String boardListGet(BoardVO boardVO,Model model) throws Exception{
		logger.info("boardListGet..");
		
		List<BoardVO> list = boardService.boardList(); 
		
		model.addAttribute("list",list);
		return "index";
	}
	
	
	
}
