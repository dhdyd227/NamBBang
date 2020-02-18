<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Insert title here</title>
 
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>



    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width : 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script type="text/javascript">
        window.addEventListener("load", function () {
            btn.addEventListener("click", function () {

                var IMP = window.IMP; // 생략가능
                IMP.init('imp73961880'); //"가맹점 식별코드"를 사용

                IMP.request_pay({
                    pg: 'kakaopay', // version 1.1.0부터 지원.
                    pay_method: 'card',
                    merchant_uid: new Date().getTime(),
                    name: '{%=주문번호%}',
                    amount: '10000',//'{%=결제될금액%}',
                    buyer_tel: '010-1234-5678',
                    m_redirect_url: '결제완료후 페이지이동'
                }, function (rsp) {
                    if (rsp.success) {
                        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                        $.ajax({
                            url: "ajaxSetle.do", //전달할 서버,cross-domain error가 발생하지 않도록 주의해주세요
                            type: 'POST',
                            data: {
                                imp_uid: rsp.imp_uid //결제승인코드
                                ,
                                pay_method: rsp.pay_method //결제수단
                                ,
                                paid_amount: rsp.paid_amount //결제금액
                                ,
                                merchant_uid: rsp.merchant_uid
                                // 결제번호
                                //   , mlg_use_amount: //마일리지 사용금액
                                //결제일시
                                //  , order_group_no: //주문그룹번호
                                //기타 필요한 데이터가 있으면 추가 전달
                            }
                        }).done(function (data) {
                            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                            var everythings_fine = data; //true, false로 전달
                            if (everythings_fine) {
                                var msg = '결제가 완료되었습니다.';
                                msg += '결제번호 : ';
                                msg += '결제수단' + rsp.pay_method;
                                msg += '결제승인코드' + rsp.imp_uid;
                                msg += '결제금액' + rsp.paid_amount;
                                msg += '마일리지 사용금액';
                                msg += '결제일시';
                                msg += '주문그룹번호';

                                alert(msg);
                            } else {

                                var msg = '오류가 발생했습니다..';
                                msg += '에러내용 : ' + rsp.error_msg;
                                //[3] 아직 제대로 결제가 되지 않았습니다.
                                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                                alert(msg);
                                //실패시 이동할 페이지

                            }
                        });
                        //성공시 이동할 페이지
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                        //실패시 이동할 페이지
                        alert(msg);
                    }
                });

            });
        });
    </script>
</head>

<body class="bg-light">
    <div class="container">
        <div class="py-5 text-center"></div>
        <form class="needs-validation" method="POST" action="">
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">주문 확인</span> <span class="badge badge-secondary badge-pill"></span>
                    </h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">주문그룹번호</h6>
                                <small class="text-muted">Brief description</small>
                            </div> <span class="text-muted">12원</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">총 주문 금액</h6>
                                <small class="text-muted">Brief description</small>
                            </div> <span class="text-muted">8원</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">마일리지 사용금액</h6>
                                <small class="text-muted">Brief description</small>
                            </div> <span class="text-muted">5원</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between bg-light">
                            <div class="text-success">
                                <h6 class="my-0">Promo code</h6>
                                <small>EXAMPLECODE</small>
                            </div> <span class="text-success">-5원</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between"><span>결제금액</span>
                            <strong>20원</strong></li>
                    </ul>


                    <div class="input-group">
                        <hr class="mb-4">
                        <button id="btn" name="btn" class="btn btn-primary btn-lg btn-block" type="button">결제하기</button>
                    </div>

                </div>

                <div class="col-md-8 order-md-1">
                    <h2 class="mb-3">주문서 작성/결제</h2>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <img src="../userimages/product_1.png" />
                            <!--제품이미지 출력-->
                        </div>
                        <div class="col-md-8 mb-3" style="padding-top: 40px;">
                            <!--제품정보 출력-->
                            <div class="col-md-12 mb-3">
                                <!-- 주문번호 -->
                                <h5>ACL120UASKCG</h5>
                            </div>
                            <div class="col-md-12 mb-3">
                                <!-- 제품이름 -->
                                <h3>공기청정기 12평형</h3>
                            </div>
                            <div class="col-md-12 mb-3">
                                <!--제품수량 가격-->
                                <h5>수량 1 &nbsp;&nbsp; 799,000원</h5>
                            </div>
                        </div>
                    </div>
                    <div class="progress border" style="height: 1px;">
                        <div class="progress-bar bg-light" style="width: 100%;"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <img src="../userimages/product_2.png" />
                            <!--제품이미지 출력-->
                        </div>
                        <div class="col-md-8 mb-3" style="padding-top: 40px;">
                            <!--제품정보 출력-->
                            <div class="col-md-12 mb-3">
                                <!-- 주문번호 -->
                                <h5>ACL120UASTYH</h5>
                            </div>
                            <div class="col-md-12 mb-3">
                                <!-- 제품이름 -->
                                <h3>공기청정기 12평형</h3>
                            </div>
                            <div class="col-md-12 mb-3">
                                <!--제품수량 가격-->
                                <h5>수량 1 &nbsp;&nbsp; 555,000원</h5>
                            </div>
                        </div>
                    </div>

                    <div class="progress border" style="height: 1px;">
                        <div class="progress-bar bg-light" style="width: 100%;"></div>
                    </div>

                    <div class="row" style="padding-top: 30px;">

                        <div class="col-md-3 mb-3">
                            <h5>휴대전화 번호</h5>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input type="text" class="form-control" id="phon" placeholder="- 없이 숫자만 입력해 주세요." value=""
                                required>
                            <div class="invalid-feedback">Valid first name is required.
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 30px;">
                        <div class="col-md-3 mb-3">
                            <h5>마일리지</h5>
                        </div>
                        <div class="col-md-4 mb-3">
                            <input type="text" class="form-control" id="phon" placeholder="" value="" required>
                            <div class="invalid-feedback">Valid first name is required.
                            </div>
                        </div>
                        <div class="col-md-5 mb-3">
                            원 &nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp; <span style="color: crimson;"> 160 원 </span>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 30px;">
                        <div class="col-md-3" style="margin-top: 30px;">
                            <h5>결제 수단</h5>
                        </div>
                        <div class="col-md-9">
                            <button type="button" class="btn btn-outline-light">
                                <img src="../sellviews/images/카카오페이.png" style="width: 100px; height: 100px;" />
                            </button>
                        </div>
                    </div>
                    <hr class="mb-3">


                </div>
            </div>
        </form>
        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">&copy; 2020.01-2020.03 Nambbang</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Support</a></li>
            </ul>
        </footer>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="form-validation.js"></script>
    <script>
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation')

            // Loop over them and prevent submission
            Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        }, false)
    </script>
</body>

</html>