<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/common.css" rel="stylesheet" />
</head>
<body>
	<h2>ID 중복확인</h2>
	<form action="/Users" method="get">
		<input type="text" name="userid"  value="${param.userid}"/>
		<input type="submit" value="중복확인" />
		<div id="msg">
			${ msg }
		</div>
		<input type="button" value="사용하기" id="btnClose" />
	</form>
	
	<script>
// 새 창이 열릴때
		document.addEventListener("DOMContentLoaded",function(){
//페이지를 처음 호출했는가 체크
			if( '${first}' == 'true' ) {		//${sessionscope.first} => sessionscope 는 생략가능
								
			const thisUseridEl   = window.document.querySelector('[name=userid]')
			const parentUseridEl = window.opener.document.querySelector('[name="userid"]')
			thisUseridEl.value = parentUseridEl.value
			}
		})
// 사용하기 버튼을 클릭
		const btnCloseEl = document.querySelector('#btnClose');
		btnCloseEl.addEventListener('click', function() {
			
			const thisUseridEl   = window.document.querySelector('[name=userid]')
			const parentUseridEl = window.opener.document.querySelector('[name="userid"]')
			parentUseridEl.value = thisUseridEl.value
			window.close()
		})
	</script>
</body>
</html>