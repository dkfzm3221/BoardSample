<!DOCTYPE html>
<html lang="ko">

<head>
<title>ITKey 글수정</title>
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
<form method="post">
	<div class="limiter animsition">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form">
					<h4>
						<i class="fa fa-paper-plane" style="color: #b224ef;"></i>수정
					</h4>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th class="padding-lg">제 목</th>
										<td colspan="3">
											<input type="text" class="form-control write-form" id="title" name="boardTitle" value="${list.boardTitle}">
										</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td colspan="3">${list.boardWriter}</td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="detail-content">
												<textarea class="form-control write-form" rows="14" id="comment" name="boardContents" placeholder="내용을 작성해 주세요.">${list.boardContents}
												</textarea>
											</div>
										</td>
									</tr>
									<tr>
										<th class="padding-lg">첨부파일</th>
										<td colspan="3">
											<input type="file" class="form-control write-form file-form" id="file">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2">
							<button type="button" class="btn btn-default btn-full" onclick="location.href='main';">목록</button>
						</div>
						<div class="col-sm-8"></div>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-default btn-full" onclick="location.href='/sam/detail?boardIdx=${list.boardIdx}';">저장</button>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
			<div id="dropDownSelect1"></div>
		</form>
	
</body>