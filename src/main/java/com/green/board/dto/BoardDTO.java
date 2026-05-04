package com.green.board.dto;

public class BoardDTO {
	private int    idx;
	private String menu_id;
	private String title;
	private String writer;
	private String regdate;
	private int    hit;

	public BoardDTO(int idx, String menu_id, String title, String writer, String regdate, int hit) {
		super();
		this.idx = idx;
		this.menu_id = menu_id;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.hit = hit;
	}
//getter/setter : 필수- MyBatis ex)    #{idx} : getIdx(),SetIdx()로 작동
	public int getIdx() {return idx;}
	public String getMenu_id() {return menu_id;}
	public String getTitle() {return title;}
	public String getWriter() {return writer;}
	public String getRegdate() {return regdate;}
	public int getHit() {return hit;}
	public void setIdx(int idx) {this.idx = idx;}
	public void setMenu_id(String menu_id) {this.menu_id = menu_id;}
	public void setTitle(String title) {this.title = title;}
	public void setWriter(String writer) {this.writer = writer;}
	public void setRegdate(String regdate) {this.regdate = regdate;}
	public void setHit(int hit) {this.hit = hit;}
//ToString
	@Override
	public String toString() {
		return "BoardDTO [idx=" + idx + ", menu_id=" + menu_id + ", title=" + title + ", writer=" + writer
				+ ", regdate=" + regdate + ", hit=" + hit + "]";
	}






}

