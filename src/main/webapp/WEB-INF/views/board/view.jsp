<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet"/>
<style>

	main {
		width : 900px;
	}

	td {
		padding : 5px 10px;
	}
	td:first-child {
		background-color:gray;
	}
	tr:nth-of-type(2) td {	
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
		background-color:gray;
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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
	<main>
		<%@include file="/WEB-INF/include/menus.jsp" %>
		<h2>게시글 내용 보기</h2>
		<table>
			<tr>
				<td>글 번호</td>
				<td>${board.idx}</td>
				<td>조회수</td>
				<td>${board.hit}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.writer}</td>
				<td>작성일</td>
				<td>${board.regdate}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${board.title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">${board.content}</td>
			</tr>
			<tr>
				<td colspan="4">
          <a href="/Board/WriteForm?menu_id=${board.menu_id}" class="btn btn-primary">새글쓰기</a>
          <a href="/Board/UpdateForm?idx=${board.idx}&menu_id=${board.menu_id}" class="btn btn-warning">수정</a>
          <a href="/Board/Delete?idx=${board.idx}&menu_id=${board.menu_id}" class="btn btn-danger">삭제</a>
          <a href="/Board/List?menu_id=${board.menu_id}" class="btn btn-info">목록</a>
          <a href="/" class="btn btn-success">Home</a>
				</td>
			</tr>
		</table>
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
			//let url = '/Users/DupCheckWindow';						
			let url = '/Users/DupCheckWindow?first=true';			//session 활용방식				
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
			  .then(response => response.json() )
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