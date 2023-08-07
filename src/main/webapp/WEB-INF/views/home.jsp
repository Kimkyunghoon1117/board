<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<c:set var="loginOutLink" value="${sessionScope.id==null?'/login/login':'/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null?'Login':'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/screen.css'/>">
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
          <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
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
      	home
      </main>
    
  </div>
  <footer class="footer">Footer</footer>
</body>
</html>