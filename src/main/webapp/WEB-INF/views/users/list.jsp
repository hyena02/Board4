<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">

<style>
	main {
		text-align: center;
		border : 1px solid black;
		padding : 5px;
		margin : 10px auto;
	}
	table,th,td {
		border : 1px solid black;
		border-collapse: collapse;
	}
	table{
		width : 100%;
	}
	td{
		padding : 5px;
		}
	tr:first-child{
		background-color: gray;
		color:white;
		td {
			border : 1px solid black;
		}
	}
	tr:nth-of-type(2) td {
		text-align: right;
		padding-right: 10px;
	}
	a:hover {
		text-decoration: none;
		color : red;
		font-weight: bold;
	}
</style>
</head>

<body>
	<main>
	  <h2> 유저 목록 ${msg}  </h2>
	  <table>
	  	<tr>
	  	  <td> USERID </td>
	  	  <td> USERPW </td>
	  	  <td> USERNAME </td>
	  	  <td> EMAIL </td>
	  	  <td> UPOINT </td>
	  	  <td> REGDATE </td>
	  	  <td> 수정 </td>
	  	  <td> 삭제 </td>
	  	</tr>
	  	<tr>
	  	  <td colspan="8">
	  	    [<a href="/Users/WriteForm">유저 등록</a>] &nbsp;&nbsp;&nbsp;&nbsp;
	  	    [<a href="/">home</a>]
	  	  </td>
	  	</tr>
	  	
	  	<c:forEach var="user" items="${userList}"> 
		  	<tr>
		  	  <td> ${user.userid}</td>
		  	  <td> ${user.passwd}</td>
		  	  <td> ${user.username}</td>
		  	  <td> ${user.email}</td>
		  	  <td> ${user.upoint}</td>
		  	  <td> ${user.regdate}</td>
		  	  <td><a href="/Users/Delete?userid=${user.userid}">삭제</a></td>
		  	  <td><a href="/Users/UpdateForm?userid=${user.userid}">수정</a></td>
		  	</tr><!-- session변수로 넘기면 ?물음표 안써도댐 ..은 뭔말인데,,-->
		  	<!--  a tag 는 폼테그에 추가된다 -->
	  	</c:forEach>
	  </table>
	</main>
</body>
</html>