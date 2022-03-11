<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
    <link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
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
    
    <script
  		src="https://code.jquery.com/jquery-3.4.1.min.js"
  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  		crossorigin="anonymous"></script>
  		
	<script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    
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
			location.href = "${action}/hdmall/jsp/main.jsp";
		}

        // join.jsp 에게 로그인 화면에서 넘어왔다는 것을 알려주는 함수 - 03.07 경민영
        function sendJoin() {
            localStorage.setItem('join', 'fromLogin');
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
	<%
		Cookie[] cookie = request.getCookies();
		String userId = "";
		if(cookie != null){
		    for(int i = 0; i < cookie.length; i++){
		        if(cookie[i].getName().trim().equals("userId")){
		            System.out.println(cookie[i].getValue());
		            userId = cookie[i].getValue();
		        }
		    }
		}
	%>
    <header id="header">
        <section class="box">
            <a href="javascript:" class="btn_gnb">Navigation Drawer</a>
            <h1 onclick="goMainPage();" style="cursor: pointer; height: 48px"><img id="mainLogo" src="${action}/hdmall/image/logo.png">
            </h1> <!-- 로고 이미지 src 변경 부분 -->
			
            <div class="default_menu">
            	<a href="${action}/hdmall/login" id="loginBtn">로그인</a>
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
                <div style="width: 430px; margin: 0 auto; margin-top: 10px; margin-bottom: 150px;">
                    <h1 class="h1_type">로그인</h1>
                    <div id="login01">
                        <form method="post" action="${action}/hdmall/login" autocomplete="off">
                            <div class="join_form">
                                <div class="join_row">
                         
                                    <input type="text" id="userId" name="userId" value="<%= userId %>" placeholder="아이디"
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
                                    <input type="checkbox" name="id_rem" id="id_rem" <% if(userId.length() > 1) out.println("checked"); %> >
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

    <!-- footer start 배지현 (03.0) -->
    <div class="wrap">
        <footer id="footer">
            <div class="policy">
                <div class="copy">
                    <div class="copyright">
                        <div class="logo">
                            <!-- <span onclick="moveToMain();" style="cursor:pointer;">HYUNDAI DEPARTMENT SHOP - DUTY FREE</span>-->
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