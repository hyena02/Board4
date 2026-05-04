<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	table {
		width : 100%;
	}
	td {
		padding : 5px 10px;
	}
	td:nth-of-type(1){
		background: gray;
		color : white;
		border : 1px solid white;
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
	<h2> 유저 수정하기</h2>
	<form action = "/Users/Update" method="post">
	  <table>
	    <tr>
	      <td><span class="red">*</span> 유저 아이디</td>
	      <td>
	        <input type="text" name="userid" value="${user.userid}" readonly/>
	      </td>
	    <tr>
	      <td><span class="red">*</span> 기존 비밀번호</td>
	      <td>
	        <input type="text" id="passwdold"/>
	      </td>
	    <tr>
	      <td><span class="red">*</span> 새 비밀번호</td>
	      <td>
	        <input type="text" id="passwd" />
	      </td>
	    <tr> 
	      <td><span class="red">*</span> 새 비밀번호 확인</td>
	      <td>
	        <input type="text" id="passwd2" />
	      </td>
	    </tr>
	    <tr>
	      <td><span class="red">*</span> 유저 이름</td>
	      <td>
	        <input type="text" name="username" value="${user.username}" />
	      </td>
	    <tr>
	      <td> 유저 이메일</td>
	      <td>
	        <input type="email" name="email" value="${user.email}" />
	      </td>
	    </tr>
	    <tr>
	      <td>point</td>
	      <td>
	        ${user.upoint}
	      </td>
	    </tr>
	    <tr>
	      <td>가입일</td>
	      <td>
	        ${user.regdate}
	      </td>
	    </tr>
	    <tr>
	      <td colspan="2">
	        <input type="submit" value="수정" />
	        <input type="button" value="완료" 
	        		onclick=" location.href='/Users/List'" 
	        />
	    </tr>
	  </table>
	</form>
  </main>
  <!-- Javascript 코딩 : client validation -->
	<script>
	  const formEL 		= document.querySelector('form');
	  const useridEL 	= document.querySelector('[name="userid"]');
	  const passwdoldEL = document.querySelector('#passwdold');
	  const passwdEL 	= document.querySelector('#passwd');
	  const passwd2EL 	= document.querySelector('#passwd2');
	  const usernameEL 	= document.querySelector('[name="username"]');
	  
	  formEL.addEventListener('submit',function(e){
		  
// 아이디값 체크
		  if(useridEL.value.trim()  == ''){
			  alert('아이디를 입력하세요');
			  useridEL.focus();
			  e.preventDefault() // event 취소
			  e.stopPropagation() // event 버블링 방지
			  return;
		  }
		  
// 1-1.기존 비밀번호 입력 체크
		  if(passwdoldEL.value.trim() == ''){
			  alert('기존 비밀번호를 입력하세요');
			  passwdoldEL.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
		  
		  
// 1-2.기존 비밀번호 == 조회된 비밀번호 user.passwd 체크		
		  if(passwdoldEL.value.trim() != '${user.passwd}'){
			  alert('비밀번호가 옳지 않습니다. 다시해봐라');
			  passwdoldEL.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
// 2-1.비밀번호 값 체크
		  if(passwdEL.value.trim() == ''){
			  alert('비밀번호를 입력하세요');
			  passwdEL.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
// 2-2. 비밀번호 확인 체크 
		  if(passwd2EL.value.trim()  == ''){
			  alert('비밀번호를 한번 더 입력하세요');
			  passwd2EL.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
// 2-3. 비밀번호 == 비밀번호 확인 체크
		  if(passwd2EL.value != passwd2EL.value){
			  alert('비밀번호가 일치하지 않습니다');
			  passwd2EL.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
// 이름 값 체크
		  if(usernameEL.value.trim()  == ''){
			  alert('이름을 입력하세요');
			  usernameEL.focus();
			  e.preventDefault() 
			  e.stopPropagation() 
			  return;
		  }
	  } );
	</script>
</body>
</html>