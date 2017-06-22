<!DOCTYPE html>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/static/img/favicon.png">

    <script src="<%=request.getContextPath()%>/static/js/jquery-2.1.0.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/jquery-ui.js"></script>
    <script src="<%=request.getContextPath()%>/static/bootstrap-3.1.1/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/cdm/js/cdm.js"></script>
    <script src='<%=request.getContextPath()%>/static/js/purl.js'></script>
    <script src='<%=request.getContextPath()%>/static/js/jsonpath.js'></script>
    <script src='<%=request.getContextPath()%>/static/js/jquery.timeago.js'></script>
    <script src='<%=request.getContextPath()%>/static/jqwidgets-4.1.2/jqx-all.js'></script>

    <link rel="stylesheet" type='text/css'
          href="<%=request.getContextPath()%>/static/bootstrap-3.1.1/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/jqwidgets-3.2.1/styles/jqx.base.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/static/jqwidgets-3.2.1/styles/jqx.bootstrap.css"/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/static/css/JQWidgetsHeader.css'/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/static/css/glyphicons.css'/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/static/cdm/css/cdm.css'/>
    <link rel='stylesheet' type='text/css' href='<%=request.getContextPath()%>/static/cdm/css/newsstand.css'/>
    <style type='text/css'>
        /* Move down content because we have a fixed navbar that is 50px tall */
        body {
            padding-top: 50px;
            padding-bottom: 50px;
        }
    </style>
    <tiles:insertAttribute name="pageHeader" />
</head>
<body>
<div class="page">
    <tiles:insertAttribute name="navigation" />
    <tiles:insertAttribute name="body" />
    <tiles:insertAttribute name="footer" />
</div>
</body>
</html>
