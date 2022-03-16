<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
    
	<link rel="icon" type="image/png" sizes="96x96" href="${action}/hdmall/image/favicon-96x96.png">
    <link rel="stylesheet" href="/inc/user/css/V2Join.css?20210420">
    <link rel="stylesheet" href="/assets/app/css/swiper.min.css">
    <link rel="stylesheet" href="/assets/app/css/screen.ui.css?version=202202170001" />
    <link rel="stylesheet" href="${action}/hdmall/css/footer.css">
	<link rel="stylesheet" href="${action}/hdmall/css/myhundai.css">

<body>
    <script type="text/javascript">
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

<%@ include file="header.jsp" %>


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

        <!-- 배지현 : 저장 alert 함수 배지현-->
        <script type="text/javascript">
            function fnSaveCoun() {
                var title = $('#title').val();
                var context = $('#context').val();

                if (title == "" || context == "") {
                    alert("제목과 내용을 작성해주세요.");

                } else if (confirm("문의를 등록하시겠습니까?")) {
                    alert("등록되었습니다. 문의하신 내용에 대한 답변은 마이페이지 문의내역 에서 확인하실 수 있습니다.");
                    return true;
                }
                return false;
            }
            <!-- 배지현 : 취소시 input박수 값 초기화 함수  -->
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
                    <!-- 배지현 : 문의등록폼 배지현-->
                    <form id="counForm" name="counForm" method="post"
                        action="${action}/hdmall/QBoardIns" onsubmit="return fnSaveCoun()">
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
                                        <% String id=(String)session.getAttribute("userId"); String
                                            usernm=(String)session.getAttribute("userName");%>
                                            <td>
                                                <%=userName%>
                                            </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">제목<em class="essential">*</em></th>
                                        <td><input type="text" class="required" valMsg="제목을 입력해주세요."
                                                id="title" name="title" value=""
                                                placeholder="제목을 입력해주세요." style="width: 100%"
                                                maxlength="50" onpaste="false;"></td>
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
                                <button type="submit" class="btn_basic2" id="saveCoun">확인</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>
</div>

<%@ include file="footer.jsp" %>