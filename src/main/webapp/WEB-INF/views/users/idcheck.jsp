<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>ID 중복확인</h2>
	<form action="/Users" method="get">
		<input type="text" name="userid"  value="{param.userid}"/>
		<input type="submit" value="중복확인" />
		<div id="msg">
			${ msg }
		</div>
		<input type="button" value="사용하기" id="btnClose" />
	</form>
	
	<script>
// 새 창이 열릴때
		document.addEventListener("DOMContentLoaded",function(){
			//const thisUserid   = window.document.querySelector('[name=userid]').value
			//const parentUserid = window.opener.document.querySelector('[name="userid"]')
			//thisUseridEl.value = parentUseridEl.value
		})
// 사용하기 버튼을 클릭
		const btnCloseEl = document.querySelector('#btnClose');
		btnCloseEl.addEventListener('click', function() {
			
			const thisUserid   = window.document.querySelector('[name=userid]').value
			const parentUserid = window.opener.document.querySelector('[name="userid"]')
			parentUseridEl.value = thisUseridEl.value
			window.close()
		})
	</script>
</body>
</html>