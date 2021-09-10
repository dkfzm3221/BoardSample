<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="kr">

<head>
<title>ITKey 글상세</title>
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
					<h4>
						<i class="fa fa-paper-plane" style="color: #b224ef;"></i> 글 상세보기
					</h4>
					<div class="row">
						<div class="col-sm-2 col-header">
							<div class="well well-sm">
								<i class="fas fa-chevron-up"></i> 이전글
							</div>
						</div>
						<div class="col-sm-8 col-mid">
							<div class="well well-sm">
								<button type="button" class="btn btn-link" onclick="location.href='/sam/detail?boardIdx=${pagePre.boardIdx}';">${pagePre.boardTitle}</button>
							</div>
						</div>
						<div class="col-sm-2 col-footer">
							<div class="well well-sm"><fmt:formatDate pattern="yyyy-MM-dd" value="${pagePre.boardWriteDate}"/></div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>제목</th>
										<td>${list.boardTitle}</td>
										<th>조회수</th>
										<td>${list.boardViewCount}</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${list.boardWriter}</td>
										<th>작성일자</th>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.boardWriteDate}"/></td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="detail-content">${list.boardContents}</div>
										</td>
									</tr>
									<tr>
										<th>첨부파일</th>
											<td colspan="3">
												${fileName}
											</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 col-header">
							<div class="well well-sm">
								<i class="fas fa-chevron-down"></i> 다음글
							</div>
						</div>
						<div class="col-sm-8 col-mid">
							<div class="well well-sm">
								<button type="button" class="btn btn-link" onclick="location.href='/sam/detail?boardIdx=${pageNext.boardIdx}';">${pageNext.boardTitle}</button>
							</div>
						</div>
						<div class="col-sm-2 col-footer">
							<div class="well well-sm"><fmt:formatDate pattern="yyyy-MM-dd" value="${pageNext.boardWriteDate}"/></div>
						</div>
					</div>
					<div class="row">
					<c:if test="${adminId eq 'admin' && id eq null}">
						<div class="col-sm-2">
							<button type="button" class="btn btn-default btn-full" onclick="location.href='/sam/adminBoard';">목록</button>
						</div>
					</c:if>
						<div class="col-sm-2">
							<button type="button" class="btn btn-default btn-full" onclick="location.href='/sam/main';">목록</button>
						<div class="col-sm-6"></div>
						<c:if test="${id eq list.boardWriter}">
							<div class="col-sm-2">
								<button type="button" class="btn btn-default btn-full" onclick="location.href='/sam/update?boardIdx=${list.boardIdx}';">수정</button>
							</div>
						</c:if>
						<c:if test="${id eq list.boardWriter}">
						<div class="col-sm-2">
							<button type="button" class="btn btn-default btn-full" onclick="deleteChk()">삭제</button>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<div id="dropDownSelect1"></div>
</form>
<script>
	function deleteChk(){
		var chk = confirm("현재 글을 삭제 하시겠습니까?(삭제후 복원이 불가능합니다.)")
		if(chk){
			location.href='/sam/delete?boardIdx=${list.boardIdx}';	
		}else{
			return false;
		}
	}
</script>

</body>

</html>
