package com.green.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.board.dto.BoardDTO;
import com.green.menus.dto.MenuDTO;

@Mapper
public interface BoardMapper {

	List<BoardDTO> getBoardList(MenuDTO menuDto);

	BoardDTO getBoard(BoardDTO boardDto);

	void incHit(BoardDTO boardDto);

	void insertBoard(BoardDTO boardDto);

	void deleteBoard(BoardDTO boardDto);

	void updateBoard2(Map<String, Object> map);




	

	
	
}
