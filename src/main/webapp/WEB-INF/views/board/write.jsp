<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet" />

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
   
  input[type="text"], input[type=number], input[type=password]  {
     width : 100%;
  }
  input[type=submit], input[type=button] {
     width : 100px;
  }
  input[name=userid] {
     width : 65%;
  }
  
</style>
<body> 
  <main>
    <h1>새 글 쓰기</h1>
    <form  action="/Board/Write" method="post">
     <input type="hidden" name="menu_id" value="${ menu_id }" />
     <table>
      <tr>
        <td><span class="red">*</span> 제 목</td>
        <td>
          <input type="text"     name="title"   />
        </td>
      </tr>
      <tr>
        <td>내 용</td>
        <td><textarea name="content"></textarea></td>        
      </tr>
      <tr>
        <td><span class="red">*</span> 작 성 자</td>
        <td><input type="text" name="writer" /></td>        
      </tr>    
      <tr>
        <td colspan="2">
          <input type="submit"  value="추가" />
          <input type="button"  value="목록" 
            onclick="location.href='/Board/List'"
          />        
        </td>
      </tr>
     </table>    
    </form>
  
  </main>
  
  <!-- Javascript 코딩 : client validation -->
  <script>
  
  </script>
  
  
  
  
</body>
</html>    














