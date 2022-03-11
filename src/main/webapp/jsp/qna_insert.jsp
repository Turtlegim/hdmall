<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="ko">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
            <script type="text/javascript"
                src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
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

        <body>
            <script type="text/javascript">
                function goMainPage() {
                    sessionStorage.setItem("selMainSwiperPos", 1);
                    location.href = "main.jsp";
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

            <header id="header">
                <section class="box">
                    <a href="javascript:" class="btn_gnb">Navigation Drawer</a>
                    <h1 onclick="goMainPage();" style="cursor: pointer; height: 48px">
                        <img id="mainLogo" src="${action}/hdmall/image/logo.png">
                    </h1>
                    <!-- 로고 이미지 src 변경 부분 -->

            <div class="default_menu">
            <%
				String userName = (String)session.getAttribute("userName");
			%>
			<%if (userName != null) { %>
				<a> <%=userName%>님 </a>
				<a href="${action}/hdmall/logout" id="logoutBtn">로그아웃</a>
			<%}else { %> 
				<a href="${action}/hdmall/jsp/login.jsp" id="loginBtn">로그인</a>
			<%} %>
                <ul>
                    <li class="item_01">
                        <a href="like.html">찜하기</a>
                    </li>
                    <li class="item_03">
                        <a href="${action}/hdmall/jsp/mypage.jsp">마이현대</a>
                    </li>
                    <li class="item_04">
                        <a href="${action}/hdmall/jsp/qna_insert.jsp">고객센터</a>
                    </li>
                </ul>
            </div>

                    <!-- 히든메뉴 START -->
                    <script type="text/javascript">
                        function commOpenLayer(cookieChkYn, hiddenYn) {
                            $
                                .ajax({
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
                                                        var link = data.dataList[j].linkUrl != null ? data.dataList[j].linkUrl
                                                            : "javascript:";

                                                        var wiseLog = "";
                                                        if (link != "javascript:") {
                                                            if (link.indexOf("?") != -1) {
                                                                wiseLog = "&MG=KR_PC_Main_Popup"
                                                                    + data.popSeqList[i].popSeq
                                                                    + "_"
                                                                    + data.dataList[j].popDtlSeq;
                                                            } else {
                                                                wiseLog = "?MG=KR_PC_Main_Popup"
                                                                    + data.popSeqList[i].popSeq
                                                                    + "_"
                                                                    + data.dataList[j].popDtlSeq;
                                                            }
                                                        }

                                                        if (data.dataList[j].shrtVdoUrl != null) {
                                                            html += "<video preload=\"none\" muted loop class='video-js'  style='width:560px; height:368px; object-fit:cover; background-color: black;'>";
                                                            html += "<source src=\"https://cdn.hddfs.com/files/" + data.dataList[j].shrtVdoUrl + "\" type=\"video/mp4\">";
                                                            html += "<strong>Your browser does not support the video tag.</strong>";
                                                            html += "</video>";
                                                        } else {
                                                            var mainTitl = data.dataList[j].mainTitl != null ? data.dataList[j].mainTitl
                                                                : "";
                                                            var subTitl = data.dataList[j].subTitl != null ? data.dataList[j].subTitl
                                                                : "";
                                                            var bnnrWrd = data.dataList[j].bnnrWrd != null ? data.dataList[j].bnnrWrd
                                                                : "";

                                                            html += "<a href=\"" + link + wiseLog + "\"  class='item_wrap'>";
                                                            html += "<div class='pop_txt'>";
                                                            html += "<strong class='cate'>"
                                                                + mainTitl
                                                                + "</strong>";
                                                            html += "<p>" + subTitl
                                                                + "</p>";
                                                            html += "<p>" + bnnrWrd
                                                                + "</p>";
                                                            html += "</div>";
                                                            html += "<img src=\"https://cdn.hddfs.com/files/"
                                                                + data.dataList[j].imgUrl
                                                                + "?RS=750X494\" alt=\""
                                                                + data.dataList[j].mainTitl
                                                                + "\">";
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
                                            html += "<input type=\"checkbox\" class=\"today_close\" id=\"btn_hidden_layer_"
                                                + data.popSeqList[i].popSeq
                                                + "\" onclick=\"saveMainLayerCookie("
                                                + data.popSeqList[i].popSeq
                                                + ");\" hiddenYn=\"N\" />";
                                            html += "<label for=\"btn_hidden_layer_" + data.popSeqList[i].popSeq + "\" style=\"cursor: pointer;\">오늘 하루 보지 않기</label>";
                                            html += "</span>";
                                            html += "<span class=\"popup_close\"  data-seq=\""
                                                + data.popSeqList[i].popSeq
                                                + "\" onclick=\"closeMainLayer("
                                                + data.popSeqList[i].popSeq
                                                + ");\">닫기</span>";
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
                                <li><strong>전체서비스</strong>
                                    <ul class="depth_02 serviceMenu">
                                        <li><a href="best.html"> 베스트</a></li>
                                        <li><a href="product_list.html"> 신상품</a></li>
                                        <li><a href="q&a_insert.html"> 고객센터</a></li>
                                    </ul>
                                </li>
                                <li><strong>카테고리</strong>
                                    <ul class="depth_02 serviceCtgList">
                                        <li><a href="product_list.html"> 여성캐쥬얼</a></li>
                                        <li><a href="product_list.html"> 남성캐쥬얼</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        </div>
                        <button class="gnb_close">닫기</button>
                    </nav>
            </header>

            <div id="wrap">
                <!-- 하단부 레이아웃을 위해서는 wrap 꼭 남겨두기 -->
                <!-- container -->
                <main id="container" class="container">
                    <style type="text/css">
                        span.file_span:hover {
                            text-decoration: underline;
                            cursor: pointer;
                        }
                    </style>
                    
					<!-- 저장 alert 함수 배지현 03/11 -->
                    <script type="text/javascript">
                        function fnSaveCoun() {
                            var title = $('#title').val();
                            var context = $('#context').val();
                            
                            if (title == "" || context == "") {
                                alert("제목과 내용을 작성해주세요.");
                                
                            } else if (confirm("문의를 등록하시겠습니까?")) {
                            		alert("등록되었습니다.");
									return true;
                            }
                            return false;
                        }
                        <!-- 취소 input값초기화 함수 배지현 03/11 -->
                        function fnClearForm() {
                            if (confirm("문의등록을 취소하시겠습니까?")) {
                                $("#title").val("");
                                $("#context").val("");
                            }
                        }

                    </script>

                    <section>
                        <div style="width: 760px; margin: 0 auto; margin-top: 60px">
                            <div>
                                <h3 class="h3_type line">문의사항</h3>
                                <ul class="dot_list mgts">
                                    <li>문의하신 내용에 대한 답변은 마이페이지&gt; 문의내역 에서 확인하실 수 있습니다.</li>
                                    <br>
                                </ul>
                                <form id="counForm" name="counForm" method="post" action="${action}/hdmall/QBoardIns"
                                onsubmit="return fnSaveCoun()">
                                    <div class="counsel_write">
                                        <table class="tb_write01 vm">
                                            <caption>문의사항</caption>
                                            <colgroup>
                                                <col style="width: 160px">
                                                <col style="width: auto">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">성명</th>
                                           			<% String id = (String)session.getAttribute("userId");
                                                       String usernm = (String)session.getAttribute("userName");%>
                                                    <td><%=userName%></td> 
                                                </tr>
                                                <tr>
                                                    <th scope="row">제목<em class="essential">*</em></th>
                                                    <td><input type="text" class="required" valMsg="제목을 입력해주세요."
                                                            id="title" name="title" value="" placeholder="제목을 입력해주세요."
                                                            style="width: 100%" maxlength="50" onpaste="false;"></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">내용<em class="essential">*</em></th>
                                                    <td>
                                                        <div class="textarea_wrap">
                                                            <textarea placeholder="내용을 입력해주세요." id="context"
                                                                name="context" maxlength="500"
                                                                class="required"></textarea>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="sh_btn_box">
                                            <button type="button" class="btn_basic1" id="cancelCoun"
                                                onclick="fnClearForm();">취소</button>
                                            <button type="submit" class="btn_basic2" id="saveCoun"
                                                >확인</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </main>
            </div>

            <!-- footer start 배지현 (03.0) -->
            <div id="wrap">
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
                                    <li><span>김기범</span> <span>배지현</span> <span>김민수</span> <span>경민영</span>
                                    </li>
                                    <li><span>대표메일 : turtlegim@gmail.com</span></li>
                                </ul>
                            </div>
                            <div class="escrow">
                                <strong>서블릿 MVC2 패턴과 오라클 DB[PL-SQL] 활용</strong> <span> 2022년
                                    03월 18일까지 열심히 한 프로젝트입니다. 예쁘게 봐주세요. </span>
                                <p>주식회사 현대 IT&E 2조</p>
                                <p>2조 is awsome</p>
                                <!--//award-->
                            </div>
                        </div>
                </footer>
            </div>
        </body>

    </html>