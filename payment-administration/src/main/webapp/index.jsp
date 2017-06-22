<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js"> <!--<![endif]-->
<head>

    <!-- Meta-Information -->
    <title>BCT Pay Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="BCT Inc.">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Vendor: Bootstrap Stylesheets http://getbootstrap.com -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <!-- Our Website CSS Styles -->
    <!-- MetisMenu CSS -->
    <link rel="stylesheet" href="css/plugins/metisMenu/metisMenu.min.css">

    <!-- Timeline CSS -->
    <link rel="stylesheet" href="css/plugins/timeline.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/sb-admin-2.css">

    <!-- Morris Charts CSS -->
    <link rel="stylesheet" href="css/plugins/morris.css">

</head>
<body ng-app="bctPayAdmin">
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Our Website Content Goes Here -->
<div id="wrapper">

    <div ng-include='"templates/navigation.html"'></div>


    <div ng-view></div>


</div>
<!-- /#wrapper -->

<!-- Vendor: Javascripts -->
<!--
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
-->
<%--<script src="js/jquery-1.11.0.js"></script>--%>

<script src="<c:url value='vendor/jquery/jquery.min.js' />"></script>
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<script src="js/bootstrap.min.js"></script>

<!-- Vendor: Angular, followed by our custom Javascripts -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular-route.min.js"></script>


<!-- Our Website Javascripts -->
<script src="js/main.js"></script>


<!-- DataTables JavaScript -->

<script src="<c:url value='/vendor/datatables/js/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/vendor/datatables/js/dataTables.bootstrap.min.js' />"></script>


</body>
</html>
