<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Momeche 베스트 게시판</title>
        <!-- Favicon-->
        <link rel="icon" type="resources/image/x-icon" href="resources/assets/favicon.ico" />


        
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        <script src="resources/js/scripts.js"></script>
    </head>
    <body>
    
    	        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">추천</h1>
                    <p class="lead fw-normal text-white-50 mb-0">추천창 입니다.</p>
                </div>
            </div>
        </header>

        <div class = "user_best_all"> <!-- black-->
            <div class = "user_best_text">
                유저 BEST!!
                <a  class="table_top_text_a" href="#">더보기</a>
            </div>
            <hr width="86%">
            <div class = "user_best_prd-row1"> <!-- blue-->
                <ul class = "user_best_prd_ul"> <!--청록-->
                    <li class = "user_best_prd-box-li1">
                        <div class = "best-prd-box">
                            <div class = "user_best-prd-thumb">
                                <a href="#"><img src="resources/image/perfume/wood1.jpg"></a>
                            </div>
                            <div class = "box-table">
                                <table class="contents_table">
                                    <tr>
                                        <th>제목</th>
                                        <td><a href="#">처음으로 구매했던 향수인데 추천해드립니다.</a></td>
                                    </tr>
                                    <tr>
                                        <th>작성자</th>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <th>작성날짜</th>
                                        <td>2021-11-26</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </li>

                    <li class = "user_best_prd-box-li1">
                        <div class = "best-prd-box">
                            <div class = "user_best-prd-thumb">
                                <a href="#"><img src="resources/image/perfume/black.jpg"></a>
                            </div>
                            <div class = "box-table">
                                <table class="contents_table">
                                    <tr>
                                        <th>제목</th>
                                        <td><a href="#">무난하게 쓰기 좋은 가성비 향수 추천</a></td>
                                    </tr>
                                    <tr>
                                        <th>작성자</th>
                                        <td>박지성</td>
                                    </tr>
                                    <tr>
                                        <th>작성날짜</th>
                                        <td>2021-11-26</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </li>

                    <li class = "user_best_prd-box-li1">
                        <div class = "best-prd-box">
                            <div class = "user_best-prd-thumb">
                                <a href="#"><img src="resources/image/perfume/timeout1.jpg"></a>
                            </div>
                            <div class = "box-table">
                                <table class="contents_table">
                                    <tr>
                                        <th>제목</th>
                                        <td><a href="#">내돈내산 향수 추천 및 후기 입니다.</a></td>
                                    </tr>
                                    <tr>
                                        <th>작성자</th>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <th>작성날짜</th>
                                        <td>2021-11-26</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class= "momeche-best">
                <div class = "user_best_text">
                    Momeche 추천
                    <a  class="table_top_text_a" href="#"><button>목록</button></a>
                </div>
                <hr width="86%">
                <div class = "user_best_prd-row1"> <!-- blue-->
                    <ul class = "user_best_prd_ul"> <!--청록-->
                        <li class = "user_best_prd-box-li1">
                            <div class = "best-prd-box">
                                <div class = "user_best-prd-thumb">
                                    <a href="#"><img src="resources/image/perfume/wood1.jpg"></a>
                                </div>
                                <div class = "momeche_best-title">
                                    <a href="#"> [디스퀘어드2] 디스퀘어드2 우드 뿌르 옴므 EDT</a>
                                </div>
                            </div>
                        </li>
    
                        <li class = "user_best_prd-box-li1">
                            <div class = "best-prd-box">
                                <div class = "user_best-prd-thumb">
                                    <a href="#"><img src="resources/image/perfume/dior_wo.jpg"></a>
                                </div>
                                <div class = "momeche_best-title">
                                    <a href="#">[디올] 디올 미스 디올 블루밍 부케 EDT</a>
                                </div>
                            </div>
                        </li>
    
                        <li class = "user_best_prd-box-li1">
                            <div class = "best-prd-box">
                                <div class = "user_best-prd-thumb">
                                    <a href="#"><img src="resources/image/perfume/john vavatos.jpg"></a>
                                </div>
                                <div class = "momeche_best-title">
                                    <a href="#">[존 바바토스] 존 바바토스 아티산 EDT</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
         </div>
    	

	</body>
</html>