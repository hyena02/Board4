package com.green.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.dto.BoardDTO;
import com.green.board.mapper.BoardMapper;
import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController { 
	
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private BoardMapper	boardMapper;

	@RequestMapping("/List")
	public ModelAndView list(MenuDTO menuDto) {
// 메뉴 전체 목록 조회- menus.jsp
		List<MenuDTO> menuList = menuMapper.getMenuList();
		log.info("menuList:" + menuList);
		
		
// 게시물 목록 조회 - list.jsp	
		List<BoardDTO>  boardList  =  boardMapper.getBoardList( menuDto );
		log.info("boardList:" +  boardList);
		
	// 넘어온 menu_id
		String  menu_id = menuDto.getMenu_id(); 
		MenuDTO menu = menuMapper.getMenu(menuDto); 
				
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("board/list");
		mv.addObject("menuList", menuList);
		mv.addObject("boardList",boardList);
		mv.addObject("menu_id",  menu_id);
		mv.addObject("menu", 	 menu);
		return mv;
	}
//// 게시물 삭제
//	@RequestMapping("/Delete")
//	public String delete(BoardDTO boardDto) {
//		boardMapper.deleteBoard(boardDto);
//		return "redirect:/Board/List";
//		
//	}
//	
	// /Board/View?idx=1
	@RequestMapping("/View")
	public ModelAndView view( BoardDTO boardDto) {
		// 메뉴 목록조회
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		//idx 글의 조회수를 1 증가
		boardMapper.incHit( boardDto);
		//idx 로 조회한 게시글
		BoardDTO board = boardMapper.getBoard(boardDto);
		System.out.println("board:" + board);
		
		//content 안에 있는 엔터 \n 를 <br> 변경 -> content
		board.setContent(board.getContent().replace("\n","<br>") );
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("board", board);
		return mv;
		
	}
	// /Board/WriteForm?menu_id=MENU01
	@RequestMapping("/WriteForm")
	public  ModelAndView   writeForm( BoardDTO boardDto  ) {
		//메뉴목록
		List<MenuDTO> menuList = menuMapper.getMenuList();
		System.out.println("/Board/WriteForm boardDto:" + boardDto );
		
		String  menu_id   = boardDto.getMenu_id();
	
		
		ModelAndView  mv      =  new ModelAndView();
		mv.setViewName("board/write");
		mv.addObject("menu_id",  menu_id );
		mv.addObject("menuList",  menuList );
		return  mv;
		
	}
	
	// /Board/Write?menu_id=MENU01&title=a&content=a&writer=a
	@RequestMapping("/Write")
	public  ModelAndView   write( BoardDTO boardDto ) {
		
		
		System.out.println("write boardDto:" + boardDto);
		//write boardDto:BoardDTO(idx=0, menu_id=MENU06, title=af, content=af, writer=af, regdate=null, hit=0)
		// db 저장
		boardMapper.insertBoard(boardDto);
		
		String  menu_id   =  boardDto.getMenu_id();
		
		// 페이지 이동
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id );
		return  mv;
	}
	
	@RequestMapping("/Delete")
	public ModelAndView delete(BoardDTO boardDto) {
		
		System.out.println("삭제 목록 : " + boardDto);
		
		boardMapper.deleteBoard(boardDto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List");
		return mv;
	}
	
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(BoardDTO boardDto) {
		System.out.println("넘어온 boardDto : " + boardDto);
		BoardDTO board = boardMapper.getBoard(boardDto);
		System.out.println("조회된 boardDto : " + board);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/update");
		mv.addObject("board", board);
		return mv;
	}
	
	@RequestMapping("/Update")
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		System.out.println("map:"+ map);
		boardMapper.updateBoard2(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List");
		return mv;
	}
}
