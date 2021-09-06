<!DOCTYPE html>
<html lang="en">

<head>
<title>ITKey 정보수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
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
<form method="post" id="modify" name="modify" action="modify">
	<div class="limiter animsition">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form validate-form">
					<span class="login100-form-title p-b-27 p-t-15">정보수정</span>
					<div class="row text-center">
						<div class="col-sm-12">
							<img src="resources/images/noImage.png" class="img-circle" style="width: 180px; height: 180px; border-radius: 100%;">
						</div>
					</div>
					<div class="form-group" style="margin-bottom: 50px; margin-top: 10px;">
						<div class="input-group">
							<input type="text" class="form-control" readonly>
							<div class="input-group-btn">
								<span class="fileUpload btn login100-form-btn"> <span class="upl" id="upload">업로드</span> <input type="file" class="upload up" id="up" onchange="readURL(this);" />
								</span>
								<!-- btn-orange -->
							</div>
							<!-- btn -->
						</div>
						<!-- group -->
					</div>
					<!-- form-group -->
					
					<div class="row">
						<div class="col-sm-12">
							<div class="wrap-input100 validate-input" data-validate="Enter username">
								<input class="input100" type="text" name="boardWriter" value="${id}" readonly>
								<span class="focus-input100" data-placeholder="&#xf207;"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="wrap-input100 validate-input" data-validate="Enter username">
								<input class="input100" type="text" id="boardWriterName" name="boardWriterName" placeholder="이름 입력란">
								<span class="focus-input100" data-placeholder="&#xf205;"></span>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="wrap-input100 validate-input" data-validate="Enter username">
								<input class="input100" type="tel" id="boardWriterPhone" name="boardWriterPhone" placeholder="전화번호 입력란">
								<span class="focus-input100" data-placeholder="&#xf2be;"></span>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="wrap-input100 validate-input" data-validate="Enter username">
								<input class="input100" type="text" id="boardWriterEamil" name="boardWriterEmail" placeholder="이메일.">
								<span class="focus-input100" data-placeholder="&#xf159;"></span>
							</div>
						</div>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="password" id="boardWriterPw" name="boardWriterPw" placeholder="암호를 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="password" id="boardWriterPw" name="boardWriterPwRe" placeholder="암호 확인.">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
					<div class="container-login100-form-btn">
						<button type="submit" onclick="checkAll()" class="login100-form-btn ">수정</button> 
						<button type="button" class="login100-form-btn " onclick="delChk()">탈퇴</button> 
						<a href="/sam/main" class="login100-form-btn">취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
</form>
<script>
function delChk(){
	var chk = confirm("회원탈퇴하시겠습니까?")
	if(chk){
		location.href='/sam/delUser';
	}else{
		return false;
	}
}

var mobileNum = document.getElementById('boardWriterPhone');
mobileNum.onkeyup = function() {
  console.log(this.value);
  this.value = autoHypenMobile(this.value);  
}     

// 전화 번호 자동 하이폰
var autoHypenMobile = function(num) {
		num = num.replace(/[^0-9]/g, '');
		var tmp = '';
			if(num.length < 4) {
			  return num;
			} else if(num.length < 7) {
				  tmp += num.substr(0, 3);
				  tmp += '-';
				  tmp += num.substr(3);
			  return tmp;
			}else if(num.length < 11) {
				  tmp += num.substr(0, 3);
				  tmp += '-';
				  tmp += num.substr(3, 3);
				  tmp += '-';
				  tmp += num.substr(6);
			  return tmp;
			} else if(num.length >11) {
				  tmp += num.substr(0, 3);
			      tmp += '-';
				  tmp += num.substr(3, 4);
				  tmp += '-';
			      tmp += num.substr(7);                  
					return tmp;
			}
			else {              
				  tmp += num.substr(0, 3);
				  tmp += '-';
				  tmp += num.substr(3, 4);
				  tmp += '-';
				  tmp += num.substr(7);
				  return tmp;
			}
			
			return num;
		}

	function checkAll(){
		//공백 정규식
	 	var emptyChk = /\s/g;
	 	//이메일 정규식
	 	var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 	//휴대폰 정규식
	 	var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
	 	
		var pw = document.getElementById("boardWriterPw");
		var pwRe = document.getElementById("boardWriterPwRe");
		var name = document.getElementById("boardWriterName");
		var email = document.getElementById("boardWriterEmail");
		var phone = document.getElementById("boardWriterPhone");
		
		if(name.value == ''){
	 		alert("이름을 입력해주세요")
	 		name.focus();
	 		return false;
	 	}
	 	if(phone.value == ''){
	 		alert('휴대폰번호를 입력해주세요')
	 		phone.focus();
	 		return false;
	 	}
	 	if(email.value ==''){
	 		alert("이메일을 입력해 주세요")
	 		email.focus();
	 		return false;
	 	}
		if(pw.value == ''){
			alert("비밀번호를 입력해주세요")
			pw.focus();
			return false;
		}

		if(pw.value != pwRe.value){
			alert("비밀번호를 확인해주세요")
			pw.focus();
			return false;
		}

	}
</script>
</body>
</html>
