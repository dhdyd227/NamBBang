<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script type="text/javascript">
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
                    jQuery.ajax({
                        url: "ajaxSetle.do", //전달할 서버,cross-domain error가 발생하지 않도록 주의해주세요
                        type: 'POST',
                        data: {
                            imp_uid: rsp.imp_uid   //결제승인코드
                            , pay_method: rsp.pay_method //결제수단
                            , paid_amount: rsp.paid_amount //결제금액
                            , merchant_uid: rsp.merchant_uid // 결제번호
                            , mlg_use_amount : //마일리지 사용금액
                            //결제일시
                            , order_group_no : //주문그룹번호
                            //기타 필요한 데이터가 있으면 추가 전달
                        }
                    }).done(function (data) {
                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        var everythings_fine = data;  //true, false로 전달
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
    </script>
</head>

<body>

</body>

</html>