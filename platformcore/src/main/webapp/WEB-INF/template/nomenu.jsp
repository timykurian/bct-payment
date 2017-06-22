<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="-1">
    <style>
        li {
            white-space: nowrap;
        }
    </style>
</head>
<body>
<form name="newsStand1" id="newsStandForm1">
    <input type="hidden" name="q1" id="searchText1" />
</form>
<div class="navbar navbar-fixed-top" role="navigation" style="background-color: rgb(233, 233, 218);">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/" title="CDM Home">
                <img src="<%=request.getContextPath()%>/static/img/content_logo.png" alt="CDM" class="cdmlogo">
            </a>
        </div>
    </div>
</div>
</body>
</html>
