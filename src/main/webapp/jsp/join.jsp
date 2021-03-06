<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
			
<head>
    <meta charset="utf-8">
    <title>현대픽픽스토어</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/swiper.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper.min.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/member.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/popup.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
	<link rel="icon" type="image/png" sizes="96x96" href="${action}/hdmall/image/favicon-96x96.png">
    <link rel="stylesheet" href="/inc/user/css/V2Join.css?20210420">
    <link rel="stylesheet" href="/assets/app/css/swiper.min.css">
    <link rel="stylesheet" href="/assets/app/css/screen.ui.css?version=202202170001" />
    <link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">

    <script>
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
        
        function email_change(form) {
            var value = form.emaildomain[form.emaildomain.selectedIndex].value;
            if (value != "") {
                form.email2.disabled = true;
            } else {
                form.email2.disabled = false;
            }
			
            form.email2.value = value;
            form.email2.focus();
            
            return;
        }
        
        $( document ).ready(function() {
        	var idCheck = false;
        	
        	/* 경민영 : 아이디 중복 확인 버튼을 눌렀을 때 동작하는 함수 */
        	$(document).on('click', '#idCheck', function () {
            	var userId = document.getElementById("userId").value;
            	
    	       	if(userId == ""){ // 빈 문자열인 경우 
         		  	alert("아이디를 입력해주세요.");
         		} else { // IdCheckController에 전송
         			$.ajax({
                        url: "${action}/hdmall/idCheck",
                        method: "post", // 요청방식은 post
                        data: {"userId": userId},
                        success: function(result) {
                        	if(result.result == 1) { // 중복된 아이디인 경우 
                    			alert("중복된 아이디입니다.");
                       	 	} else if(result.result == 0) { // 중복되지 않은 아이디인 경우 
                    			alert("사용 가능한 아이디입니다.");	

                    			form.userId.readonly = true;
                    			idCheck = true;
                       	   	} else {
                    			console.log('develop : 서버 오류');
                       	   	}
                        }, error:function(error){
                           	alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인 
                        }
                     });
       			}
       		});
        	
        	/* 경민영 : 가입하기 버튼을 눌렀을 때 동작하는 함수 */
        	$('#btnJoin').click(function(){
        		var name = document.getElementById('userName').value;
        		var id = document.getElementById('userId').value;
        		var pwd = document.getElementById('userPwd').value;
        		var rePwd = document.getElementById('reUserPwd').value;
        		var email1 = document.getElementById('email1').value;
        		
        		// Controller에 저장한 세션 값들을 저장 
        		var idCheckResult = <%= session.getAttribute("idCheckResult") %>;
        		var joinResult = <%= session.getAttribute("joinResult") %>;
        		
        		if (name == "" || id == "" || hpno == "" || email1 == "" || pwd == "" || rePwd == "") { // 빈칸이 존재하는 경우
        			alert("필수 정보들을 모두 입력해주세요.");
        	   	} 
        		
        		if (pwd != rePwd) { // 비밀번호와 비밀번호 확인에 입력한 내용이 일치하지 않는 경우
        	   		alert("입력한 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
        	   	}
        		
        		if (idCheckResult == 1) { // 중복된 아이디를 입력한 후 회원가입을 누른 경우 
        			alert("중복된 아이디로 회원가입을 하실 수 없습니다. 다시 입력해주세요.");
        		}
        		
        		if (joinResult == 0) { // 회원가입을 실패한 경우
        			alert("회원가입에 실패했습니다. 다시 입력해주세요.");
        		}
        	});
        });
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

    <main id="container_join" class="container_join">
        <section>
            <div id="wrap">
                <div style="width: 614px; margin: 0 auto; margin-top: 80px; margin-bottom: 80px;">
                    <h1 class="h1_type" id="state">회원가입</h1>
                    <div id="login01">
                        <form name="join" method="post" action="${action}/hdmall/join" autocomplete="off">
                            <br><br>
                            <h3 class="h4_type">회원정보 입력<span class="small_txt">(필수)</span></h3>
                            <p class="f_size01">회원가입을 위한 필수입력 정보입니다.</p>
                            <div class="join_form">
                                <div class="join_row with_btn placeholder_wrap" id="divName">
                                    <input type="text" id="userName" name="userName" maxlength="20">
                                    <label id="mbshName" for="mbshName">이름</label>
                                    <p class="t_error" style="display:none;"></p>
                                </div>

                                <div class="join_row placeholder_wrap" id="divId">
                                    <div>
                                        <input type="text" id="userId" name="userId" maxlength="20" class="engNumber"
                                            style="width: 488px;">
                                        <label id="mbshId" for="mbshId">아이디</label>
                                        <p class="t_error" style="display:none;"></p>

                                        <button type="button" class="btn_basic2 small" id="idCheck"
                                            style="width: 124px; height: 60px; float: right;">중복확인</button>
                                     </div>
                                </div>

                                <div class="join_row placeholder_wrap" id="divPwd">
                                    <input type="password" id="userPwd" name="userPwd" maxlength="20"
                                        onkeypress="javascript:noSpaceEvnt(event);">
                                    <label for="mbshPwd">비밀번호</label>
                                    <p class="t_error" style="display:none;"></p>
                                </div>

                                <div class="join_row placeholder_wrap" id="divRePwd">
                                    <input type="password" id="reUserPwd" name="reUserPwd" maxlength="20"
                                        onkeypress="javascript:noSpaceEvnt(event);">
                                    <label for="mbshPwd">비밀번호 확인</label>
                                    <p class="t_error" style="display:none;"></p>
                                </div>

                                <div class="join_row placeholder_wrap" id="divHpNo">
                                    <input type="text" id="userHpno" name="userHpno"
                                        onkeypress="javascript:noSpaceEvnt(event);">
                                    <label id="mbshHpNo" for="userHpNo">전화번호<span>('-'없이 입력)</span></label>
                                    <p class="t_error" style="display:none;"></p>
                                </div>

                                <div>
                                    <div class="join_row placeholder_wrap"
                                        style="width: 194px; float: left; margin-right: 2px;">
                                        <input type="text" name="email1" id="email1" class="frm_input" maxlength="20"
                                            onkeypress="javascript:noSpaceEvnt(event);">
                                        <label for="userEmail">이메일</label>
                                        <p class="t_error" style="display:none;"></p>
                                    </div>

                                    <div
                                        style="width: 20px; height: 60px; float: left; display:table-cell; vertical-align: middle; line-height: 60px; font-size: 1.4em; text-align: center;">
                                        @</div>

                                    <div class="join_row placeholder_wrap"
                                        style="width: 194px; float: left; margin-left :2px">
                                        <input type="text" name="email2" id="email2" class="frm_input">
                                    </div>

                                    <div>
                                        <select id="emaildomain" name="emaildomain" class="frm_input" onChange="email_change(this.form);"
                                            style="width: 202px; height: 60px; text-align: center; float: left;">
                                            <option value="">직접입력</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="gmail.com">gmail.com</option>
                                        </select>
                                    </div>
                                </div>

                                <br><br><br><br>
                                <div class="btn_login">
                                    <button type="submit" class="btn_basic2 big" id="btnJoin">가입하기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- footer start 배지현 (03.0) -->
   <%@ include file = "footer.jsp" %>