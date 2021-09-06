<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>ITKey 글 쓰기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
	href="resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.origin.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/table.css">
<link rel="stylesheet" type="text/css"
	href="resources/vendor/fontawesome-free-5.8.2-web/css/all.min.css">
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
	<form method="post" action="write" enctype="multipart/form-data">
		<div class="limiter animsition">
			<div class="container-login100">
				<div class="wrap-login100">
					<div class="login100-form">
						<h4>
							<i class="fa fa-paper-plane" style="color: #b224ef;"></i> 새글 작성 /
							수정
						</h4>
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th class="padding-lg">제 목</th>
											<td colspan="3"><input type="text"
												class="form-control write-form" id="boardTitle"
												placeholder="제목을 작성해 주세요." name="boardTitle"></td>
										</tr>
										<tr>
											<th class="padding-lg">작성자</th>
											<td colspan="3">
												<input type="text" class="form-control write-form" id="boardWriter" placeholder="작성자" name="boardWriter" readonly value="${data}">
												<input type="radio" name="radio" value="Y" class="radio" checked="checked" />공개&nbsp;&nbsp;&nbsp;&nbsp;
   												<input type="radio" name="radio" value="N" class="radio" />비공개
   												<input type="hidden" id="hidden" name="boardPublicFl"> 
										</tr>
										<tr>
											<td colspan="4">
												<div class="detail-content">
													<textarea class="form-control write-form" rows="14"
														id="contents" placeholder="내용을 작성해 주세요."
														name="boardContents"></textarea>
												</div>
											</td>
										</tr>
										<tr>
											<th class="padding-lg">첨부파일</th>
											<td colspan="3"><input type="file" class="form-control write-form file-form" name="file">
											
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-2">
								<button type="button" class="btn btn-default btn-full"
									onclick="location.href='main';">목록</button>
							</div>
							<div class="col-sm-8"></div>
							<div class="col-sm-2">
								<button type="submit" class="btn btn-default btn-full" onclick="return checkEmpty()">저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="dropDownSelect1"></div>
		</form>
	<script type = "text/javascript">
		function checkEmpty(){
			var title = document.getElementById('boardTitle');
			var writer = document.getElementById('boardWriter');
			var contents = document.getElementById('contents');
			var boardPublicFl = document.querySelector("input[name='radio']:checked").value
			
			console.log(boardPublicFl)
			$('#hidden').val(boardPublicFl);
			
			if(title.value == ''){
				alert('제목을 입력해 주세요')
				title.focus();
				return false;
			}
			if(writer.value == ''){
				alert('작성자를 입력해 주세요')
				writer.focus();
				return false;
			}
			if(contents.value == ''){
				alert('내용을 입력해 주세요')
				contents.focus();
				return false;
			}
		}

</script>
		
</body>

</html>
