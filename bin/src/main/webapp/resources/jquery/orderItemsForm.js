function execDaumPostcode() {
    new daum.Postcode(
            {
                oncomplete : function(data) {

                    var fullRoadAddr = data.roadAddress;
                    var extraRoadAddr = '';

                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                + data.buildingName : data.buildingName);
                    }
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                    }

                    document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('roadAddress').value = fullRoadAddr;
                    document.getElementById('jibunAddress').value = data.jibunAddress;

                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress
                                + extraRoadAddr;
                        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                                + expRoadAddr + ')';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                                + expJibunAddr + ')';

                    } else {
                        document.getElementById('guide').innerHTML = '';
                    }
                }
            }).open();
}

window.onload = function() {
    init();
}

function init() {
    var form_order = document.form_order;
    var h_tel1 = form_order.h_tel1;
    var h_hp1 = form_order.h_hp1;
    var tel1 = h_tel1.value;
    var hp1 = h_hp1.value;
    var select_tel1 = form_order.tel1;
    var select_hp1 = form_order.hp1;
    select_tel1.value = tel1;
    select_hp1.value = hp1;
}

var $receiverName = $("#receiver_name");
var $hp1 = $("#hp1");
var $hp2 = $("#hp2");
var $hHp1 = $("#h_hp1");
var $namujiAddress = $("#namujiAddress");
var $sameAsMem = $("#sameAsMem");

$sameAsMem.change(function(){
    if($sameAsMem.attr("checked")){
        $receiverName.val("C");
        $hp1.val("010");
        $hp2.val("0000");
        $hHp1.val("0000");
        $namujiAddress.val("c");
    } else {
        $receiverName.val("");
        $hp1.val("");
        $hp2.val("");
        $hHp1.val("");
        $namujiAddress.val("");
    }

});

function reset_all() {
    var e_receiver_name = document.getElementById("receiver_name");
    var e_hp1 = document.getElementById("hp1");
    var e_hp2 = document.getElementById("hp2");
    var e_hp3 = document.getElementById("hp3");

    var e_tel1 = document.getElementById("tel1");
    var e_tel2 = document.getElementById("tel2");
    var e_tel3 = document.getElementById("tel3");

    var e_zipcode = document.getElementById("zipcode");
    var e_roadAddress = document.getElementById("roadAddress");
    var e_jibunAddress = document.getElementById("jibunAddress");
    var e_namujiAddress = document.getElementById("namujiAddress");

    e_receiver_name.value = "";
    e_hp1.value = 0;
    e_hp2.value = "";
    e_hp3.value = "";
    e_tel1.value = "";
    e_tel2.value = "";
    e_tel3.value = "";
    e_zipcode.value = "";
    e_roadAddress.value = "";
    e_jibunAddress.value = "";
    e_namujiAddress.value = "";
}

function restore_all() {
    var e_receiver_name = document.getElementById("receiver_name");
    var e_hp1 = document.getElementById("hp1");
    var e_hp2 = document.getElementById("hp2");
    var e_hp3 = document.getElementById("hp3");

    var e_tel1 = document.getElementById("tel1");
    var e_tel2 = document.getElementById("tel2");
    var e_tel3 = document.getElementById("tel3");

    var e_zipcode = document.getElementById("zipcode");
    var e_roadAddress = document.getElementById("roadAddress");
    var e_jibunAddress = document.getElementById("jibunAddress");
    var e_namujiAddress = document.getElementById("namujiAddress");

    var h_receiver_name = document.getElementById("h_receiver_name");
    var h_hp1 = document.getElementById("h_hp1");
    var h_hp2 = document.getElementById("h_hp2");
    var h_hp3 = document.getElementById("h_hp3");

    var h_tel1 = document.getElementById("h_tel1");
    var h_tel2 = document.getElementById("h_tel2");
    var h_tel3 = document.getElementById("h_tel3");

    var h_zipcode = document.getElementById("h_zipcode");
    var h_roadAddress = document.getElementById("h_roadAddress");
    var h_jibunAddress = document.getElementById("h_jibunAddress");
    var h_namujiAddress = document.getElementById("h_namujiAddress");
    //alert(e_receiver_name.value);
    e_receiver_name.value = h_receiver_name.value;
    e_hp1.value = h_hp1.value;
    e_hp2.value = h_hp2.value;
    e_hp3.value = h_hp3.value;

    e_tel1.value = h_tel1.value;
    e_tel2.value = h_tel2.value;
    e_tel3.value = h_tel3.value;
    e_zipcode.value = h_zipcode.value;
    e_roadAddress.value = h_roadAddress.value;
    e_jibunAddress.value = h_jibunAddress.value;
    e_namujiAddress.value = h_namujiAddress.value;

}

function fn_pay_phone() {

    var e_card = document.getElementById("tr_pay_card");
    var e_phone = document.getElementById("tr_pay_phone");
    e_card.style.visibility = "hidden";
    e_phone.style.visibility = "visible";
}

function fn_pay_card() {
    var e_card = document.getElementById("tr_pay_card");
    var e_phone = document.getElementById("tr_pay_phone");
    e_card.style.visibility = "visible";
    e_phone.style.visibility = "hidden";
}

function imagePopup(type) {
    if (type == 'open') {
        jQuery('#layer').attr('style', 'visibility:visible');

        jQuery('#layer').height(jQuery(document).height());
    }

    else if (type == 'close') {

        jQuery('#layer').attr('style', 'visibility:hidden');
    }
}

var goods_id = "";
var goods_title = "";
var goods_fileName = "";

var order_goods_qty
var each_goods_price;
var total_order_goods_price;
var total_order_goods_qty;
var orderer_name
var receiver_name
var hp1;
var hp2;
var hp3;

var tel1;
var tel2;
var tel3;

var receiver_hp_num;
var receiver_tel_num;
var delivery_address;
var delivery_message;
var delivery_method;
var gift_wrapping;
var pay_method;
var card_com_name;
var card_pay_month;
var pay_orderer_hp_num;

function fn_show_order_detail() {
    goods_id = "";
    goods_title = "";

    var frm = document.form_order;
    var h_goods_id = frm.h_goods_id;
    var h_goods_title = frm.h_goods_title;
    var h_goods_fileName = frm.h_goods_fileName;
    var r_delivery_method = frm.delivery_method;
    var h_order_goods_qty = document.getElementById("h_order_goods_qty");
    var h_total_order_goods_qty = document
            .getElementById("h_total_order_goods_qty");
    var h_total_sales_price = document
            .getElementById("h_total_sales_price");
    var h_final_total_Price = document
            .getElementById("h_final_total_Price");
    var h_orderer_name = document.getElementById("h_orderer_name");
    var i_receiver_name = document.getElementById("receiver_name");

    if (h_goods_id.length < 2 || h_goods_id.length == null) {
        goods_id += h_goods_id.value;
    } else {
        for (var i = 0; i < h_goods_id.length; i++) {
            goods_id += h_goods_id[i].value + "<br>";

        }
    }

    if (h_goods_title.length < 2 || h_goods_title.length == null) {
        goods_title += h_goods_title.value;
    } else {
        for (var i = 0; i < h_goods_title.length; i++) {
            goods_title += h_goods_title[i].value + "<br>";

        }
    }

    if (h_goods_fileName.length < 2 || h_goods_fileName.length == null) {
        goods_fileName += h_goods_fileName.value;
    } else {
        for (var i = 0; i < h_goods_fileName.length; i++) {
            goods_fileName += h_goods_fileName[i].value + "<br>";

        }
    }

    total_order_goods_price = h_final_total_Price.value;
    total_order_goods_qty = h_total_order_goods_qty.value;

    for (var i = 0; i < r_delivery_method.length; i++) {
        if (r_delivery_method[i].checked == true) {
            delivery_method = r_delivery_method[i].value
            break;
        }
    }

    var r_gift_wrapping = frm.gift_wrapping;

    for (var i = 0; i < r_gift_wrapping.length; i++) {
        if (r_gift_wrapping[i].checked == true) {
            gift_wrapping = r_gift_wrapping[i].value
            break;
        }
    }



    var i_hp1 = document.getElementById("hp1");
    var i_hp2 = document.getElementById("hp2");
    var i_hp3 = document.getElementById("hp3");

    var i_tel1 = document.getElementById("tel1");
    var i_tel2 = document.getElementById("tel2");
    var i_tel3 = document.getElementById("tel3");

    var i_zipcode = document.getElementById("zipcode");
    var i_roadAddress = document.getElementById("roadAddress");
    var i_jibunAddress = document.getElementById("jibunAddress");
    var i_namujiAddress = document.getElementById("namujiAddress");
    var i_delivery_message = document.getElementById("delivery_message");
    var i_pay_method = document.getElementById("pay_method");

    //	alert("총주문 금액:"+total_order_goods_price);
    order_goods_qty = h_order_goods_qty.value;
    //order_total_price=h_order_total_price.value;

    orderer_name = h_orderer_name.value;
    receiver_name = i_receiver_name.value;
    hp1 = i_hp1.value;

    tel1 = i_tel1.value;

    receiver_hp_num = hp1 + "-" + hp2 + "-" + hp3;
    receiver_tel_num = tel1 + "-" + tel2 + "-" + tel3;

    delivery_address = "우편번호:" + i_zipcode.value + "<br>" + "도로명 주소:"
            + i_roadAddress.value + "<br>" + "[지번 주소:"
            + i_jibunAddress.value + "]<br>" + i_namujiAddress.value;

    delivery_message = i_delivery_message.value;

    var p_order_goods_id = document.getElementById("p_order_goods_id");
    var p_order_goods_title = document
            .getElementById("p_order_goods_title");
    var p_order_goods_qty = document.getElementById("p_order_goods_qty");
    var p_total_order_goods_qty = document
            .getElementById("p_total_order_goods_qty");
    var p_total_order_goods_price = document
            .getElementById("p_total_order_goods_price");
    var p_orderer_name = document.getElementById("p_orderer_name");
    var p_receiver_name = document.getElementById("p_receiver_name");
    var p_delivery_method = document.getElementById("p_delivery_method");
    var p_receiver_hp_num = document.getElementById("p_receiver_hp_num");
    var p_receiver_tel_num = document.getElementById("p_receiver_tel_num");
    var p_delivery_address = document.getElementById("p_delivery_address");
    var p_delivery_message = document.getElementById("p_delivery_message");
    var p_gift_wrapping = document.getElementById("p_gift_wrapping");
    var p_pay_method = document.getElementById("p_pay_method");

    p_order_goods_id.innerHTML = goods_id;
    p_order_goods_title.innerHTML = goods_title;
    p_total_order_goods_qty.innerHTML = total_order_goods_qty + "개";
    p_total_order_goods_price.innerHTML = total_order_goods_price + "원";
    p_orderer_name.innerHTML = orderer_name;
    p_receiver_name.innerHTML = receiver_name;
    p_delivery_method.innerHTML = delivery_method;
    p_receiver_hp_num.innerHTML = receiver_hp_num;
    p_receiver_tel_num.innerHTML = receiver_tel_num;
    p_delivery_address.innerHTML = delivery_address;
    p_delivery_message.innerHTML = delivery_message;
    p_gift_wrapping.innerHTML = gift_wrapping;
    p_pay_method.innerHTML = pay_method;
    imagePopup('open');
}

function fn_process_pay_order() {

    alert("최종 결제하기");
    var formObj = document.createElement("form");
    var i_receiver_name = document.createElement("input");

    var i_receiver_hp1 = document.createElement("input");
    var i_receiver_hp2 = document.createElement("input");
    var i_receiver_hp3 = document.createElement("input");

    var i_receiver_tel1 = document.createElement("input");
    var i_receiver_tel2 = document.createElement("input");
    var i_receiver_tel3 = document.createElement("input");

    var i_delivery_address = document.createElement("input");
    var i_delivery_message = document.createElement("input");
    var i_delivery_method = document.createElement("input");
    var i_gift_wrapping = document.createElement("input");
    var i_pay_method = document.createElement("input");
    var i_card_com_name = document.createElement("input");
    var i_card_pay_month = document.createElement("input");
    var i_pay_orderer_hp_num = document.createElement("input");

    i_receiver_name.name = "receiver_name";
    i_receiver_hp1.name = "receiver_hp1";
    i_receiver_hp2.name = "receiver_hp2";
    i_receiver_hp3.name = "receiver_hp3";

    i_receiver_tel1.name = "receiver_tel1";
    i_receiver_tel2.name = "receiver_tel2";
    i_receiver_tel3.name = "receiver_tel3";

    i_delivery_address.name = "delivery_address";
    i_delivery_message.name = "delivery_message";
    i_delivery_method.name = "delivery_method";
    i_gift_wrapping.name = "gift_wrapping";
    i_pay_method.name = "pay_method";
    i_card_com_name.name = "card_com_name";
    i_card_pay_month.name = "card_pay_month";
    i_pay_orderer_hp_num.name = "pay_orderer_hp_num";

    i_receiver_name.value = receiver_name;
    i_receiver_hp1.value = hp1;
    i_receiver_hp2.value = hp2;
    i_receiver_hp3.value = hp3;

    i_receiver_tel1.value = tel1;
    i_receiver_tel2.value = tel2;
    i_receiver_tel3.value = tel3;
    ;
    i_delivery_address.value = delivery_address;
    i_delivery_message.value = delivery_message;
    i_delivery_method.value = delivery_method;
    i_gift_wrapping.value = gift_wrapping;
    i_pay_method.value = pay_method;
    i_card_com_name.value = card_com_name;
    i_card_pay_month.value = card_pay_month;
    i_pay_orderer_hp_num.value = pay_orderer_hp_num;

    formObj.appendChild(i_receiver_name);
    formObj.appendChild(i_receiver_hp1);
    formObj.appendChild(i_receiver_hp2);

    formObj.appendChild(i_delivery_address);
    formObj.appendChild(i_delivery_message);


    formObj.appendChild(i_pay_method);
    formObj.appendChild(i_card_com_name);
    formObj.appendChild(i_card_pay_month);
    formObj.appendChild(i_pay_orderer_hp_num);

    document.body.appendChild(formObj);
    formObj.method = "post";
    formObj.action = "${contextPath}/order/payToOrderGoods.do";
    formObj.submit();
    imagePopup('close');
}