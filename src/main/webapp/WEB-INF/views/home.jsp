<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin : 0;
		background-color : #f5f7fa;
		font-family: inherit;
	}

	main {
		width: 300px;
		margin: 100px auto;
		padding: 30px;
		background-color: white;
		border : 1px solid black;
		border-radius: 10px;
		box-shadow : 0 0 10px rgba(0,0,0,0.1);
		text-align: center;
	}

	h2 {
		margin-bottom: 30px;
		color: black;
		font-weight : bold;
	}

	a {
		display: block;
		text-decoration: none;
		margin: 10px 0;
		padding: 10px;
		border-radius: 8px;
		background: gray;
		color: white;
		font-weight: bold;
		transition: 1;
	}
	a:hover {
		background: purple;
	}

</style>
</head>

<body>

	<main>
		<h2>HOME</h2>
		<a href="/test"> 테스트 </a>
		<div><a href="/Menus/WriteForm"> 새 메뉴 추가 </a></div>
		<div><a href="/Menus/WriteForm2"> 새 메뉴2 추가 </a></div>
		<div>&nbsp;</div>
		
		<div><a href="/Menus/List"> 메뉴 목록 </a></div>	
		<div><a href="/Users/List"> 사용자 목록 </a></div>	
		<div>&nbsp;</div>
		
		<div><a href="/Users/WriteForm"> 사용자 추가 </a></div>	
		<div><a href="/Users/IdDupCheck2?userid=aaa" target="_blank"> 아이디 중복 테스트 </a></div>	
		<div>&nbsp;</div>
		
		<div><a href="/Board/List?menu_id=MENU01"> 게시글 목록 </a></div>	
		<div><a href="/Board/WriteForm?menu_id=MENU01"> 게시글 작성 </a></div>	
	</main>
</body>
</html>