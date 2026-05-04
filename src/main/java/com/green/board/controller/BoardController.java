package com.green.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.dto.BoardDTO;
import com.green.board.mapper.BoardMapper;
import com.green.menus.dto.MenuDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping
public class BoardController {
	@Autowired
	private BoardMapper	boardMapper;
	
	@RequestMapping("/List")
	public ModelAndView list(MenuDTO menuDto) {
		
		List<BoardDTO> boardList = boardMapper.getBoardList(menuDto);
		log.warn("boardList:" +  boardList);
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("board/list");
		mv.addObject("boardlist",boardList);
		return mv;
		
		
	}
}
