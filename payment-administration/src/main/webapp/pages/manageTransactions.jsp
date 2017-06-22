<%--
  Created by IntelliJ IDEA.
  User: timy
  Date: 6/16/17
  Time: 9:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

</head>


<body ng-controller="adminCtrl">
{{orderNo}}

<div class="row" id="manage-transaction">
    <div class="col-lg-12">
        <h1 class="page-header">Manage Transaction</h1>
    </div>
    <!-- /.col-lg-12 -->
    <form role="form">
        <div class="form-group input-group">
            <label class="control-label"    >Order Number</label>
            <input type="text" class="form-control" ng-model="orderNo" width="100px">
            <span class="input-group-btn" width="100px">
                <button class="btn btn-default" type="button" ng-click="searchOrderDetails()"><i class="fa fa-search"></i>
                </button>
             </span>
        </div>
    </form>
</div>



</body>


</html>
