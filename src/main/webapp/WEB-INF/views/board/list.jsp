<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>

<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" />
<style>
body {
    margin: 0;
    background: #f5f7fa;
    font-family: inherit;
}


main {
    width: 900px;
    margin: 50px auto;
    padding: 30px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    text-align: center;
}
h2 {
    margin: 20px;
}
/* 메뉴 영역 */
.top {
    margin-bottom: 15px;
    text-align: right;
}

/* 링크 버튼 스타일 */
a {
    text-decoration: none;
    font-weight: bold;
    color: #333;
    padding: 6px 12px;
    border-radius: 6px;
    transition: 0.2s;
}

a:hover {
    background:gray;
    color: white;
}
table {
    width: 100%;
    border-collapse: collapse;
    overflow: hidden;
    border-radius: 10px;
}
tr:first-child {
    background: gray;
    color: white;
}
td {
    padding: 12px;
    text-align: center;
}
tr {
    border-bottom: 1px solid #ddd;
}


tr:nth-child(even):not(:first-child) {
    background-color: #fafafa;
}


tr:nth-of-type(2) td {
    text-align: right;
    background: #fff;
    border-bottom: 2px solid #eee;
}
</style>
</head>

<body>
	<main>
		<%@ include file="/WEB-INF/include/menus.jsp" %>
	  <h2> ${menu_name}  게시글 목록</h2>
	  <table id="list" class="table  table-hover">
	  	<tr>
	  	  <td> 번호 </td>
	  	  <td> 제목 </td>
	  	  <td> 글쓴이 </td>
	  	  <td> 날짜 </td>
	  	  <td> 조회수 </td>
	  	  <td> 삭제 </td>
	  	  <td> 수정 </td>
	  	</tr>
	  	<tr>
	  	  <td colspan="7" class="top">
	  	    |<a href="/Board/WriteForm?menu_id=${menu_id}">새 글 등록</a>| &nbsp;&nbsp;&nbsp;&nbsp;
	  	    |<a href="/">home</a>|
	  	  </td>
	  	</tr>
	  	
	    <c:forEach  var="board"  items="${ boardList }">
	    <tr>
	      <td> ${  board.idx      }  </td>    <!-- menu.getMenu_id() -->
	      <td class="title"> 
	        <a href ="/Board/View?idx=${board.idx}">
	        ${ board.title    }
	        </a>  
	      </td>
	      <td> ${ board.writer   }  </td>
	      <td> ${ board.regdate  }  </td>
	      <td> ${ board.hit      }  </td>
	      <td> <a href="/Board/Delete?idx=${board.idx}">삭제</a></td>
	      <td> <a href="/Board/UpdateForm?idx=${board.idx}">수정</a></td>
	    </tr>
	    </c:forEach>
	  </table>
	</main>
</body>
</html>