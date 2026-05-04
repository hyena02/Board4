package com.green.user.mapper;


import com.green.user.dto.UserDTO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	void insertUser(UserDTO userDTO);
	
	List<UserDTO> getUserList();

	void deleteUser(UserDTO userDTO); 

	void updateUser(UserDTO userDTO);

	UserDTO getUser(UserDTO userDto);

	UserDTO getIdDupCheck(String uid);

	UserDTO getIdDupCheck(UserDTO userDto); 
	
}
