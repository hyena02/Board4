package com.green.menus.mapper;

import java.util.List;
import com.green.menus.dto.MenuDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MenuMapper {

	List<MenuDTO> getMenuList();

	void insertMenu(MenuDTO menuDTO);

	void deleteMenu(MenuDTO menuDTO);

	MenuDTO getMenu(MenuDTO menuDTO);

	void updateMenu(MenuDTO menuDTO);

	void insertMenu2(MenuDTO menuDTO); 
	
}




