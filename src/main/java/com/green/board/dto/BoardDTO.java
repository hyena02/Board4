package com.green.board.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


//@Data   //Getter/Setter/toString/HashCode, equals,BoardDTO()

@Getter					// Getter
@Setter					// Setter
@ToString				// toString
@NoArgsConstructor		// 기본 생성자 
@AllArgsConstructor		// 모든 인자 생성
public class BoardDTO {
	
	private int    idx;
	private String menu_id;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private int    hit;
}
