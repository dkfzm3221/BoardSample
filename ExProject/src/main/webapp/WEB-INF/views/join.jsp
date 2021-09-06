<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>ITKey 회원가입</title>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<script src="resources/vendor/bootstrap/js/popper.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/vendor/select2/select2.min.js"></script>
<script src="resources/vendor/daterangepicker/moment.min.js"></script>
<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>
<form id="userChk" name="userJoin" action="join" method="post" onsubmit="return joinCheck(this)" enctype="multipart/form-data">
	<div class="limiter animsition">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form validate-form">
					<span class="login100-form-title p-b-27 p-t-15">회원가입</span>
					<div class="row text-center">
						<div class="col-sm-12">
							<img class="img-circle" id="preView" style="width: 180px; height: 180px; border-radius: 100%;">
						</div>
					</div>
					<div class="form-group" style="margin-bottom: 50px; margin-top: 10px;">
						<div class="input-group">
							<input type="text" class="form-control" readonly>
							<div class="input-group-btn">
								<span class="fileUpload btn login100-form-btn"> <span class="upl" id="upload">업로드</span> 
								<input type="file" class="upload up" onchange="previewImage(this);" name="file" />
								</span>
								<!-- btn-orange -->
							</div>
							<!-- btn -->
						</div>
						<!-- group -->
					</div>
					<!-- form-group -->

					<div class="row">
						<div class="col-sm-6">
							<div id="idChk">
								<div class="wrap-input100 validate-input" data-validate="Enter username">
									<input class="input100" type="text" name="boardWriter" placeholder="ID" id="boardWriter">
									<span class="focus-input100" data-placeholder="&#xf207;"></span>
									<div id="idChk"></div>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="wrap-input100 validate-input" data-validate="Enter password">
								<input class="input100" type="password" name="boardWriterPw" placeholder="Password" id="boardWriterPw">
								<span class="focus-input100" data-placeholder="&#xf191;"></span>
								<div id="pwChk"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="wrap-input100 validate-input" data-validate="Enter username">
								<input class="input100" type="text" name="boardWriterName" placeholder="이름 입력란" id="boardWriterName">
								<span class="focus-input100" data-placeholder="&#xf205;"></span>
								<div id="nameChk"></div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="wrap-input100 validate-input" data-validate="Enter username">
								<input class="input100" type="tel" name="boardWriterPhone" placeholder="전화번호 입력란" id="boardWriterPhone">
								<span class="focus-input100" data-placeholder="&#xf2be;"></span>
								<div id="phoneChk"></div>
							</div>
						</div>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="text" name="boardWriterEmail" placeholder="이메일을 입력해주세요." id="boardWriterEmail">
						<span class="focus-input100" data-placeholder="&#xf15a;"></span>
						<div id="mailChk"></div>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="text" name="boardWriterEmail" placeholder="이메일을 다시한번 입력해주세요." id="boardWriterEmailRe">
						<span class="focus-input100" data-placeholder="&#xf159;"></span>
						<div id="mailChkRe"></div>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn" onclick="return checkAll()">가입</button> <a href="login" class="login100-form-btn">취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	</form>
<script type="text/javascript">
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
	 	
	 	var id = document.getElementById("boardWriter");
	 	var pw = document.getElementById("boardWriterPw");
	 	var name = document.getElementById("boardWriterName")
	 	var email = document.getElementById("boardWriterEmail");
	 	var emailRe = document.getElementById("boardWriterEmailRe");
	 	var phone = document.getElementById("boardWriterPhone");
	 	
	 	if(id.value == ''){
	 		alert("아이디를 입력해 주세요")
	 		id.focus();
	 		return false;
	 	}
	 	if(pw.value == ''){
	 		alert("비밀번호를 입력해 주세요")
	 		pw.focus();
	 		return false;
	 	}
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
	 	if(emailRe.value == ''){
	 		alert('이메일을 입력해주세요')
	 		emailRe.focus();
	 		return false;
	 	}
	 	if(email.value != emailRe.value){
	 		alert('이메일을 확인해 주세요')
	 		email.focus();
	 		return false;
	 	}
	 	if(emailPattern.test(email.value) == false){
	 		alert("이메일 형식이 올바르지 않습니다.")
	 		email.focus();
	 		return false;
	 	}
	 	if(emailPattern.test(emailRe.value) == false){
	 		alert("이메일 형식이 올바르지 않습니다.")
	 		email.focus();
	 		return false;
	 	}

	 }
	 
	 //이미지 미리보기
	 function previewImage(input){
		 
		 if(input.files && input.files[0]){
			 var reader = new FileReader();
			 reader.onload = function(e){
				 document.getElementById('preView').src = e.target.result;
			 };
			 reader.readAsDataURL(input.files[0]);
		 }else{
			 document.getElementById('preView').src = "";
		 }
	 }
	 

		
</script>
</body>

</html>
