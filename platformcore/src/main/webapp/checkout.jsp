<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="static/images/bank_money.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"></link>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap-theme.min.css"></link>
    <link rel="stylesheet" type="text/css" href="static/css/landing.css"></link>
    <title>BCT Payment Gateway</title>
</head>
<body background="static/images/background.jpg">
<div class="col-md-12">&nbsp;</div>
<div class="col-md-12">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-4">
        <div class="col-lg-4">
            <img src="static/images/bct_logo.png" width="120" height="120"
                 title="Bahwan CyberTek Logo"/>
        </div>
        <div class="col-lg-4">
            <span style="font-family: 'sans-serif'; font-weight: normal; position: initial; font-size: 25;"> BAHWAN CYBERTEK</span>
        </div>
        <div class="col-lg-4">&nbsp;</div>
    </div>
    <div class="col-md-4"><h1>BCT Payment Gateway</h1></div>
    <div class="col-md-2">&nbsp;</div>
</div>
<div class="col-md-12">
    <div class="col-md-2">&nbsp;</div>
    <div class="col-md-8">
        <h2 align="center">Your transaction is being processed</h2>
        <h3 align="center" style="font-size: 20; color: orange; align-content: center !important;">Please do not hit
            refresh or back</h3>
    </div>
    <div class="col-md-2">&nbsp;</div>
</div>
<div class="container" style="margin-top: 5%; width: 80%;">
    <div class="row" id="login-container" style="background: #d9edf7; box-shadow: 10px 10px 5px #555555;">
        <div class="span8 offset2">
            <form id="checkoutForm" name="checkoutForm" action="CheckoutServlet" method="POST">
                <input type="hidden" name="EC_Type" value="EC-Mark"/>
                <input type="hidden" id="token" name="token"/>
                <input type="hidden" name="customerName" value="${customerName}"/>
                <input type="hidden" name="addressLine1" value="${addressLine1}"/>
                <input type="hidden" name="city" value="${city}"/>
                <input type="hidden" name="state" value="${state}"/>
                <input type="hidden" name="country" value="${country}"/>
                <input type="hidden" name="postalCode" value="${postalCode}"/>
                <input type="hidden" name="mobile" value="${mobile}"/>
                <input type="hidden" name="email" id="email" value="${email}"/>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-2">&nbsp;</div>
                    <div class="col-md-6">
                        <div class="col-lg-4">
                            <label class="label" for="serviceProvider">Service Provider</label>
                        </div>
                        <div class="col-lg-6">
                            <input type="hidden" id="serviceProvider" name="merchantId" value="${merchantId}" size="40">
                            <p class="label"><strong>${merchantId}</strong></p>
                        </div>
                    </div>
                    <div class="col-md-4" style="max-height: 30;">
						<span class="pull-right" style="overflow: visible; border: 1px solid cornflowerblue;">
							<img src="${productUrl}"/>
						</span>
                    </div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-2">&nbsp;</div>
                    <div class="col-md-6">
                        <div class="col-lg-4">
                            <label class="label" for="productName">Product Name</label>
                        </div>
                        <div class="col-lg-6">
                            <input type="hidden" id="productName" name="productName" value="${productName}" size="40">
                            <p class="label"><strong>${productName}</strong></p>
                            <input type="hidden" id="type" name="type" value="${type}" size="0">
                        </div>
                        <div class="col-lg-2">&nbsp;</div>
                    </div>
                    <div class="col-md-4">&nbsp;</div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-2">&nbsp;</div>
                    <div class="col-md-6">
                        <div class="col-lg-4">
                            <label class="label" for="amount">Purchase Amount</label>
                        </div>
                        <div class="col-lg-6">
                            <input type="hidden" id="amount" name="auth_amount" value="${amount}" size="40">
                            <p class="label"><strong>$ ${amount}</strong></p>
                        </div>
                        <div class="col-lg-2">&nbsp;</div>
                    </div>
                    <div class="col-md-4">&nbsp;</div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-2">&nbsp;</div>
                    <div class="col-md-6">
                        <div class="col-lg-4">
                            <label class="label" for="cardNumber">Card Number</label>
                        </div>
                        <div class="col-lg-6">
                            <input class="form-control textWithImage" id="cardNumber" name="cardNumber" size="40"
                                   value="4000000000000002">
                        </div>
                        <div class="col-lg-2">
							<span id="cardTypeContainer" style="display: none;">
								<img id="cardType" src="static/images/Master.jpg" height="30" width="40"/>
							</span>
                        </div>
                    </div>
                    <div class="col-md-4">&nbsp;</div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-2">&nbsp;</div>
                    <div class="col-md-6">
                        <div class="col-lg-4">
                            <label class="label" for="expMonth">Expiry Date</label>
                        </div>
                        <div class="col-lg-3">
                            <input class="form-control" id="expMonth" name="expMonth" size="20" value="12">
                        </div>
                        <div class="col-lg-3">
                            <input class="form-control" id="expYear" name="expYear" size="20" value="2020">
                        </div>
                        <div class="col-lg-2">&nbsp;</div>
                    </div>
                    <div class="col-md-4">&nbsp;</div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-2">&nbsp;</div>
                    <div class="col-md-6">
                        <div class="col-lg-4">
                            <label class="label" for="cvv">CVV (?)</label>
                        </div>
                        <div class="col-lg-6">
                            <input class="form-control" id="cvv" name="cvv" size="40" value="123">
                        </div>
                        <div class="col-lg-2">&nbsp;</div>
                    </div>
                    <div class="col-md-4">&nbsp;</div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <%--				<div class="col-md-12">
                                    <div class="col-md-2">&nbsp;</div>
                                    <div class="col-md-8">
                                        <div class="col-lg-4">
                                            <label class="label" for="amount">Payment Method</label>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="radio">
                                                <label><input type="radio" id="payPalButton" name="paymentMethod">PayPal</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" id="2checkOutButton" name="paymentMethod">2 Checkout</label>
                                            </div>
                                            <div class="radio disabled">
                                                <label><input type="radio" name="paymentMethod" disabled>Vantiv</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">&nbsp;</div>
                                    </div>
                                    <div class="col-md-2">&nbsp;</div>
                                </div>--%>
                <div class="col-md-12">
                    <div class="col-md-2">&nbsp;</div>
                    <div class="col-md-8">
                        <div class="col-lg-4">&nbsp;</div>
                        <div class="col-lg-6">
                            <input type="button" id="payNow" class="btn btn-info" value="Pay Now"
                                   onClick="tokenRequest()"/>
                        </div>
                        <div class="col-lg-2">&nbsp;</div>
                    </div>
                    <div class="col-md-2">&nbsp;</div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <div class="col-md-3">© 2017 Bahwan CyberTek</div>
                    <div class="col-md-6">This payment platform is powered by Bahwan CyberTek Private Limited
                    </div>
                    <div class="col-md-3">
						<span class="pull-right">
							<img src="static/images/creditCards.png" height="50"/>
						</span>
                    </div>
                </div>
                <div class="col-md-12">&nbsp;</div>
            </form>
        </div>
    </div>
</div>
<div class="col-md-12">&nbsp;</div>
</body>
<script type="text/javascript" src="https://www.2checkout.com/checkout/api/2co.min.js"></script>
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>

<script>

    $(document).ready(function () {
        deduceCardType();
        $('#cardNumber').val($('#cardNumber').val().replace(/[^\dA-Z]/g, '').replace(/(.{4})/g, '$1 ').trim());
    });

    function deduceCardType() {

        var startsWith = '';
        if ($('#cardNumber').val().length > 4) {
            startsWith = $('#cardNumber').val().substr(0, 4);
        }
        if (startsWith.startsWith('4')) {
            $('#cardTypeContainer').show();
            $('#cardType').attr('src', 'static/images/VISA.jpg');
        } else if (startsWith.startsWith('36') || startsWith.startsWith('51') || startsWith.startsWith('52') || startsWith.startsWith('53') || startsWith.startsWith('54') || startsWith.startsWith('55')) {
            $('#cardTypeContainer').show();
            $('#cardType').attr('src', 'static/images/Master.jpg');
        }
    }

    var tokenRequest = function () {

        TCO.loadPubKey('sandbox');
        $('#payNow').attr('disabled', true);
        var args = {
            sellerId: "901349781",
            publishableKey: "DE73EC79-1EBD-441E-954A-DDBA04A018DC",
            ccNo: $("#cardNumber").val(),
            cvv: $("#cvv").val(),
            expMonth: $("#expMonth").val(),
            expYear: $("#expYear").val()
        };
        return TCO.requestToken(successCallback, errorCallback, args);
    };

    // Called when token created successfully.
    var successCallback = function (data) {

        $("#token").val(data['response']['token']['token']);
        // console.log("Subrecurring ?"+$("#productName").val().search("Subscribe"))
        //   $("#type").val(($("#productName").val().indexOf("Subscribe") != -1 ? "recurring" : "auth"));
        $('#checkoutForm').submit();
    };

    // Called when token creation fails.
    var errorCallback = function (data) {
        // Retry the token request if ajax call fails
        if (data.errorCode == 200) {
            tokenRequest();
        } else {
            alert(data.errorMsg);
        }
    };

    $(function () {
        TCO.loadPubKey('sandbox');
    });

    (function blink() {
        $('.blinker').fadeOut(600).fadeIn(600, blink);
    })();

    document.getElementById('cardNumber').addEventListener('input', function (e) {
        e.target.value = e.target.value.replace(/[^\dA-Z]/g, '').replace(/(.{4})/g, '$1 ').trim();
        deduceCardType();
    });

</script>
</html>
