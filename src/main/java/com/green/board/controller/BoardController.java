package com.green.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.dto.BoardDTO;
@Controller
@RequestMapping
public class BoardController {
	@RequestMapping("List")
	public ModelAndView list() {
		
		List<BoardDTO> boardList;
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("boardlist",boardList);
		return mv;
		
		
	}
}
