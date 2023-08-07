<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <img src="/shop/img/portfolio.png">
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
                <form id="login" action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">
                    <h3 id="title">Login</h3>
                    <div id="msg">
                    <c:if test="${not empty param.msg}">
                    <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>            
                    </c:if>        
                    </div>
                    <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디 입력" autofocus>
                    <input type="password" name="pwd" placeholder="비밀번호">
                    <input type="hidden" name="toURL" value=${param.toURL}>
                    <button>로그인</button>
                    <div>
                        <label><input type="checkbox" name="rememberId" value="true" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
                        <a href="">비밀번호 찾기</a> |
                        <a href="">회원가입</a>
                    </div>
                    <script>
                        function formCheck(frm) {
                            let msg ='';
                
                            if(frm.id.value.length==0) {
                                setMessage('id를 입력해주세요.', frm.id);
                                return false;
                            }
                
                            if(frm.pwd.value.length==0) {
                                setMessage('password를 입력해주세요.', frm.pwd);
                                return false;
                            }
                            return true;
                        }
                
                        function setMessage(msg, element){
                            document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
                
                            if(element) {
                                element.select();
                            }
                        }
                    </script>
                </form>
        </main> 
      </div>
      <footer class="footer">Footer</footer>
</body>
</html>