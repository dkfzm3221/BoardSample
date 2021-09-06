<!DOCTYPE html>
<html lang="en">

<head>
<title>ITKey 로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
	href="resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
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
	<form action="login" method="post" id="loginForm" name="loginForm">
		<div class="limiter animsition">
			<div class="container-login100">
				<div class="wrap-login100">
					<div class="login100-form">
						<div class="text-center" style="width: 100%">
							<img src="resources/images/logo.png" width="50%">
						</div>

						<span class="login100-form-title p-b-34 p-t-27"> ITKey Edu<br>Project
							Login
						</span>

						<div class="wrap-input100 validate-input"
							data-validate="Enter username">
							<input class="input100" type="text" name="boardWriter"
								placeholder="ID" id="boardWriter" name="boardWriter"> <span
								class="focus-input100" data-placeholder="&#xf207;"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Enter password">
							<input class="input100" type="password" name="boardWriterPw"
								placeholder="비밀번호" id="boardWriterPw" name="boardWriterPw">
							<span class="focus-input100" data-placeholder="&#xf191;"></span>
						</div>

						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="remember-me"> <label class="label-checkbox100"
								for="ckb1"> ID 저장 </label>
						</div>

						<div class="container-login100-form-btn">
							<button type="submit" class="login100-form-btn"onclick="return loginCheck()">로그인</button>	
							<a href="join" class="login100-form-btn">회원가입</a>
							
							<button type="button" class="login100-form-btn"onclick="location.href='/sam/adminLogin'">관리자 로그인</button>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="dropDownSelect1"></div>
	</form>
</body>
<script type="text/javascript">
	var id = document.loginForm.boardWriter;
	var pw = document.loginForm.boardWriterPw;

	function loginCheck() {
		if (id.value == "") {
			id.focus();
			alert("아이디를 확인해 주세요");
			return false;
		} else if (pw.value == "") {
			pw.focus();
			alert("비밀번호를 확인해 주세요");
			return false;
		} else {
			return true;
		}
	}
</script>

</html>
