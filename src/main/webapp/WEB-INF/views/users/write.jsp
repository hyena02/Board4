<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<style>
	body {
		margin : 0;
		backgroun-color : #f5f7fa;
		font-family: inherit;
	}
	main {
		width : 900px;
		margin : 10px auto;
		padding : 5px;
		border : 1px solid black;
		border-radius: 10px;		
		box-shadow: 0 0 10px rgba(0,0,0,0.1);
		text-align: center;
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
	tr:first-child{
		background-color:gray;
		color:white;
		font-weight:bold;
	}
	tr:nth-of-type(2) td {	
		text-align : right;
		padding : 10px;
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
	input[name=userid] {
		width : 50%;
		float : left;
		margin-right:5px;
	}
	#dupCheck1,#dupCheck2{
		width : 16%;
		font-size:12px;

	}
	
	.red { 
		color:blue; 
		font-wheight : bold;
	}
	tr:last-child td {
		text-align: center;
		padding-top: 20px;
	}
</style>
</head>
<body>
	<main>
		<h2>유저 등록</h2>
		<form action="/Users/Write" method="post">
		  <table>
			<tr>
		      <td><span class = "red">*</span>유저 아이디</td>
		      <td>
		        <input type="text" name="userid"/>
		        <input type="button" id="dupCheck1" value="중복확인(새창)" />
		        <input type="button" id="dupCheck2" value="중복확인(Ajax)" />
		      </td>
		    <tr>
		      <td><span class = "red">*</span> 비밀번호</td>
		      <td>
		        <input type="password" name="passwd" id="passwd"/>
		      </td>
		    <tr>
		    <tr>
		      <td><span class = "red">*</span> 비밀번호 확인</td>
		      <td>
		        <input type="password" name="passwd2" />
		      </td>
		    <tr>
		      <td><span class = "red">*</span> 유저 이름</td>
		      <td>
		        <input type="text" name="username"  />
		      </td>
		    <tr>
		      <td><span class = "red">*</span> 유저 이메일</td>
		      <td>
		        <input type="email" name="email"  />
		      </td>
		    </tr>
		    <tr>
		      <td colspan="2">
		      	<input type="submit" value="추가" />
		      	<input type="button" value="목록" 
		      			onclick="location.href='/Muenus/List'"
		      	/>
		      </td>
		    </tr>
		  </table>
		</form>
	</main>
	
<!-- Javascript 코딩 : client validation -->
	<script>
	  var idDupChecked = false;
	
	  const formEl = document.querySelector('form');
	  const useridEl = document.querySelector('[name="userid"]');
	  const passwdEl = document.querySelector('#passwd');
	  const passwd2El = document.querySelector('#passwd2');
	  const usernameEl = document.querySelector('[name="username"]');
	
// 입력항목 체크
	  formEl.addEventListener('submit',function(e){
		  
//아이디값 체크
		  if(useridEl.value.trim()  == ''){
			  alert('아이디를 입력하세요');
			  useridEl.focus();
			  e.preventDefault() // event 취소
			  e.stopPropagation() // event 버블링 방지
		  }
		  
//아이디 중복확인여부 체크		
		  if( !idDupChecked ){
			  alert('아이디를 중복확인 하세요')
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
//비밀번호값 체크
		  if(passwdEl.value.trim() == ''){
			  alert('비밀번호를 입력하세요');
			  passwdEl.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
		  if(passwd2El.value.trim()  == ''){
			  alert('비밀번호를 한번 더 입력하세요');
			  passwd2El.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
		  if(passwdEl.value != passwd2El.value){
			  alert('비밀번호가 일치하지 않습니다');
			  passwd2El.focus();
			  e.preventDefault() 
			  e.stopPropagation()
			  return;
		  }
		  if(usernameEl.value.trim()  == ''){
			  alert('이름을 입력하세요');
			  usernameEl.focus();
			  e.preventDefault() 
			  e.stopPropagation() 
			  return;
		  }
	  } );
	</script>
	
	
	
	
	<script>	
// 아이디 중복확인1(새 창 열기)
		const btnDup1El = document.querySelector('#dupCheck1')
		btnDup1El.addEventListener('click', function(){
			//alert('ok1')
			let url = '/Users/DupCheckWindow';
			let target = 'dupcheck';								//창 하나만 열림
			let feauture = 'left=0, top=0,width=200,height=200';
			window.open(url ,target, feauture)
		})
	</script>
	<script>	
// 아이디 중복확인2(Ajax)
		const btnDup2El = document.querySelector('#dupCheck2')
		btnDup2El.addEventListener('click', function(){
			if(useridEl.value.trim() == ''){
				alert('아이디를 입력하세요')
				useridEl.focus()
				return ;
			}
			let url = '/Users/IdDupCheck2?userid=' + useridEl.value;
			fetch(url)
			  .then( data =>{ 
			  		console.log(data)
			  		if(data.userid !=null) {
			  			alert('사용불가')
			  			idDupChecked = false;
			  		}else {
			  			alert('사용가능')
			  			idDupChecked = true;
			  		}
			  });
		})
//userid 의 value가 바뀌면 idDupChecked = false;
		useridEl.addEventListener('change', function(){
			idDupChecked = false;
		})
		
		</script>
	
	
</body>
</html>