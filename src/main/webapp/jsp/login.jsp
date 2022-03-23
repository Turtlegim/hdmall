<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%!
	/* 경민영 : cookieName과 동일한 쿠키가 존재하면 쿠키에 저장된 값 반환 */
	public String getCookieValue(Cookie[] cookies, String cookieName) { 
    	for (Cookie cookie : cookies) { 
         	if(cookie.getName().equals(cookieName)){ 
              	return cookie.getValue(); 
        	}
    	}
    	
    	return ""; 
	}
%>	

<%
     Cookie[] cookies = request.getCookies();
     String id = getCookieValue(cookies, "userId"); // 아이디 저장 체크 후 로그인 했을 때 입력했던 쿠키 불러오기
%>

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
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
	<link rel="icon" type="image/png" sizes="96x96" href="${action}/hdmall/image/favicon-96x96.png">
    <link rel="stylesheet" href="${action}/hdmall/css/footer.css">
    <link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">

    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    
    <script>
        $(function () {
            $(".btn_gnb").on("click", function () {
                $("#gnb > ul > li").removeClass("open").css("display", "");
                $("#gnb > ul > li > ul").css("display", "none");
                $(".serviceMenu").parent().removeClass("open");
                $(".serviceMenu").parent().addClass("open");
                $(".serviceMenu").css("display", "block");

                // 카테고리 JSONP load
                if ($(".serviceCtgList > li").length < 1) {
                    loadCtgList();
                }
            });
        });

        function goMainPage() {
			sessionStorage.setItem("selMainSwiperPos", 1);
			location.href = "${action}/hdmall/main.do";
		}
		
        <!-- 경민영 : 로그인 -->
        $( document ).ready(function() {
        	$('#btnLgin').click(function(){
        		var id = document.getElementById('userId').value;
            	var pwd = document.getElementById('userPwd').value;
            	
        		if(id == "" || pwd == "") { // 빈칸이 존재하는 경우 
            		alert("빈칸이 존재합니다.");
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
        
		#checked-container {
			text-align : center;
			padding-top : 50px;
		}
		
		#checked {
			color : red;   
			font-weight : bold;
		}
    </style>
</head>

<body>
	<%@ include file = "header.jsp"%>
    <main id="container_join" class="container_join">
        <section>
            <div id="wrap">
                <div style="width: 430px; margin: 0 auto; margin-top: 150px; margin-bottom: 150px;">
                    <h1 class="h1_type">로그인</h1>
                    <div id="login01">
                        <form method="post" action="${action}/hdmall/login" autocomplete="off">
                            <div class="join_form">
                                <div class="join_row">
                         
                                    <input type="text" id="userId" name="userId" value="<%= id %>" placeholder="아이디"
                                        onkeypress="javascript:noSpaceEvnt(event);" maxlength="20"
                                        style="ime-mode:inactive;" autocomplete="off">
                                </div>
                                <div class="join_row placeholder_wrap">
                                    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호"
                                        onkeypress="javascript:noSpaceEvnt(event);" maxlength="100" autocomplete="off">
                                </div>
                            </div>
                            <div class="id_save">
                                <span class="checkbox small">
                                    <input type="checkbox" name="id_rem" id="id_rem" <% if(id.length() > 1) out.println("checked"); %> >
                                    <label for="umbSaveId">아이디 저장</label>
                                </span>
                            </div>
                            <div class="btn_login">
                            	<button type="submit" class="btn_basic2 big"
                                    id="btnLgin">로그인</button>
                            </div>
                        </form>
                    </div>
                    <div class="txt_btn tl">
                            <p>회원가입 시 더 많은 혜택이 제공됩니다.<a href="${action}/hdmall/jsp/join.jsp" class="btn_basic1" onclick="sendJoin()">회원가입</a>
                            </p>
                    </div>
                </div>
            </div>
        </section>
    </main>

<%@ include file = "footer.jsp"%>		