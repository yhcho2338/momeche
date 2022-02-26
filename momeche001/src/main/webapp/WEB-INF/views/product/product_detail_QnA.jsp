<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 
 
<!DOCTYPE html>
<html>

     <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Momeche</title>
        <!-- Favicon-->
        <link rel="icon" type="resources/image/x-icon" href="assets/favicon.ico" />


        
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

         <!-- Section-->
        <div class="text-center">
        <h1><strong>- 상품 상세페이지 -</strong></h1>
        <hr width="63%">
        </div>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">

                <div class="product-main-detail" style = "border:3px solid red">
                    <div class="product-main-first" style = "border:3px solid rgb(0, 255, 157)">
                    <div class="product-main-image-area" alt="" style = "border:3px solid rgb(0, 68, 255)">
                        <div class="product-main-image" alt="" style = "border:3px solid rgb(0, 238, 255)">
                                <span><img src="resources/image/product_001.jpg"></span>
                                <span><img src="resources/image/product_001.jpg"></span>
                                <span><img src="resources/image/product_001.jpg"></span>
                                <span><img src="resources/image/product_001.jpg"></span>

                        </div>


                            <script type="text/javascript"> 
                                $('.product-main-image').slick();
                             
                             
                                 </script>
                        
                        </div>

	<div class="product-main-introduce" style = "border:3px solid rgb(255, 187, 0)">
                            <div class="product-introduce-area">
                                <div class="product-name-area">[디스퀘어드2] 디스퀘어드2 우드 뿌르 옴므 EDT 50ml</div>
                                <hr width="100%">


                                <div class="product-price-area">    <!-- 실제 사용할 외곽라인은 css에 --> 
                                    
                                    <div class="product-price-name-area">
                                        판매가 <br>
                                        소비자원가 <br> 
                                        적립금 <br> 
                                        
                                    </div>

                                    <div class="product-price-price-area">
                                        10.000원 <br>
                                        15.000원 <br> 
                                        500원 <br> 
                                        
                                    </div>
                            
                                </div>


                                <!-- 상품 상세 옵션 -->
                                <div class="product-option-area"> 
                                    <div class="product-option1">
                                        <tr>
                                            <th scope="row">사이즈</th>
                                                <td>
                                                    <select>
                                                        <option value="*" selected="" link_image="">- 옵션을 선택해 주세요 -</option>
                                                                            <option value="**" disabled="" link_image="">-------------------</option>
                                                                            <option value="" link_image="">1</option>
                                                                            <option value="" link_image="">2</option>
                                                                            <option value="" link_image="">3</option>
                                                                            <option value="" link_image="">4</option>
                                                    </select>
                                                    <p class="value"></p>
                                                </td>
                                        </tr>
                                    </div>

                                    <div class="product-option2">
                                        <tr>
                                            <th scope="row">공병추가</th>
                                                <td>
                                                    <select>
                                                        <option value="*" selected="" link_image="">- 옵션을 선택해 주세요 -</option>
                                                                            <option value="**" disabled="" link_image="">-------------------</option>
                                                                            <option value="" link_image="">1</option>
                                                                            <option value="" link_image="">2</option>
                                                                            <option value="" link_image="">3</option>
                                                                            <option value="" link_image="">4</option>
                                                    </select>
                                                    <p class="value"></p>
                                                </td>
                                        </tr>
                                    
                                    </div>
                                </div>


                            <div class="product-final-price-area"> 
                                    <div class="product-final-price">
                                    총 100.000원
                                    </div>


                            </div>
                                   
                            <div class="product-order-area">
                                <div class="goods-order-button">
                                    <a class="button" href="#"><h1>주문하기</h1></a>
                                    
                                </div>

                                <div class="goods-cart-button">
                                    <a class="button" href="#"><h1>장바구니</h1></a>
                                    
                                </div>

                                <div class="goods-favorite-button">
                                    <a class="button" href="#"><h1>관심상품 등록</h1></a>
                                    
                                </div>
                            </div>
                            
                            </div>
           
                        </div>
                        
                        <hr width="80%" style="margin-top:10px;"> 

                        <!--시작 - 서브 이미지 슬라이드 부분-->
                        <div class="product-serve-image-area" alt="" style = "border:3px solid rgb(0, 238, 255)">
                            <div class= "product-serve-image">
                                <span><img src="resources/image/product_001.jpg"></span>
                                <span><img src="resources/image/product_001.jpg"></span>
                                <span><img src="resources/image/product_001.jpg"></span>
                                <span><img src="resources/image/product_001.jpg"></span>

                            </div>

                         

                        </div>
                        

                        <!-- 끝 - 서브 이미지 슬라이드 부분-->

                    </div>
                   
                    </div>
                </div>
            </div>

            <!-- 상세페이지 내부 이동 텝-->
            <div class="tab-area" style = "border:3px solid red"> 
                <div class="tab-area-space" style = "border:3px solid rgb(0, 255, 157)">
                 <ul class="tab-area-nav">
                        <li class="tab_open" id="tab01"><a href="#none">상품상세정보</a></li>
                        <li class="det_bar">|</li>
                        <li id="tab02" class=""><a href="#none">상품사용후기</a></li>
                        <li class="det_bar">|</li>
                        <li id="tab03" class=""><a href="#none">상품 Q&amp;A</a></li>
                        <li class="det_bar">|</li>
                        <li id="tab04" class=""><a href="#none">상품구매안내</a></li>
                </ul>
                </div>
            </div> 
            
             <!-- 상세페이지 내부 QnA 페이지 -->
            <div class="goods-QnA-area" style = "border:3px solid red">
                <div class="goods-QnA-title" style = "border:3px solid rgb(145, 255, 0)"> 
                    <h1>상품문의</h1>
                    <hr width="63%">
                </div>

                <div class="goods-QnA-list-area">
                    <table class="goods-QnA-list" style = "border:3px solid green"" >
                       <thead>
                        <tr>
                            <th>번호</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>작성일</th>
                                
                        </tr>
                        </thead>

                        <!-- 샘플 게시글 시작 (삭제해도 무방함) -->
                        <tbody>
                            <tr>
                                <td>02</td>
                                <td>홍길동</td>
                                <td>물건 언제 입고되나요?</td>
                                <td>2021-11-27</td>
                                
                            </tr> 
                            <tr>
                                <td>01</td>
                                <td>고길동</td>
                                <td>물건 재고 많이 있나요?</td>
                                <td>2021-11-25</td>
                                
                            </tr>    
                        </tbody>
                        <!-- 샘플 게시글 끝 -->
                            
                    </table>
                </div>

                <div class= "product-QnA-add-button" style = "border:3px solid rgb(145, 255, 0)">
                    <a class="button" href="#"><h5>작성하기</h5></a>
                </div>

                <div class= "pagenation" style = "border:3px solid rgb(145, 255, 0)">
                    <a class="pagination-button-prev-page">&lt;</a>
                    <a class="pagination_button-active" href="#">1</a>
                    <a class="pagination_button-active" href="#">2</a>
                    <a class="pagination_button-active" href="#">3</a>
                    <a class="pagination_button-active" href="#">4</a>
                    <a class="pagination_button-active" href="#">5</a>
                    <a class="pagination-button-next-page" href="#" data-remote="true">&gt;</a>
                
                </div>


            </div>
            
            </section>

	</body>
</html>