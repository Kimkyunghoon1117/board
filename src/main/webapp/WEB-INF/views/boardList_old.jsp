<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <style>
      table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
      }
      th, td {
        padding: 15px;
      }
    </style>
</head>
<body>
  <div class="wrapper">
    <header class="header">
      <a class="logo" href="#home">
        <img src="//localhost/test/img/portfolio.png">
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
      		<script>
      			let msg = "${msg}"
     			if(msg=="WRT_OK") alert("성공적으로 등록되었습니다.");
      			if(msg=="DEL_OK") alert("성공적으로 삭제되었습니다.");
      			if(msg=="DEL_ERR") alert("삭제에 실패했습니다.");
      		</script>
      		<button type="button" id="writeBtn" onclick="location.href='<c:url value="/board/write"/>'">글쓰기</button>
  			<table border="1">
  				<tr>
  					<th>번호</th>
  					<th>제목</th>
  					<th>이름</th>
  					<th>등록일</th>
  					<th>조회수</th>
  				</tr>
  				<c:forEach var="boardDto" items="${list}">
  				<tr>
  					<td>${boardDto.bno}</td>
  					<td><a href="<c:url value='/board/read?bno=${boardDto.bno}&page=${page}&pageSize=${pageSize}'/>">"${boardDto.title}</a></td>
  					<td>${boardDto.writer}</td>
  					<td>${boardDto.reg_date}</td>
  					<td>${boardDto.view_cnt}</td>
  				</tr>
  				</c:forEach>
  			
  			</table>
  			<br>
  			<div>
  				<c:if test="${ph.showPrev}">
  					<a href="<c:url value='/board/list?page=${ph.beginPage-1}&pageSize=${ph.sc.pageSize}'/>">&lt;</a>
  				</c:if>
  				<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage }">
  					<a href="<c:url value='/board/list?page=${i}&pageSize=${ph.sc.pageSize}'/>">${i}</a>
  				</c:forEach>
  				<c:if test="${ph.showNext}">
  					<a href="<c:url value='/board/list?page=${ph.endPage+1}&pageSize=${ph.sc.pageSize}'/>">&gt;</a>
  				</c:if>
  			</div>
      </main>
    
  </div>
  <footer class="footer">Footer</footer>
</body>
</html>