<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page import="java.net.URLDecoder" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/screen.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	 </head>
<body>
    <div class="wrapper">
        <header class="header">
            <a class="logo" href="#home">
                <img src="/test/img/portfolio.png">
              </a>
              <nav>
                <ul class="nav-items">
                  <li><a href="<c:url value='/'/>">Home</a></li>
                  <li><a href="<c:url value='/login/login'/>">Login</a></li>
                  <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
                </ul>
              </nav>
        </header>
        <aside>
            <ul>
              <li><a href="<c:url value='/board/list'/>">Board</a></li>
              <li><a href="#picture">Picture</a></li>
              <li><a href="#video">Video</a></li>
            </ul>
        </aside>
        <main class="main">
		   <!-- form action="<c:url value="/register/save"/>" method="POST" onsubmit="return formCheck(this)"-->
		   <c:url value='/register/add' var="formUrl" />
		   <form:form id="register" action="${formUrl}" modelAttribute="user">
			    <div class="title">Register</div>
			    <div id="msg" class="msg"><form:errors path="id"/></div>  
			    <label for="">아이디</label>
			    <input class="input-field" type="text" name="id" placeholder="8~12자리의 영대소문자와 숫자 조합">
			    <label for="">비밀번호</label>
			    <input class="input-field" type="text" name="pwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
			    <label for="">이름</label>
			    <input class="input-field" type="text" name="name" placeholder="홍길동">
			    <label for="">이메일</label>
			    <input class="input-field" type="text" name="email" placeholder="example@fastcampus.co.kr"> 
			    <label for="">생일</label>
			    <input class="input-field" type="text" name="birth" placeholder="2020-12-31">
			    <div class="sns-chk">
			        <label><input type="checkbox" name="sns" value="facebook"/>페이스북</label>
			        <label><input type="checkbox" name="sns" value="kakaotalk"/>카카오톡</label>
			        <label><input type="checkbox" name="sns" value="instagram"/>인스타그램</label>
			    </div>
			    <button>회원 가입</button>
			    <script>
			       function formCheck(frm) {
			            let msg ='';
			            if(frm.id.value.length<3) {
			                setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
			                return false;
			            }
			           return true;
			       }
			       function setMessage(msg, element){
			            document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
			            if(element) {
			                element.select();
			            }
			       }
			   </script>
		   </form:form> 
        </main>
      </div>
      <footer class="footer">Footer</footer>
</body>
</html>