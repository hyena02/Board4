package com.green.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.user.dto.UserDTO;
import com.green.user.mapper.UserMapper;

@Controller
@RequestMapping("/Users")
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	
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
	public ModelAndView update(UserDTO userDto) {
		
		userMapper.updateUser(userDto);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
}
	
//아이디 중복확인
	@GetMapping("/IdDupCheck2")
	@ResponseBody   			// return 되는 글자는 jsp가 아니다
	// /Users/IdDupCheck2?userid=sky
	public UserDTO idDupCheck2(UserDTO userDto) {
		
		String  userid 	= userDto.getUserid();  					// 넘어온 userid
		UserDTO user 	= userMapper.getIdDupCheck(userDto);		// 조회한 userid
		if(user == null)
			user = new UserDTO();
		return user;

	}
	// /Users/DupCheckWindow
	@GetMapping("/DupCheckWindow")
	public ModelAndView dupCheckWindow() {
		
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/idcheck");
		mv.addObject("userid", "aaa");
		return mv;
	}
//중복확인
// /Users/DupCheck?userid=aaa
	@RequestMapping("/Dupcheck")
	public ModelAndView dupCheck( UserDTO userDto) {
		
		UserDTO user 	= userMapper.getUser(userDto);
		String	userid 	= user.getUserid(); 
		String msg 		= "<b class='red'> 사용할 수 없는 아이디 입니다</b>";
		if( user != null)
			msg = "<b class='green'>사용 가능한 아이디 입니다</b>";
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/idcheck");
		mv.addObject("msg", msg );
		mv.addObject("userid", userid );
		return mv;
	}
}