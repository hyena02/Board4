package com.green.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.Board4Application;
import com.green.controller.HomeController;
import com.green.user.dto.UserDTO;
import com.green.user.mapper.UserMapper;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class UserController {
    private final HomeController homeController;

    private final Board4Application boardApplication;
	@Autowired
	private UserMapper userMapper;
	
	UserController(Board4Application boardApplication, HomeController homeController){
		this.boardApplication = boardApplication;
		this.homeController = homeController;
	}
	
//작성폼 /Users/WrtieFrom()
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/write");
		mv.addObject("msg","ㅇㅇ");
		
		return mv;
	}
//작성  // /Users/Write?userid=&passwd=&username=&email=
	@RequestMapping("/Write")
	public ModelAndView write(UserDTO userDto) {
		System.out.println("UserController write() userDto:" + userDto);
		
		// 넘어온 data 로 db 에 저장 
		userMapper.insertUser(userDto);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		
		return mv;
	}
	
//유저목록조회   /Users/List
	@RequestMapping("/List")
	public ModelAndView list() {
		
		// db 에서 사용자 목록을 조회 -> model 에 담아서 넘겨줌 ->getUserList
		List<UserDTO>userList = userMapper.getUserList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/list");
		mv.addObject("userList",userList);
		
		
		return mv;		
	}
//삭제
	@RequestMapping("/Delete")
	public ModelAndView delete(UserDTO userDto) {
		// 넘겨받은 자료를 출력
		System.out.println("userDto2:" + userDto);
		
		// db 의 자료를 삭제
		userMapper.deleteUser(userDto);
		
		// 목록으로 이동
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
	}
	


//수정폼
	//http://localhost:8080/Users/UpdateForm?userid=???
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(UserDTO userDto) {
		
		// 넘어온 userDto 정보
		System.out.println("넘어온 userDto : " + userDto);
		
		// 수정을 위해 db 에서 조회한 정보
		UserDTO user = userMapper.getUser(userDto);
		System.out.println("조회된 userDto:  " + user);
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/update");
		mv.addObject("user", user);
		return mv;
	}
	
//수정
	@RequestMapping("/Update")
// Controller 에서 Map 으로 인자를 받을 때는 반드시 @RequestParam 을 사용해야한다
	public ModelAndView update( @RequestParam Map<String, Object> map ) {
		System.out.println("map:"+ map);
		userMapper.updateUser2(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;

	}
	
/*
//수정
	public ModelAndView update(UserDTO userDto,String oldpw) {
		
		userMapper.updateUser(userDto, oldpw);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
}
*/
	
//아이디 중복확인
	@GetMapping("/IdDupCheck2")
	@ResponseBody   			// return 되는 글자는 jsp가 아니다
	// /Users/IdDupCheck2?userid=sky
	public UserDTO idDupCheck2(UserDTO userDto) {
		
		
		UserDTO user 	= userMapper.getIdDupCheck(userDto);		// 조회한 userid
		if(user == null)
			user = new UserDTO();
		return user;

	}
	// /Users/DupCheckWindow?first=true
	@GetMapping("/DupCheckWindow")
	public ModelAndView dupCheckWindow(Boolean first, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		//?first=true 활용방법
/*		
		if(first)
			mv.addObject("first",first);
*/
		session.setAttribute("first", "true"); 
		mv.setViewName("users/idcheck");
		return mv;
	}
	
	
//중복확인
// /Users/DupCheck?userid=aaa
	@RequestMapping("/Dupcheck")
	public ModelAndView dupCheck( UserDTO userDto, HttpSession session) {
		
		session.setAttribute("first","");
		UserDTO user 	= userMapper.getUser(userDto);
		 
		String msg 		= "<b class='red'> 사용할 수 없는 아이디 입니다</b>";
		if( user != null)
			msg = "<b class='green'>사용 가능한 아이디 입니다</b>";
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/idcheck");
		mv.addObject("msg", msg );
		
		return mv;
	}
}