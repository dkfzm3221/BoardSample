<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>ITKey 관리자 게시판</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.origin.min.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/table.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/fontawesome-free-5.8.2-web/css/all.min.css">

<!-- <script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script> -->
<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<script src="resources/vendor/bootstrap/js/popper.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/vendor/select2/select2.min.js"></script>
<script src="resources/vendor/daterangepicker/moment.min.js"></script>
<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<script src="resources/js/main.js"></script>

</head>

<body>
	
	<div class="limiter animsition">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form">
					<h1>안녕하세요. 관리자님</h1>
						<a href="/sam/logout">로그아웃</a>
					<div class="row panel-row">
						<div class="col-sm-3">
							<div class="overview-div">
								<h5 class="overview-title">총 게시글 수</h5>
								<h1 class="overview-content">${pageNum}</h1>
								<i class="far fa-file-alt"></i>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="overview-div">
								<h5 class="overview-title">총 가입자 수</h5>
								<h1 class="overview-content">${totalUser}</h1>
								<i class="fas fa-users"></i>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="overview-div">
								<h5 class="overview-title">오늘 게시글 수</h5>
								<h1 class="overview-content">${todayCount}</h1>
								<i class="fas fa-file-alt"></i>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="overview-div">
								<h5 class="overview-title">오늘 가입자 수</h5>
								<h1 class="overview-content">${todayUser}</h1>
								<i class="fas fa-user-circle"></i>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<button type="button" class="btn btn-default">선택삭제</button>
							<button type="button" onclick="location.href='/sam/adminUser'" class="btn btn-default">회원관리</button>
						</div>
						<div class="col-sm-2"></div>
						<div class="col-sm-2">
							<select class="form-control" id="">
								<option>전체</option>
								<option>작성자</option>
								<option>글내용</option>
							</select>
						</div>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="" placeholder="문자열을 입력해주세요.">
						</div>
						<div class="col-sm-1 text-right">
							<button type="button" class="btn btn-default btn-full">
								<i class="fas fa-search"></i> 검색
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 5%;"><input type="checkbox" id="allChk" onclick="allChk(this);" /></th>
										<th style="width: 7%;">순번</th>
										<th style="width: 9%;">작성자</th>
										<th style="width: 5%;">공개</th>
										<th>제목</th>
										<th style="width: 10%;">작성일자</th>
										<th style="width: 10%;">삭제</th>

									</tr>
								</thead>
								<tbody>
								<c:forEach items="${list }" var="list" varStatus="status">
									<tr>
										<td>
											<input type="checkbox" name="RowCheck" value="${list.boardWriter}"/>
										</td>
										<td>${status.count }</td>
										<td>${list.boardWriter }</td>
										<c:if test="${list.boardPublicFl eq 'Y'}">
											<td>
												<i class="fas fa-lock-open"></i>
											</td>
										</c:if>
										<c:if test="${list.boardPublicFl eq 'N'}">
											<td>
												<i class="fas fa-lock"></i>
											</td>
										</c:if>
										<td><a href="/sam/detail?boardIdx=${list.boardIdx}">${list.boardTitle }</a></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.boardWriteDate}"/></td>
										<td>
											<button type="submit" class="btn btn-default btn-full">삭제</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 페이징처리  -->
		 			 <div class="row">
	                  <div class="col-sm-12 text-center">
	                     <ul class="pagination">
	                     	<li>
	                        	<a href="/sam/adminBoard${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
	                        
	                        </li>
	                       <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                           <li id="page${idx}">
	                           		<a href="/sam/adminBoard${pageMaker.makeQuery(idx)}">${idx}</a>
	                           </li>
	                        </c:forEach>      
	                        	<li>
	                        	   <a href="/sam/adminBoard${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
	                            </li>
	                     </ul>
	                  </div>
	               </div> 
				</div>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<script type="text/javascript">
	//체크박스 전체선택
	  function allChk(obj){
	      var chkObj = document.getElementsByName("RowCheck");
	      var rowCnt = chkObj.length - 1;
	      var check = obj.checked;
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true;
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	           if(chkObj[i].type == "checkbox"){
	               chkObj[i].checked = false;
	           }
	          }
	      }
	  } 
	  
	
	
/* 	
 	  function adminDelete(){
		  var url = "adminDelete";
		  var valueArr = new Array();
		  var list = $("input[name='RowCheck']");
		  for(var i=0; i<list.length; i++){
			  valueArr.push(list[i].value);
		  }
	  }
	  if(valueArr.length == 0){
		  alert("글을 선택해 주세요");
	  }else{
		  var chk = confirm("정말 삭제하시겠습니까?")
		  $.ajax({
			  url : url,
			  type : 'POST',
			  traditional : true,
			  data : {
				  valueArr : valueArr
			  },
			  success: function(jdata){
				  if(jdata = 1){
					  alert("삭제 완료");
					  location.replace("adminBoard")
				  }else{
					  alert("삭제 실패");
				  }
			  }
		  })
		  
	  }
	   */
	  

	  
		
	</script>
	

	
</body>

</html>
