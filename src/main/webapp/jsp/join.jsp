<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userId" value="${param.userId}"/>

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
                
                // 여기서부터 회원정보관리 코드 수정 
                $('#userName').attr('value', '경민영');
                $('#userId').attr('value', 'kmy9035');
                $('#userHpNo').attr('value', '01040129035');
                document.getElementById("mbshName").style.display = 'none';
                document.getElementById("mbshId").style.display = 'none';
                document.getElementById("mbshHpNo").style.display = 'none';
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
    <header id="header">
        <section class="box">
            <a href="javascript:" class="btn_gnb">Navigation Drawer</a>
            <h1 onclick="goMainPage();" style="cursor: pointer; height: 48px"><img id="mainLogo"
                    src="${action}/hdmall/image/logo.png">
            </h1> <!-- 로고 이미지 src 변경 부분 -->

            <div class="default_menu">
            	<%
					String userName = (String)session.getAttribute("userName");
				%>
				<%if (userName != null) { %>
					<a> <%=userName%>님 </a>
					<a href="${action}/hdmall/logout" id="logoutBtn">로그아웃</a>
				<%}else { %> 
					<a href="${action}/hdmall/login" id="loginBtn">로그인</a>
				<%} %>
                <ul>
                    <li class="item_01">
                        <a href="like.html">찜하기</a>
                    </li>
                    <li class="item_03">
                        <a href="mypage.html">마이현대</a>
                    </li>
                    <li class="item_04">
                        <a href="q&a_insert.html">고객센터</a>
                    </li>
                    <li class="exchange_rate exchageRateTxt"></li>
                </ul>
            </div>

            <!-- 히든메뉴 START -->
            <script type="text/javascript">
                function commOpenLayer(cookieChkYn, hiddenYn) {
                    $.ajax({
                        async: true,
                        url: ctx_curr + "/dm/main/popInfo.json",
                        dataType: "json",
                        type: "POST",
                        success: function (popInfo, textStatus, jqXHR) {
                            var data = popInfo.resPop;
                            var html = "";
                            for (var i = 0; i < data.popSeqList.length; i++) {
                                html += "<div class=\"main_popup\" id=\"main_bottom_pop" + data.popSeqList[i].popSeq + "\" data-seq=\"" + data.popSeqList[i].popSeq + "\">";
                                var addClass = "";
                                var addStyle = "";
                                if (data.popSeqList[i].popTmplCd == '001') {
                                    addClass = "popswiper-container";
                                } else {
                                    addClass = "html_wrap";
                                    addStyle = "style='width:560px; height: 368px;'";
                                }
                                html += "<div class=\"" + addClass + "\" " + addStyle + ">";
                                if (data.popSeqList[i].popTmplCd == '001') {
                                    html += "<ul class=\"swiper-wrapper mainPopList\">";
                                    for (var j = 0; j < data.dataList.length; j++) {
                                        if (data.popSeqList[i].popSeq == data.dataList[j].popSeq) {
                                            html += "<li class=\"swiper-slide\">";
                                            var link = data.dataList[j].linkUrl != null ? data.dataList[j].linkUrl : "javascript:";

                                            var wiseLog = "";
                                            if (link != "javascript:") {
                                                if (link.indexOf("?") != -1) {
                                                    wiseLog = "&MG=KR_PC_Main_Popup" + data.popSeqList[i].popSeq + "_" + data.dataList[j].popDtlSeq;
                                                } else {
                                                    wiseLog = "?MG=KR_PC_Main_Popup" + data.popSeqList[i].popSeq + "_" + data.dataList[j].popDtlSeq;
                                                }
                                            }

                                            if (data.dataList[j].shrtVdoUrl != null) {
                                                html += "<video preload=\"none\" muted loop class='video-js'  style='width:560px; height:368px; object-fit:cover; background-color: black;'>";
                                                html += "<source src=\"https://cdn.hddfs.com/files/" + data.dataList[j].shrtVdoUrl + "\" type=\"video/mp4\">";
                                                html += "<strong>Your browser does not support the video tag.</strong>";
                                                html += "</video>";
                                            } else {
                                                var mainTitl = data.dataList[j].mainTitl != null ? data.dataList[j].mainTitl : "";
                                                var subTitl = data.dataList[j].subTitl != null ? data.dataList[j].subTitl : "";
                                                var bnnrWrd = data.dataList[j].bnnrWrd != null ? data.dataList[j].bnnrWrd : "";

                                                html += "<a href=\"" + link + wiseLog + "\"  class='item_wrap'>";
                                                html += "<div class='pop_txt'>";
                                                html += "<strong class='cate'>" + mainTitl + "</strong>";
                                                html += "<p>" + subTitl + "</p>";
                                                html += "<p>" + bnnrWrd + "</p>";
                                                html += "</div>";
                                                html += "<img src=\"https://cdn.hddfs.com/files/" + data.dataList[j].imgUrl + "?RS=750X494\" alt=\"" + data.dataList[j].mainTitl + "\">";
                                                html += "</a>";
                                            }
                                            html += "</li>";
                                        }
                                    }
                                    html += "</ul>";
                                    html += "<div class=\"swiper_control\" id=\"mainPop_" + data.popSeqList[i].popSeq + "\">";
                                    html += "<div class=\"swiper-pagination\"></div>";
                                    html += "<div class=\"swiper-prev\"></div>";
                                    html += "<div class=\"swiper-next\"></div>";
                                    html += "</div>";
                                } else {
                                    html += data.popSeqList[i].htmlCont;
                                }
                                html += "</div>";
                                html += "<div class=\"close_section\">";
                                html += "<span class=\"today_close chk\">";
                                html += "<input type=\"checkbox\" class=\"today_close\" id=\"btn_hidden_layer_" + data.popSeqList[i].popSeq + "\" onclick=\"saveMainLayerCookie(" + data.popSeqList[i].popSeq + ");\" hiddenYn=\"N\" />";
                                html += "<label for=\"btn_hidden_layer_" + data.popSeqList[i].popSeq + "\" style=\"cursor: pointer;\">오늘 하루 보지 않기</label>";
                                html += "</span>";
                                html += "<span class=\"popup_close\"  data-seq=\"" + data.popSeqList[i].popSeq + "\" onclick=\"closeMainLayer(" + data.popSeqList[i].popSeq + ");\">닫기</span>";
                                html += "</div>";
                                html += "</div>";
                            }
                        }
                    });
                }
            </script>

            <nav class="navication">
                <div id="gnb">
                    <h2>Global Navigation Bar</h2>
                    <ul class="depth_01">
                        <li>
                            <strong>전체서비스</strong>
                            <ul class="depth_02 serviceMenu">
                                <li>
                                    <a href="best.html">
                                        베스트</a>
                                </li>
                                <li>
                                    <a href="product_list.html">
                                        신상품</a>
                                </li>
                                <li>
                                    <a href="q&a_insert.html">
                                        고객센터</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <strong>카테고리</strong>
                            <ul class="depth_02 serviceCtgList">
                                <li>
                                    <a href="product_list.html">
                                        여성캐쥬얼</a>
                                </li>
                                <li>
                                    <a href="product_list.html">
                                        남성캐쥬얼</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                </div><button class="gnb_close">닫기</button>
            </nav>
    </header>

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
    <div id="wrap_1">
        <footer id="footer">
            <div class="policy">
                <div class="copy">
                    <div class="copyright">
                        <div class="logo">
                            <h1 onclick="goMainPage();" style="cursor: pointer; height: 48px"><img id="mainLogo"
                                    src="${action}/hdmall/image/footerLogo.png"></h1> <!-- 로고 이미지 src 변경 부분 -->
                            <strong>현대 IT&E 1차 프로젝트(2조) </strong>
                        </div>
                        <ul>
                            <li>
                                <span>김기범</span>
                                <span>배지현</span>
                                <span>김민수</span>
                                <span>경민영</span>
                            </li>
                            <li>
                                <span>대표메일 : turtlegim@gmail.com</span>
                            </li>
                        </ul>
                    </div>
                    <div class="escrow">
                        <strong>서블릿 MVC2 패턴과 오라클 DB[PL-SQL] 활용</strong>
                        <span>
                            2022년 03월 18일까지 열심히 한 프로젝트입니다. 예쁘게 봐주세요.
                        </span>
                        <p>주식회사 현대 IT&E 2조</p>
                        <p>2조 is awsome</p>
                        <!--//award-->
                    </div>
                </div>
        </footer>
    </div>
</body>

</html>