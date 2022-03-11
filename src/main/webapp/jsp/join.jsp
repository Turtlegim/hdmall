<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
			
<head>
    <meta charset="utf-8">
    <title>현대백화점인터넷면세점</title>
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
    <link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
    <link rel="stylesheet" href="/inc/user/css/V2Join.css?20210420">
    <link rel="stylesheet" href="/assets/app/css/swiper.min.css">
    <link rel="stylesheet" href="/assets/app/css/screen.ui.css?version=202202170001" />
    <link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">

    <script>
	    function goMainPage() {
			sessionStorage.setItem("selMainSwiperPos", 1);
			location.href = "${action}/hdmall/jsp/main.jsp";
		}
        	
        $(document).on('click', '#idCheck', function () {
        	var userId = document.getElementById("userId").value;
        	
	       	if(userId == ""){
     		  	alert("아이디를 입력주세요.");
     		} else { // IdCheckController 요청
     			$.ajax({
                    url: "${action}/hdmall/idCheck",
                    method: "post", // 요청방식은 post
                    data: {"userId": userId},
                    success: function(result) {
                    	if(result.result == 1) {
                			alert("중복된 아이디입니다.");
                   	 	} else if(result.result == 0) {
                			alert("사용 가능 아이디입니다.");	
                   	   	} else {
                			console.log('develop : 서버 오류');
                   	   	}
                    }, error:function(error){
                       	alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인 
                    }
                 });
   			}
   		});

        // join.html form 재사용을 위한 함수 - 03.07 경민영
        $(document).ready(function () {
            var text = localStorage.getItem('join')
            if (text == "fromMypage") { // 마이페이지 > 회원정보관리
                $('.h1_type').text('회원정보관리');
                $('.h4_type').text('회원정보 수정');
                $('.f_size01').text('회원정보 수정을 위한 필수 입력 정보입니다.');
                
                // 여기서부터 회원정보관리 코드 수정  ~ing 
                document.getElementById("userName").value = (String) userName;
                document.getElementById("userId").value = (String) userName;
                
                document.getElementById("mbshName").style.display = 'none';
                document.getElementById("mbshId").style.display = 'none';
                document.getElementById("mbshHpNo").style.display = 'none';
                document.getElementById("idCheck").style.display = 'none';
            }
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

    <main id="container_join" class="container_join">
        <section>
            <div id="wrap">
                <div style="width: 614px; margin: 0 auto; margin-top: 5px; margin-bottom: 80px;">
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
                                    <button type="submit" class="btn_basic2 big" id="joinBtn">가입하기</button>
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