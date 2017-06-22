<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <body background="static/images/globe.jpg">
  <form id="booksForm" name="booksForm" action="landingServlet" method="POST">
    <input type="hidden" name="merchantId" id="merchantId" value="Books Store" />
    <input type="hidden" name="amount" id="amount" />
    <input type="hidden" name="productName" id="productName" />
    <input type="hidden" name="productDesc" id="productDesc" />
    <input type="hidden" name="remarks" id="remarks" value="Book Purchase" />
    <input type="hidden" name="customerName" id="customerName" value="Alegra Velava" />
    <input type="hidden" name="addressLine1" id="addressLine1" value="Suite 165" />
    <input type="hidden" name="addressLine2" id="addressLine2" value="750 Agnew Road" />
    <input type="hidden" name="city" id="city" value="Santa Clara" />
    <input type="hidden" name="state" id="state" value="CA" />
    <input type="hidden" name="country" id="country" value="US" />
    <input type="hidden" name="postalCode" id="postalCode" value="95054" />
    <input type="hidden" name="mobile" id="mobile" value="9789012345" />
    <input type="hidden" name="productUrl" id="productUrl" />
    <input type="hidden" name="email" id="email" value="some.customer@bookstore.com" />
  </form>
  <div clas="col-md-12">&nbsp;</div>
  <div class="col-md-12">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-9">
      <h1 align="center">Check out our best selling eBooks</h1>
    </div>
    <div class="col-md-1">&nbsp;</div>
  </div>
  <div clas="col-md-12">&nbsp;</div>
  <jstl:if test="${status == 'success'}">
    <div class="col-md-12">
      <div class="col-md-2">&nbsp;</div>
      <div class="col-md-7 alert alert-success" style="border-radius: 12px;">
        <h3 align="center">Your transaction has been completed successfully</h3>
        <h4 align="center">Please keep your transaction id for reference: ${transactionId}</h4>
      </div>
      <div class="col-md-3">&nbsp;</div>
    </div>
  </jstl:if>
  <jstl:if test="${status == 'failure'}">
    <div class="col-md-12">
      <div class="col-md-2">&nbsp;</div>
      <div class="col-md-7 alert alert-warning" style="border-radius: 12px;">
        <h3 align="center">We're sorry. Your transaction could not be completed</h3>
      </div>
      <div class="col-md-3">&nbsp;</div>
    </div>
  </jstl:if>
  <div clas="col-md-12">&nbsp;</div>
  <div class="col-md-12">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-3" id="book1">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(7.85, 'Seed to Harvest by Octavia', 'By Octavia Butler', '#booksForm', 'static/img/bookStore/9781453271759.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>Seed to Harvest</span>
          <span class="pull-right">$7.85</span>
        </div>
        </a>
        <div class="panel-body">
          <img src="static/img/bookStore/9781453271759.jpg">
          <span style="position: absolute; margin-left: 5%;">
            <strong>Octavia Butler</strong>
            <p>New york times the best selling novel</p>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-3" id="book2">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(5.25, 'The Fix by David', 'By David Baldacci', '#booksForm', 'static/img/bookStore/9781455586554.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>The Fix</span>
          <span class="pull-right">$5.25</span>
        </div>
        </a>
        <div class="panel-body">
          <img src="static/img/bookStore/9781455586554.jpg">
          <span style="position: absolute; margin-left: 5%;">
            <strong>David Baldacci</strong>
            <p>New york times the best selling novel</p>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-3" id="book3">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(6, 'Blue Skies by Robyn', 'By Robyn Carr', '#booksForm', 'static/img/bookStore/9781459256613.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>Blue Skies</span>
          <span class="pull-right">$6.0</span>
        </div>
        </a>
        <div class="panel-body">
          <span><img src="static/img/bookStore/9781459256613.jpg"></span>
          <span style="position: absolute; margin-left: 5%;">
            <strong>Robyn Carr</strong>
            <p>New york times the best selling novel</p>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-1">&nbsp;</div>
  </div>
  <div class="col-md-12">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-3" id="book4">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(6.80, 'Shtum by Jem Lester', 'By Jem Lester', '#booksForm', 'static/img/bookStore/9781468314717.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
           <span>Subscibe  Shtum</span>
          <span class="pull-right">$6.80</span>
         </div>
        </a>
        <div class="panel-body">
          <img src="static/img/bookStore/9781468314717.jpg">
          <span style="position: absolute; margin-left: 5%;">
            <strong>Jem Lester</strong>
            <p>New york times the best selling novel</p>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-3" id="book5">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(3.25, 'Crazy Horse and Custer by Stephen Ambrose', 'By Stephen Ambrose', '#booksForm', 'static/img/bookStore/9781497659254.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>Crazy Horse and Custer</span>
          <span class="pull-right">$3.25</span>
        </div>
        </a>
        <div class="panel-body">
          <img src="static/img/bookStore/9781497659254.jpg">
          <span style="position: absolute; margin-left: 5%;">
            <strong>Stephen Ambrose</strong>
            <p>New york times the best selling novel</p>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-3" id="book6">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(4.0, 'Doctored Evidence by Donna Leon', 'By Donna Leon', '#booksForm', 'static/img/bookStore/9781497659254.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>Doctored Evidence</span>
          <span class="pull-right">$4.0</span>
        </div>
      </a>
        <div class="panel-body">
          <span><img src="static/img/bookStore/9781555848996.jpg"></span>
          <span style="position: absolute; margin-left: 5%;">
            <strong>Donna Leon</strong>
            <p>New york times the best selling novel</p>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-1">&nbsp;</div>
  </div>
  <div class="col-md-12">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-3" id="book7">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(7.85, 'Seed to Harvest by Octavia,Butler', 'By Octavia,Butler', '#booksForm', 'static/img/bookStore/9781453271759.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>Seed to Harvest</span>
          <span class="pull-right">$7.85</span>
        </div>
        </a>
        <div class="panel-body">
          <img src="static/img/bookStore/9781453271759.jpg">
        </div>
      </div>
    </div>
    <div class="col-md-3" id="book8">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(5.25, 'The Fix by David Baldacci', 'By David Baldacci', '#booksForm', 'static/img/bookStore/9781455586554.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>The Fix</span>
          <span class="pull-right">$5.25</span>
        </div>
        </a>
        <div class="panel-body">
          <img src="static/img/bookStore/9781455586554.jpg">
        </div>
      </div>
    </div>
    <div class="col-md-3" id="book9">
      <div class= "panel panel-default" style="border: 1px solid darkblue;">
        <a onClick="submitForm(6, 'Blue Skies by Robyn Carr', 'By Robyn Carr', '#booksForm', 'static/img/bookStore/9781459256613.jpg');" href="#">
        <div class="panel-heading" style="background-image: linear-gradient(to bottom, #337ab7 0, #e8e8e8 100%);">
          <span>Blue Skies</span>
          <span class="pull-right">$6.0</span>
        </div>
        </a>
        <div class="panel-body">
          <span><img src="static/img/bookStore/9781459256613.jpg"></span>
          <span style="position: absolute; margin-left: 5%;">Robyn Carr</span>
        </div>
      </div>
    </div>
    <div class="col-md-1">&nbsp;</div>
  </div>
  </body>
  <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="static/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="static/js/bctpay.js"></script>

<script>

    function submitForm(amount, productName, productDesc, formId, productUrl) {

        $('#amount').val(amount);
        $('#productName').val(productName);
        $('#productDesc').val(productDesc);
        $('#productUrl').val(productUrl);
        $(formId).submit();
    }

</script>
</html>
