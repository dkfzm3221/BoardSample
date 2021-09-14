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
							<input type="button" onclick="deleteValue();" class="btn btn-default" value="회원강퇴">
							<button type="button" onclick="location.href='/sam/adminBoard'" class="btn btn-default">게시판관리</button>
						</div>
						<div class="col-sm-2"></div>
						<div class="col-sm-2">
							<select class="form-control" id="searchType" name="searchType">
								<option value="all">전체</option>
								<option value="w">아이디</option>
								<option value="c">이름</option>
							</select>
						</div>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="keyword" name="keyword" value="${pageMaker.cri.keyword }" placeholder="문자열을 입력해주세요.">
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
										<th style="width: 5%;"><input type="checkbox" id="allCheck" name="allCheck" /></th>

										<th style="width: 5%;">아이디</th>
										<th style="width: 5%;">이름</th>
										<th style="width: 10%;">핸드폰</th>
										<th style="width: 10%;">이메일</th>
										<th style="width: 5%;">강퇴</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="list" varStatus="status">
										<tr>
											<td>
												<input type="checkbox" name="RowCheck" value="${list.boardWriterIdx}" />
											</td>
											<td>${list.boardWriter }</td>
											<td>${list.boardWriterName }</td>
											<td>${list.boardWriterPhone }</td>
											<td>${list.boardWriterEmail }</td>
											<td>
												<button type="button" onclick="deleteValue();" class="btn btn-default btn-full">강퇴</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
							 <div class="row">
	                  <div class="col-sm-12 text-center">
	                     <ul class="pagination">
	                     	<li>
	                        	<a href="/sam/adminUser${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
	                        
	                        </li>
	                       <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                           <li id="page${idx}">
	                           		<a href="/sam/adminUser${pageMaker.makeQuery(idx)}">${idx}</a>
	                           </li>
	                        </c:forEach>      
	                        	<li>
	                        	   <a href="/sam/adminUser${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
	                            </li>
	                     </ul>
	                  </div>
	               </div> 
					</div>
				</div>
			</div>
		</div>
	</form>
	<div id="dropDownSelect1"></div>
	
	<script>
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for(var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	
	function deleteValue(){
		var url = "adminUserDelete";
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert("선택된 회원이 없습니다.");
		}
		else{
			var chk = confirm("정말 강퇴하시겠습니까?");
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success: function(jdata){
					if(jdata = 1){
						alert("삭제 성공");
						location.replace("/sam/adminUser")
					}
					else{
						alert("삭제 실패")
					}
				}
			});
		}
	}
	  

	
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
			window.location.href = "/sam/adminUser?page="+thisPage+"&perPageNum="+$perPageSel.val();
		})
}
	
 	function setSearchTypeSelect(){
		var $searchTypeSel = $('#searchType');
		var $keyword = $('#keyword');
		
		$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected", true);
		
		$('#searchButton').on('click', function(){
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
			var url = "/sam/adminUser?page=1"
					+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
					+ "&searchType=" + searchTypeVal
					+ "&keyword=" + encodeURIComponent(keywordVal);
					
					window.location.href = url;
		})
	} 



	</script>
</body>

</html>
