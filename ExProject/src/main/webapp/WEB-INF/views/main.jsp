<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>ITKey 게시판</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico" />
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

<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
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
<form>
	<div class="limiter animsition">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form">
				<c:if test="${id ne null}">
					<h1>안녕하세요. ${id}님</h1>
					<a href="/sam/logout">로그아웃</a>
				</c:if>
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
						<c:if test="${id ne null }">
							<button type="button" onclick="location.href='/sam/write'" class="btn btn-default">
								<i class="fas fa-plus"></i> 새글 추가
							</button>
							<button type="button" class="btn btn-default" onclick="location.href='chat';">채팅하기</button>
								<button type="button" class="btn btn-default" onclick="location.href='modify';">정보수정</button>
						</c:if>
						<c:if test="${id eq null }">
							<button type="button" onclick="location.href='/sam/join'" class="btn btn-default">
								회원가입
							</button>
							<button type="button" onclick="location.href='/sam/login'" class="btn btn-default">
								로그인
							</button>
						</c:if>
						</div>
						<div class="col-sm-2"></div>
						<div class="col-sm-2">
							<select class="form-control" id="searchType" name="searchType">
								<option value="all">전체</option>
								<option value="w">작성자</option>
								<option value="c">글내용</option>
							</select>
						</div>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요">
						</div>
						<div class="col-sm-1 text-right">
							<button id="searchBtn" class="btn btn-default btn-full">
								<i class="fas fa-search"></i> 검색
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
								<table class="table table-hover">
		<thead>
			<tr>
				<th style="width:5%;">No.</th>
				<th style="width:15%;">작성자</th>
 				<th style="width: 5%;">공개</th>
				<th style="width:30%;">제목</th>
				<th style="width:45%;">내용</th>
				<th style="width:5%;">조회수</th>
			</tr>
		
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list" varStatus="status">
			<tr>
				<c:choose>
				<c:when test="${list.boardPublicFl eq 'N'}"> <!-- N 비공개 -->
					<td>${status.count }</td>
					<td>${list.boardWriter }</td>
					<td>
						<i class="fas fa-lock"></i>
					</td> 
					<c:if test="${id ne list.boardWriter}">
						<td style="color:black">비밀글 입니다. 작성자와 관리자만 볼 수있습니다.</td>
						<td style="color:black">비밀글 입니다. 작성자와 관리자만 볼 수있습니다.</td>
					</c:if>
					<c:if test="${id eq list.boardWriter or admin eq 'admin'}">
						<td><a href="/sam/detail?boardIdx=${list.boardIdx}">${list.boardTitle }</a></td>
						<td>${list.boardContents}</td>
					</c:if>
					<td>${list.boardViewCount }</td> 
				</c:when>
				<c:otherwise>
					<td>${status.count }</td>
					<td>${list.boardWriter }</td> 
					<c:if test="${list.boardPublicFl eq 'Y'}">
						<td>
							<i class="fas fa-lock-open"></i>
						</td>
					</c:if>
					<td><a href="/sam/detail?boardIdx=${list.boardIdx}">${list.boardTitle }</a></td>
					<td>${list.boardContents} </td>
					<td>${list.boardViewCount }</td>
				</c:otherwise>
				</c:choose>
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
                        	<a href="/sam/main${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
                        
                        </li>
                       <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                           <li id="page${idx}">
                           		<a href="/sam/main${pageMaker.makeQuery(idx)}">${idx}</a>
                           </li>
                        </c:forEach>      
                        	<li>
                        	   <a href="/sam/main${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
                            </li>
              
                     </ul>
                  </div>
               </div> 
				</div>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	</form>
	<script>
	$(function(){
		setPerPageNumSelect();
		setSearchTypeSelect();
		
		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if(canPrev !== 'true'){
			$('#page-prev').addClass('disabled');
		}
		
		//next 버튼 활성화, 비활성화 처리
		var canNext = '${pageMaker.next}';
		if(canNext !== 'true'){
			$('#page-next').addClass('disabled');
		}
		var thisPage = '${pageMaker.cri.page}';
		$('#page'+thisPage).addClass('active');
	})
	
	function setPerPageNumSelect(){
		var perPageNum = "${pageMaker.cri.perPageNum}";
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';
		$perPageSel.val(perPageNum).prop("selected",true);
		$perPageSel.on('change',function(){
			window.location.href = "/sam/main?page="+thisPage+"&perPageNum="+$perPageSel.val();
		})
}
	
 	function setSearchTypeSelect(){
		var $searchTypeSel = $('#searchType');
		var $keyword = $('#keyword');
		
		$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected", true);
		
		$('#searchBtn').on('click', function(){
			var searchTypeVal = $searchTypeSel.val();
			var keywordVal = $keyword.val();
			if(!searchTypeVal){
				alert("검색 조건을 선택하세요");
				$searchTypeSel.focus();
				return;
			}else if(!keywordVal || kewordVal < 2){
				alert("검색어는 2자 이상입니다.");
				$('#keyword').focus();
				return;
			}
			var url = "/sam/main?page=1"
					+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
					+ "&searchType=" + searchTypeVal
					+ "&keyword=" + encodeURIComponent(keywordVal);
					
					window.location.href = url;
		})
	} 
 	

	
	
	</script>
</body>

</html>