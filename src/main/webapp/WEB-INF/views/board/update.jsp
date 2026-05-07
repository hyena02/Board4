<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="/css/common.css" rel="stylesheet" />
</head>
<style>
main {
	width  : 900px;
	margin : 50px auto;
	padding: 30px;
}
table {
	width : 100%;
	border-collapse : collapse;
	overflow:hidden;
	border-radius:10px;
}
 td {
    padding:5px 10px;
    text-align : center; 
 }
 tr > td:first-child {
 	background-color:gray;
 	color : white;
 }
 tr:last-child > td {
     background: #fafafa;
 
 }
	tr:last-child > td {
		background: white;
	}
	input[type="text"],input[type=email],input[type=password]{
		width : 100%;
	}
	input[type=submit],input[type=button] {
		width : 100px;
	}
</style>
<body>
  <main>
	<h2> 게시글 수정</h2>
	<form action = "/Board/Update" method="get">
	  <table>
	    <tr>
	      <td>제목</td>
	      <td>
	        <input type="text" name="title" value="${board.title}" />
	      </td>
	    <tr>
	      <td>내용</td>
	      <td>
	        <input type="text" name="content" value="${board.content}" />
	      </td>
	    <tr>
	      <td>작성자</td>
	      <td>
	        <input type="text" name="writer" value="${board.writer}" />
	      </td>
	    </tr>
	    <tr>
	      <td colspan="2">
	        <input type="submit" value="수정" />
	        <input type="button" value="완료" 
	        		onclick=" location.href='/Board/List"/>
	    </tr>
	  </table>
	</form>
  </main>
  
</body>
</html>