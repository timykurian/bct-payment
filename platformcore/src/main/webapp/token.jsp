<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="shortcut icon" href="static/images/bank_money.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"></link>
	<link rel="stylesheet" type="text/css" href="static/css/bootstrap-theme.min.css"></link>
	<title>BCT Payment Gateway</title>
</head>
<body onload="tokenRequest();">
<div class="col-md-12">&nbsp;</div>
<div class="col-md-12">&nbsp;</div>
<div class="col-md-12">
	<div class="col-md-2">&nbsp;</div>
	<div class="col-md-8 alert alert-info" id="tokenContainer">
		Please wait while your token is generated
	</div>
	<div class="col-md-2">&nbsp;</div>
</div>
<div class="col-md-12">&nbsp;</div>
</body>
<script type="text/javascript" src="https://www.2checkout.com/checkout/api/2co.min.js"></script>
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>

<script>

    var tokenRequest = function() {

        TCO.loadPubKey('sandbox', tokenCallback);
        var args = {
            sellerId: "901348953",
            publishableKey: "0ED4187A-054C-48F5-B29D-F3AB8D75BE28",
            ccNo: "4000000000000002",
            cvv: "123",
            expMonth:10,
            expYear: 2017
        };
        return TCO.requestToken(successCallback, errorCallback, args);
    };

    var tokenCallback = function(data) {

        console.log('Your public key has been loaded successfully');
        var args = {
            sellerId: "901348953",
            publishableKey: "0ED4187A-054C-48F5-B29D-F3AB8D75BE28",
            ccNo: "4000000000000002",
            cvv: "123",
            expMonth:10,
            expYear: 2017
        };
        return TCO.requestToken(successCallback, errorCallback, args);
    };

    // Called when token created successfully.
    var successCallback = function(data) {
        
        $("#tokenContainer").empty();
        $("#tokenContainer").append("<h3>" + data['response']['token']['token'] + "</h3>");
    };

    // Called when token creation fails.
    var errorCallback = function(data) {
        // Retry the token request if ajax call fails
        if (data.errorCode == 200) {
            tokenRequest();
        } else {
            alert(data.errorMsg);
        }
    };

</script>
</html>
