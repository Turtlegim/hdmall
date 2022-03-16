<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>현대픽픽스토어</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
	<script src="https://cdn.hddfs.com/front/js/KO/main.ui.js?ver=18"></script>
	
	<link rel="icon" type="image/png" sizes="96x96" href="${action}/hdmall/image/favicon-96x96.png">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
	<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
	<link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">

	<!-- main 이미지 슬라이더 -->
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

	<script language="javascript">
		// 현재 요청경로
		var ctx_curr = "//www.hddfs.com/shop";
		var ctx_shop = "https://www.hddfs.com/shop";
		var isLogin = false;
		var SERVER_IMAGE = "https://cdn.hddfs.com/front";
		var SERVER_IMAGE_MNG = "https://cdn.hddfs.com/files/";
		var SERVER_SCRIPT_JSON = "https://cdn.hddfs.com/files";
		var USER_AUTO_LOGOUT_TIME = 1800;
		var gUmbMbshUrl = "https://www.h-point.co.kr"; // 통합멤버쉽 주소
	</script>

	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>

	<!-- S: 다이퀘스트 스크립트 추가 -->
	<script type="text/javascript"
		src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
	<!-- E: 다이퀘스트 스크립트 추가 -->

	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>

	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>

	<script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>

	<script>
		var mySwiper = new Swiper('.swiper-container', {
			// 슬라이드를 버튼으로 움직일 수 있습니다.
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},

			// 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
			pagination: {
				el: '.swiper-pagination',
				type: 'bullets',
			},

			// 현재 페이지를 나타내는 스크롤이 생깁니다. 클릭하면 이동합니다.
			scrollbar: {
				el: '.swiper-scrollbar',
				draggable: true,
			},

			// 4초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
			autoplay: {
				delay: 4000,
			},
		});
		
		$(function () {
			$(".btn_gnb").on("click", function () {
				$("#gnb > ul > li").removeClass("open").css("display", "");
				$("#gnb > ul > li > ul").css("display", "none");
				$(".serviceMenu").parent().removeClass("open");
				$(".serviceMenu").parent().addClass("open");
				$(".serviceMenu").css("display", "block");

				//카테고리 JSONP load
				if ($(".serviceCtgList > li").length < 1) {
					loadCtgList();
				}
			});
		});

		function goMainPage() {
			sessionStorage.setItem("selMainSwiperPos", 1);
			location.href = "${action}/hdmall/main.do";
		}
		
		$(document).ready(function () {
			// 화면 로드될 때 비밀번호 확인하는 상단부만 보여주기
			document.getElementById("headerSection").style.display = "";
			document.getElementById("bottomSection").style.display = "none";
		});
		
		/* 경민영 : 회원정보 수정 전 비밀번호 입력 확인 버튼 (개인정보 보호용) */
		$(document).on('click', '#pwdCheck', function () {
			var userPwd = document.getElementById("userPwd").value;

			if (userPwd == "") {
				alert("비밀번호를 입력주세요.");
			} else { // IdCheckController 요청
				$.ajax({
					url: "${action}/hdmall/pwdCheck",
					method: "post", // 요청방식은 post
					data: { "userPwd": userPwd },
					success: function (result) {
						if (result.result == 1) {
							alert("비밀번호 확인 성공");
							
							// 비밀번호 입력 상단부 숨기고, 회원정보 수정 폼 보여주기
							document.getElementById("headerSection").style.display = "none";
							document.getElementById("bottomSection").style.display = "";
						} else {
							// 비밀번호가 회원 정보와 일치하지 않는 경우 초기화 후 alert창 띄워주기 
							document.getElementById("userPwd").value = "";
							alert("비밀번호를 다시 입력해주세요.");
						}
					}, error: function (error) {
						alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인 
					}
				});
			}
		});
		
		/* 경민영 : 전화번호 중복 확인 버튼을 눌렀을 때 동작하는 함수 */
		$(document).on('click', '#hpnoCheck', function () {
			var userHpno = document.getElementById("userHpno").value;
			
			if(userHpno == "") {
				alert("전화번호를 입력해주세요.");
			} else {
				$.ajax({
					url: "${action}/hdmall/hpnoCheck",
					method: "post", //요청방식은 post
					data: { "userHpno": userHpno },
					success: function (result) {
						if (result.result == 1) {
							alert("이미 사용중인 전화번호 입니다.");
						} else if (result.result == 0) {
							alert("사용 가능한 전화번호 입니다.");
						} else {
							console.log('develop : 서버 오류');
						}
					},
					error: function (error) {
						alert("AJAX요청 실패 : 에러코드 = " + error.status); // status 에러확인 
					}
				});
			}
   		});
		
		/* 경민영 : 회원정보 수정 하단에 있는 취소 버튼을 눌렀을 때 동작하는 함수 */
		$(document).on('click', '#btnCancel', function () {
			alert("회원정보 수정을 취소하셨습니다.");
			
			document.getElementById("userPwd").value = ""; // 초기화
			document.getElementById("headerSection").style.display = "";
			document.getElementById("bottomSection").style.display = "none";
		});
		
		function email_change(form) {
            var value = form.emaildomain[form.emaildomain.selectedIndex].value;
            if (value != "") {
                form.email2.disabled = true;
            } else {
                form.email2.disabled = false;
            }
			
            form.email2.value = value;
            alert(value);
            form.email2.focus();
            
            return;
        }
	</script>

	<style>
		html,
		body {
			height: 100%;
			margin: 0;
			padding: 0;
		}

		img {
			padding: 0;
			display: block;
			margin: 0 auto;
			max-height: 100%;
			max-width: 100%;
		}
	</style>
</head>

<body>
	<%@ include file="header.jsp" %>

		<div id="wrap">
			<article id="content">
				<section id="headerSection">
					<div class="pw_recheck">
						<p>회원님의 소중한 개인정보보호를 위하여<br>
							비밀번호를 다시 한번 확인해 주시기 바랍니다.</p>
						<span class="input_de"><input type="password" id="userPwd" value=""></span>
						<div class="btn_area mt40">
							<button type="button" class="btn_basic2 small" id="pwdCheck"
								style="width: 170px; height: 60px;">확인</button>
						</div>
					</div>
				</section>

				<section id="bottomSection" style="width: 800px; margin:0 auto; margin-top: 75px;">
					<div class="content_wrap">
						<h3 class="h3_type line">회원정보 수정</h3>
						<ul class="dot_list mgts">
                        	<li>필수 사항(*)은 꼭 입력하셔야합니다.&nbsp;</li><br>
                    	</ul>
						<form name="userManage" method="post" action="${contextPath}/userManage">
							<table class="tb_write01 vm">
								<colgroup>
									<col style="width: 160px">
									<col style="width: auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="bt_no">아이디</th>
										<td class="bt_no">${userId}</td>
									</tr>
									<tr>
										<th scope="row">성명&nbsp;*</th>
										<td>
											<span>
												<input type="text" id="userName" name="userName" value="${userName}">
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row">비밀번호&nbsp;*</th>
										<td>
											<span>
												<input type="password" id="userPwd" name="userPwd" onkeypress="javascript:noSpaceEvnt(event);" value="<%= (String) request.getAttribute("userPwd")%>">
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row">전화번호</th>
										<td>
											<span class="phone_num">
												<input type="text" id="userHpno" name="userHpno" style="height: 34px;" onkeypress="javascript:noSpaceEvnt(event);">
											</span>
											<button type="button" class="btn_basic4 small v_top" id="hpnoCheck">중복 확인</button>
										</td>
									</tr>
									<tr id="num_change_before">
										<th scope="row">이메일</th>
										<td>
											<span class="email1">
												<input type="text" name="email1" id="email1" class="frm_input" maxlength="20" onkeypress="javascript:noSpaceEvnt(event);">
											</span> @
                                        	
											<span class="email2">
                                        		<input type="text" name="email2" id="email2" class="frm_input">
                                    		</span>
                                    		
                                    		<span class="emaildomain">
                                         		<select id="emaildomain" name="emaildomain" class="frm_input" onChange="email_change(this.form);"
		                                            style="width: 100px; height: 48.5px; text-align: center;">
		                                            <option value="">직접입력</option>
		                                            <option value="naver.com">naver.com</option>
		                                            <option value="gmail.com">gmail.com</option>
                                       			 </select>
                                    		</span>
										</td>
									</tr>

									<tr>
										<th scope="row">회원탈퇴</th>
										<td>
											<span class="rgap02">회원탈퇴를 하시면 그동안의 찜하기와 문의 내역은 사라집니다.</span>
											<a href="../deleteUser" style="text-decoration-line: underline;">회원탈퇴하기</a>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="sh_btn_box">
								<button type="button" class="btn_basic1" id="btnCancel">취소</button>
								<button type="submit" class="btn_basic2" id="btnConfirm">확인</button>
							</div>
						</form>
					</div>
				</section>
			</article>
		</div>

<%@ include file="footer.jsp" %>