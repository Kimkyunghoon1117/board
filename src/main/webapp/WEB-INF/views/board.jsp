<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">  
  <link rel="stylesheet" href="<c:url value='/css/screen.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/cmt.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }
    .container {
      width : 50%;
      margin : auto;
    }
    .writing-header {
      position: relative;
      margin: 20px 0 0 0;
      padding-bottom: 10px;
      border-bottom: 1px solid #323232;
    }
    input {
      width: 100%;
      height: 35px;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      padding: 8px;
      background: #f8f8f8;
      outline-color: #e6e6e6;
    }
    textarea {
      width: 100%;
      background: #f8f8f8;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      resize: none;
      padding: 8px;
      outline-color: #e6e6e6;
    }
    .frm {
      width:100%;
    }
    .btn {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* Remove borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
    }
    .btn:hover {
      text-decoration: underline;
    }
  </style>
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
      <script>
	  let msg = "${msg}";
	  if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
	  if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
	</script>
		<div class="container">
  <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
  <form id="form" class="frm" action="" method="post">
    <input type="hidden" name="bno" value="${boardDto.bno}">

    <input name="title" type="text" value="${boardDto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${boardDto.content}</textarea><br>
	<div>
    <c:if test="${mode eq 'new'}">
      <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
    </c:if>
    <c:if test="${boardDto.writer eq loginId}">
      <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
    </c:if>
    <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
    </div>
  </form>

<div id="comment">
   	<div id="commentList">	
    </div>
    <c:if test="${mode ne 'new'}">
	    <div id="comment-writebox">
	            <div class="commenter commenter-writebox">${id}</div>
	            <div class="comment-writebox-content">
	                <textarea name="" id="" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
	            </div>
	            <div id="comment-writebox-bottom">
	                <div class="register-box">
	                    <a href="#" class="btn" id="btn-write-comment">등록</a>
	                </div>
	            </div>
	    </div>
    </c:if>
    <div id="reply-writebox">
        <div class="commenter commenter-writebox">${id}</div>
        <div class="reply-writebox-content">
            <textarea name="" id="" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
        </div>
        <div id="reply-writebox-bottom">
            <div class="register-box">
                <a href="#" class="btn" id="btn-write-reply">등록</a>
                <a href="#" class="btn" id="btn-cancel-reply">취소</a> 
            </div>
        </div>
    </div>
    <div id="modalWin" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>
            <h2> | 댓글 수정</h2>
            <div id="modify-writebox">
                <div class="commenter commenter-writebox"></div>
                <div class="modify-writebox-content">
                    <textarea name="" id="" cols="30" rows="5" placeholder="댓글을 남겨보세요"></textarea>
                </div>
                <div id="modify-writebox-bottom">
                    <div class="register-box">
                        <a href="#" class="btn" id="btn-write-modify">등록</a>
                    </div>
                </div>
            </div>
            </p>
        </div>
    	</div>
    </div>
</div>
      </main>
    
  </div>
  <footer class="footer">Footer</footer>
<script>
let bno = $("input[name=bno]").attr("value");
let currentPage = 0;
let pCommenter;
let showList = function(bno, page){
	currentPage=page;
	//console.log(currentPage);
	$.ajax({
        type:'GET',       // 요청 메서드
        url: '/shop/comments?bno='+bno+'&page='+page,  // 요청 URI
        //headers : { "content-type": "application/json"}, // 요청 헤더
        success : function(result){
        	//if(result!="")
            	$("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
        },
        error   : function(){ alert("showList error") } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
}
let read = function(cno){
	$.ajax({
        type:'GET',       // 요청 메서드
        url: '/shop/comments/'+cno,  // 요청 URI
        async:false,
        //headers : { "content-type": "application/json"}, // 요청 헤더
        //data : JSON.stringify({cno:cno}),
        success : function(result){
        	let dto = result;
        	pCommenter = dto.commenter;    // 서버로부터 응답이 도착하면 호출될 함수
        	
        },
        error   : function(){ alert("read error") } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
}
let toHtml = function(result){
	let comments = result.list;
	let cPh = result.cPh;
	let tmp = "<ul class='comment-items'>";
	if(result!=""){
		comments.forEach(function(comment){
	    	tmp+='<li class="comment-item"' 
	    		if(comment.cno!=comment.pcno)
	        		tmp+= 'style="background-color:#E0E0E1; padding-left:36px"'
	    	tmp+=' data-cno='+comment.cno
	    	tmp+=' data-pcno='+comment.pcno
	    	tmp+=' data-bno='+comment.bno+'>'
	    	tmp+='<span class="comment-img"><i class="fa fa-user-circle" aria-hidden="true"></i></span>'
	    	tmp+='<div class="comment-area"><div class="commenter">' + comment.commenter + '</div>'
	    	tmp+='<div class="comment-content">'
	    		if(comment.cno!=comment.pcno){
	    			// let pCommenter = $("div.commenter", "li[data-cno=35]").text();
	    			read(comment.pcno);
	    			tmp+= '<span style=color:#ff6f00>['+pCommenter+'님] </span>'
	    			
	    		}
	    	tmp+= comment.comment + '</div>'
	    	tmp+='<div class="comment-bottom">'
	    	tmp+='<span class="up_date">'+ dateToString(comment.up_date) + '</span>' 
	    	tmp+='<a href="#" class="btn-write"  data-cno='+comment.cno+' data-bno='+comment.bno+' data-pcno='+comment.pcno+'>답글쓰기</a>'
	    	console.log(comment.commenter);
	    	console.log("${loginId}");
	    	if( comment.commenter== "${loginId}"){
	    		tmp+='<a href="#" class="btn-modify"  data-cno='+comment.cno+' data-bno='+comment.bno+' data-pcno='+comment.pcno+'>수정</a>'
		    	tmp+='<a href="#" class="btn-delete"  data-cno='+comment.cno+' data-bno='+comment.bno+' data-pcno='+comment.pcno+'>삭제</a>'	
	    	}
	    	
	    	tmp+='</div></div></li>'
	    })
	} 
    	tmp+='</ul>'
    	
    	tmp+='<br><div class="paging-container"><div class="paging">'
			
/*     		console.log(${cTotalCnt});
     		console.log(${cPh.beginPage});
     		console.log(cPh.totalCnt); */
     		
     		
    		if(result=="")
          		tmp+='<div> 댓글이 없습니다. </div>'
          	else{
        		if(cPh.showPrev){
        			//tmp+='<a class="page" href="<c:url value="/comment/read${cPh.sc.getQueryString(cPh.beginPage-1)}"/>">&lt;</a>'
        			//${cPh.sc.page} = ${cPh.beginPage-1};
        			tmp+='<a class=page href="javascript:showList(bno,'+(cPh.beginPage-1)+');"><i class="fa fa-angle-left"></i></a>'
        			//tmp+='<a class=page><i class="fa fa-angle-left"></i></a>'
        		}
        		for(let i=cPh.beginPage; i<=cPh.endPage; i++){
        			tmp+='<a class="page '+(i==cPh.sc.page? "paging-active" : "")+ '" href="javascript:showList(bno,'+i+');">'+i+'</a>'	
        		}
       			if(cPh.showNext){
        			//tmp+='<a class="page" href="<c:url value="/comment/read${cPh.sc.getQueryString(cPh.endPage+1)}"/>">&gt;</a>'
       				tmp+='<a class=page href="javascript:showList(bno,'+(cPh.endPage+1)+');"><i class="fa fa-angle-right"></i></a>'
        		}
        	}
          	tmp+= '</div></div>'
          		//console.log(currentPage);
    return tmp;
}
let addZero = function(value){
    return value > 9 ? value : "0"+value;
}

let dateToString = function(ms) {
    let date = new Date(ms);

    let yyyy = date.getFullYear();
    let mm = addZero(date.getMonth() + 1);
    let dd = addZero(date.getDate());

    let HH = addZero(date.getHours());
    let MM = addZero(date.getMinutes());
    let ss = addZero(date.getSeconds());          

    return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;            
}
$(document).ready(function(){
	showList(bno,currentPage);
	/*- COMMENT ------------------------------------------*/
	$("#commentList").on("click", ".btn-write", function(e){ //대댓글
        let target = e.target;
        let cno = target.getAttribute("data-cno")
        let bno = target.getAttribute("data-bno")

        let repForm = $("#reply-writebox");
        repForm.appendTo($("li[data-cno="+cno+"]"));
        repForm.css("display", "block");
        repForm.attr("data-pcno", cno);
        repForm.attr("data-bno",  bno);
        //console.log($(this).offset().top);
        $('html, body').stop().animate({scrollTop: $(this).offset().top}, 500);
    });
	$("#commentList").on("click", ".btn-delete", function(e){ //댓글삭제
		if(!confirm("정말로 삭제하시겠습니까?")) return;
		let target = e.target;
		let cno = target.getAttribute("data-cno");
        let bno = target.getAttribute("data-bno");
       
   		$.ajax({
            type:'DELETE',       // 요청 메서드
            url: '/shop/comments/'+cno+'?bno='+bno,  // 요청 URI
            //headers : { "content-type": "application/json"}, // 요청 헤더
            success : function(result){
                alert(result)  
                showList(bno, currentPage);
            },
            error   : function(){ alert("delte error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    });
   	$("#commentList").on("click", ".btn-modify", function(e){ //댓글수정
        let target = e.target;
        let cno = target.getAttribute("data-cno");
        let bno = target.getAttribute("data-bno");
        let pcno = target.getAttribute("data-pcno");
        let li = $("li[data-cno="+cno+"]");
        let commenter = $(".commenter", li).first().text();
        let comment = $(".comment-content", li).first().text();

        $("#modalWin .commenter").text(commenter);
        $("#modalWin textarea").text(comment);
        $("#btn-write-modify").attr("data-cno", cno);
        $("#btn-write-modify").attr("data-pcno", pcno);
        $("#btn-write-modify").attr("data-bno", bno);

        // 팝업창을 열고 내용을 보여준다.
        $("#modalWin").css("display","block");
    });
   	//btn-write-reply
   	$("#btn-write-reply").click(function(){ // 대댓글 등록
        // 1. 내용을 서버로 전송
   		let comment = $(".reply-writebox-content > textarea").val();
   		let pcno = $("#reply-writebox").attr("data-pcno");
   		$(".reply-writebox-content > textarea").val('');
	    if(comment.trim()==''){
	    	alert("댓글을입력해주세요");
	    	$(".reply-writebox-content > textarea").show().focus()
	    	$('html, body').stop().animate({scrollTop: $(this).offset().top}, 500);
	    	return;
	    }
    	
	    $.ajax({
            type:'POST',       // 요청 메서드
            url: '/shop/comments?bno='+bno,  // 요청 URI
            headers : { "content-type": "application/json"}, // 요청 헤더
            data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),
            success : function(result){
            	alert(result)
                showList(bno,currentPage);
            },
            error   : function(){ alert("insert2 error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
	    $("#reply-writebox").css("display","none");
        $("#reply-writebox").appendTo("body");
    });
   	$("#btn-write-comment").click(function(){ // 댓글 등록
        // 1. 내용을 서버로 전송
   		let comment = $(".comment-writebox-content > textarea").val();
   		$(".comment-writebox-content > textarea").val('');
	    if(comment.trim()==''){
	    	alert("댓글을입력해주세요");
	    	$(".comment-writebox-content > textarea").show().focus()
	    	$('html, body').stop().animate({scrollTop: $(this).offset().top}, 500);
	    	return;
	    }
    	
	    $.ajax({
            type:'POST',       // 요청 메서드
            url: '/shop/comments?bno='+bno,  // 요청 URI
            headers : { "content-type": "application/json"}, // 요청 헤더
            data : JSON.stringify({bno:bno, comment:comment}),
            success : function(result){
            	alert(result)
                showList(bno,currentPage);
            },
            error   : function(){ alert("insert error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    });
   	$("#btn-write-modify").click(function(){ // 수정->등록
        // 1. 변경된 내용을 서버로 전송
   		let comment = $(".modify-writebox-content > textarea").val();
    	let cno = $(this).attr("data-cno");
	    if(comment.trim()==''){
	    	alert("댓글을입력해주세요");
	    	$(".modify-writebox-content > textarea").show().focus()
	    	return;
	    }
    	
    	$.ajax({
            type:'PATCH',       // 요청 메서드
            url: '/shop/comments/'+cno,  // 요청 URI
            headers : { "content-type": "application/json"}, // 요청 헤더
            data : JSON.stringify({cno:cno, comment:comment}),
            success : function(result){
            	alert(result)
                showList(bno, currentPage);
            },
            error   : function(){ alert("comment modify error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
        // 2. 모달 창을 닫는다. 
        $(".close").trigger("click");
    });
   	$(".close").click(function(){
        $("#modalWin").css("display","none");
    });
   	$("#btn-cancel-reply").click(function(e){
        $("#reply-writebox").css("display", "none");
    });
	/*- BOARD ------------------------------------------*/
 	$('#listBtn').on("click",function(){
		//location.href="<c:url value='/board/list'/>?page=${ph.sc.page}&pageSize=${ph.sc.pageSize}";
 		location.href="<c:url value='/board/list'/>${ph.sc.queryString}";
	});
	$('#modifyBtn').on("click",function(){
		let form = $('#form');
		let isReadOnly = $("input[name=title]").attr('readonly');
		
		if(isReadOnly=='readonly'){
			$("input[name=title]").attr('readonly',false);
			$("textarea").attr('readonly',false);
			$("#modifyBtn").html("등록");
			$("h2").html("게시물 수정");
			return;
		}
		
		form.attr("action", "<c:url value='/board/modify'/>");
		form.attr("method", "post");
		form.submit();
	});
	$("#writeNewBtn").on("click", function(){
      location.href="<c:url value='/board/write'/>";
    });
	$('#writeBtn').on("click",function(){
		let form = $('#form');
		form.attr("action", "<c:url value='/board/write'/>");
		form.attr("method", "post");
		form.submit();
	});
	$('#removeBtn').on("click",function(){
		if(!confirm("정말로 삭제하시겠습니까?")) return;
		let form = $('#form');
		form.attr("action", "<c:url value='/board/remove'/>?page=${ph.sc.page}&pageSize=${ph.sc.pageSize}");
		form.attr("method", "post");
		form.submit();
	});
	
});
</script>
</body>
</html>