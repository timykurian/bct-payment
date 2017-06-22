<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="shortcut icon" href="static/images/bank_money.ico">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"></link>
  <link rel="stylesheet" type="text/css" href="static/css/bootstrap-theme.min.css"></link>
  <title>Merchant Home</title>
  <style>
    body {
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      font-size: large;
    }
  </style>
</head>
<body>
<form id="electronicsForm" name="electronicsForm" action="landingServlet" method="POST">
  <input type="hidden" name="merchantId" id="merchantId" value="Electronics Store" />
  <input type="hidden" name="amount" id="amount" />
  <input type="hidden" name="productName" id="productName" />
  <input type="hidden" name="productDesc" id="productDesc" />
  <input type="hidden" name="remarks" id="remarks" value="Camera Purchase" />
  <input type="hidden" name="customerName" id="customerName" value="Alegra Velava" />
  <input type="hidden" name="addressLine1" id="addressLine1" value="Suite 165" />
  <input type="hidden" name="addressLine2" id="addressLine2" value="750 Agnew Road" />
  <input type="hidden" name="city" id="city" value="Santa Clara" />
  <input type="hidden" name="state" id="state" value="CA" />
  <input type="hidden" name="country" id="country" value="US" />
  <input type="hidden" name="postalCode" id="postalCode" value="95054" />
  <input type="hidden" name="mobile" id="mobile" value="9789012345" />
</form>
<div clas="col-md-12">&nbsp;</div>
<div class="col-md-12">
  <div class="col-md-1">&nbsp;</div>
  <div class="col-md-9">
    <h1 align="center">Thanks for shopping with Us !!</h1>
  </div>
  <div class="col-md-1">&nbsp;</div>
</div>
<div clas="col-md-12">&nbsp;</div>
<div class="col-md-12">
  <div class="col-md-1">&nbsp;</div>
  <div class="col-md-3" id="product1">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <a onClick="submitForm(725, 'Canon 5400', 'Topseller', '#electronicsForm');" href="#">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Canon 5400</span>
        <span class="pull-right">$725</span>
      </div>
      </a>
      <div class="panel-body">
        <img src="static/img/electronicsStore/canon.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Canon 5400</strong>
            <p>Topseller</p>
            <p>Check out other products</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-3" id="product2">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <a onClick="submitForm(525, 'Nikon D60', 'Check Nikon D80', '#electronicsForm');" href="#">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Nikon D60</span>
        <span class="pull-right">$525</span>
      </div>
      </a>
      <div class="panel-body">
        <img src="static/img/electronicsStore/nikon.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Nikon D60</strong>
            <p>Check Nikon D80 also</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-3" id="product3">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <a onClick="submitForm(600, 'Nikon Red60', 'Check out other colors', '#electronicsForm');" href="#">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Nikon Red60</span>
        <span class="pull-right">$600</span>
      </div>
      </a>
      <div class="panel-body">
        <img src="static/img/electronicsStore/nikon1.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Nikon Red60</strong>
            <p>Check out other colors</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-1">&nbsp;</div>
</div>
<div class="col-md-12">
  <div class="col-md-1">&nbsp;</div>
  <div class="col-md-3" id="product4">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Pentax PE035</span>
        <span class="pull-right">$680</span>
      </div>
      <div class="panel-body">
        <img src="static/img/electronicsStore/pentax.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Pentax PE035</strong>
            <p>Best selling product</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-3" id="product5">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Sony Alpha 300</span>
        <span class="pull-right">$325</span>
      </div>
      <div class="panel-body">
        <img src="static/img/electronicsStore/sony.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Sony Alpha 300</strong>
            <p>Real Power</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-3" id="product6">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Canon 5400</span>
        <span class="pull-right">$725</span>
      </div>
      <div class="panel-body">
        <img src="static/img/electronicsStore/canon.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Canon 5400</strong>
            <p>Topseller</p>
            <p>Check out other products</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-1">&nbsp;</div>
</div>
<div class="col-md-12">
  <div class="col-md-1">&nbsp;</div>
  <div class="col-md-3" id="product7">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Nikon D60</span>
        <span class="pull-right">$525</span>
      </div>
      <div class="panel-body">
        <img src="static/img/electronicsStore/nikon.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Nikon D60</strong>
            <p>Check Nikon D80 also</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-3" id="product6">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Nikon Red60</span>
        <span class="pull-right">$600</span>
      </div>
      <div class="panel-body">
        <img src="static/img/electronicsStore/nikon1.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Nikon Red60</strong>
            <p>Check out other colors</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-3" id="product9">
    <div class= "panel panel-default" style="border: 1px solid darkgreen;">
      <div class="panel-heading" style="background-image: linear-gradient(to bottom, #5cb85c 0, #e8e8e8 100%);">
        <span>Sony Alpha 300</span>
        <span class="pull-right">$325</span>
      </div>
      <div class="panel-body">
        <img src="static/img/electronicsStore/sony.jpg" width="120" height="120">
        <span style="position: absolute; margin-left: 5%;">
            <strong>Sony Alpha 300</strong>
            <p>Real Power</p>
          </span>
      </div>
    </div>
  </div>
  <div class="col-md-1">&nbsp;</div>
</div>
</body>
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>

<script>

    function submitForm(amount, productName, productDesc, formId) {

        $('#amount').val(amount);
        $('#productName').val(productName);
        $('#productDesc').val(productDesc);
        $(formId).submit();
    }

</script>

</html>
