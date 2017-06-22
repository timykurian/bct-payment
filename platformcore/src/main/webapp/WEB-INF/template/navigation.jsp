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
    <input type="hidden" name="q1" id="searchText1"/>
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
        <textarea style="display:none;" id='clipboardText'></textarea>
        <div class="navbar-collapse collapse main">
            <nav id="primary_nav_wrap">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a id="ingestion" href="#">Ingestion</a>
                            <ul class="nav navbar-nav">
                                <li title="Content and Metadata Ingestion" class="right-arrow"><a href="#">Metadata</a>
                                    <ul class="nav navbar-nav">
                                        <li title="Metadata Ingestion"><a
                                                href="<%=request.getContextPath()%>/metadataIngestion">MIMS</a></li>
                                        <li title="Workflow Logs"><a
                                                href="<%=request.getContextPath()%>/mimsWorkflowLog">Workflow Log</a>
                                        </li>
                                        <li title="Metadata Ingestion History"><a
                                                href="<%=request.getContextPath()%>/mimsHistory">MIMS Ingestion
                                            History</a></li>
                                    </ul>
                                </li>
                                <sec:authorize access="hasRole('ROLE_GLOSE_WRITE')">
                                    <li title="Glose Related Pages" class="right-arrow"><a href="#">Glose Redeem
                                        URLs</a>
                                        <ul class="nav navbar-nav">
                                            <li title="Glose Sample and Parent EAN URLs"><a
                                                    href="<%=request.getContextPath()%>/gloseUrls">Get Redeem URLs</a>
                                            </li>
                                        </ul>
                                    </li>
                                </sec:authorize>
                                <li title="Rules Management" class="right-arrow"><a href="#">Reports</a>
                                    <ul class="nav navbar-nav">
                                        <li title="Error Report"><a href="<%=request.getContextPath()%>/failureReport">Error
                                            Report</a></li>
                                        <li title="ePub Check Report"><a
                                                href="<%=request.getContextPath()%>/epubCheckReport">ePub Check
                                            Report</a></li>
                                        <li title="Publishers Report"><a
                                                href="<%=request.getContextPath()%>/publishers">Publishers Report</a>
                                        </li>
                                        <li title="Ingested Media DRM Report"><a
                                                href="<%=request.getContextPath()%>/ingestedMediaDrmReport">Ingested
                                            Media DRM Report</a></li>
                                        <li title="Failure Error Reports" class="right-arrow"><a href="#">Failure Error
                                            Reports</a>
                                            <ul>
                                                <li title="Corrupt File"><a
                                                        href="<%=request.getContextPath()%>/corruptFile">Corrupt
                                                    File</a></li>
                                                <li title="File Delete"><a
                                                        href="<%=request.getContextPath()%>/fileDelete">File Delete</a>
                                                </li>
                                                <li title="Akamai Timeout"><a
                                                        href="<%=request.getContextPath()%>/akamaiTimeout">Akamai
                                                    Timeout</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li title="Rules Management" class="right-arrow"><a href="#">Rules Management</a>
                                    <ul class="nav navbar-nav">
                                        <li title="Default Rules"><a href="<%=request.getContextPath()%>/defaultRules">Default
                                            Rules</a></li>
                                        <li title="Publisher Rules"><a
                                                href="<%=request.getContextPath()%>/publisherRules">Publisher Rules</a>
                                        </li>
                                        <li title="Book Rules"><a href="<%=request.getContextPath()%>/bookRules">Book
                                            Rules</a></li>
                                    </ul>
                                </li>
                                <li title="PreOrder Management" class="right-arrow"><a href="#">Pre-Order Management</a>
                                    <ul class="nav navbar-nav">
                                        <li title="Default Rules"><a href="<%=request.getContextPath()%>/manageEANs">Manage
                                            EANs</a></li>
                                        <li title="Publisher Rules"><a
                                                href="<%=request.getContextPath()%>/manageVendors">Manage Vendors</a>
                                        </li>
                                    </ul>
                                </li>
                                <li title="Content Ingestion Workflow"><a
                                        href="<%=request.getContextPath()%>/ingestionWorkflow">Ingestion Workflow</a>
                                </li>
                                <li title="Parent-Sample EANs Association"><a
                                        href="<%=request.getContextPath()%>/stagingmonitor">Staging Monitor</a></li>
                                <li title="Pending Monitor"><a href="<%=request.getContextPath()%>/pendingmonitor">Pending
                                    Monitor</a></li>
                                <li title="ePub Metadata Information"><a
                                        href="<%=request.getContextPath()%>/ePubMetadata">ePub Metadata Info</a></li>
                                <li title="Publishers" class="right-arrow"><a href="#">Publishers</a>
                                    <ul class="nav navbar-nav">
                                        <li title="Create/Update Publisher"><a
                                                href="<%=request.getContextPath()%>/createPublisher">Create/Update
                                            Publisher</a></li>
                                    </ul>
                                </li>
                                <li title="Ingestion Workflow Logs"><a
                                        href="<%=request.getContextPath()%>/ingestionWorkflowLog">Workflow Log</a></li>
                            </ul>
                        </li>
                        <li class="nav-page " title="For Reports"><a href="#">Reports</a>
                            <ul class="nav navbar-nav">
                                <li title="On-Sale Report"><a href="<%=request.getContextPath()%>/onSaleReport">On-Sale
                                    Report</a></li>
                                <li title="EAN(s) Details - Ingestion Records"><a
                                        href="<%=request.getContextPath()%>/eanDetails">EAN Details</a></li>
                                <li title="Periodical Monitor"><a
                                        href="<%=request.getContextPath()%>/periodicalMonitor">Periodical Monitor</a>
                                </li>
                                <li title="Presale Check Report"><a
                                        href="<%=request.getContextPath()%>/presaleCheckReport">Presale Check Report</a>
                                </li>
                                <li title="Trade" class="right-arrow"><a href="#">Data Lookup & Definitions</a>
                                    <ul>
                                        <li title="Trade"><a href="<%=request.getContextPath()%>/activeFormatCodes">Active
                                            Format Codes</a></li>
                                        <li title="Device Information"><a href="<%=request.getContextPath()%>/devices">Device
                                            Information</a></li>
                                        <li title="Media DRM Information"><a
                                                href="<%=request.getContextPath()%>/mediadrminfo">Media DRM
                                            Information</a></li>
                                        <li title="Active Store Fronts"><a
                                                href="<%=request.getContextPath()%>/storefronts">Active Store Fronts</a>
                                        </li>
                                        <li title="Error Definitions"><a
                                                href="<%=request.getContextPath()%>/errorcodes">Error Definitions</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-page " title="Content Ingestion Management Tools"><a href="#">Manage Content</a>
                            <ul class="nav navbar-nav">
                                <li title="Move EANs from a Vendor to another"><a
                                        href="<%=request.getContextPath()%>/prepareDataToMove">Title Mover</a></li>
                                <li title="Parent-Sample EANs Association"><a
                                        href="<%=request.getContextPath()%>/sampleDetails">Parent-Sample Association</a>
                                </li>
                                <li title="ePub Check" class="right-arrow"><a href="#">ePub Check</a>
                                    <ul class="nav navbar-nav">
                                        <li title="Run ePub Check"><a href="<%=request.getContextPath()%>/runepubCheck">Run
                                            ePub Check</a></li>
                                    </ul>
                                </li>
                                <sec:authorize access="hasAnyRole('ROLE_CDM_ADMIN', 'ROLE_CONTENT_INGESTION_WRITE')">
                                    <li title="Manual Mover"><a href="<%=request.getContextPath()%>/manualMover">Manual
                                        Mover</a></li>
                                </sec:authorize>
                                <li title="Content Migration Tool"><a
                                        href="<%=request.getContextPath()%>/contentMigrationTool">Content Migration</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-page " title="Promotion"><a href="#">Promotion</a>
                            <ul class="nav navbar-nav">
                                <li title="Device Locker Stuffing Promotion"><a
                                        href="<%=request.getContextPath()%>/deviceLockerPromotion">Device Locker
                                    Stuffing</a></li>
                            </ul>
                        </li>
            </nav>
            <ul class="nav navbar-nav navbar-right navbar-icon">
                <li title="Search">
                    <form class="navbar-form search-ean" method="get" role="search" id="eanSearch">
                        <div class="form-group has-feedback">
                            <i class="form-control-feedback glyphicon glyphicon-search" id="glyphicon"
                               style="color: forestgreen; font-size: 1.2em !important;" onclick="launchSearch()"></i>
                            <input type="search" class="form-control navbarSearchField"
                                   placeholder="Name, Publisher, Sub & Issue EAN"
                                   name="ean" id="searchText">
                        </div>
                    </form>
                </li>
                <li title="About/Info/Theme">
                    <a href="<%=request.getContextPath()%>/theme">
                        <span class="glyphicon glyphicon-info-sign"></span>
                    </a>
                </li>
                <li class='security' title="Logout <sec:authentication property='principal.username'/>"
                    data-security-user="<sec:authentication property='principal.username' />">
                    <a href="<%=request.getContextPath()%>/j_spring_security_logout">
                        <span class="glyphicon glyphicon-log-out"></span>
                    </a>
                </li>
            </ul>
        </div>
        <sec:authorize access="hasRole('ROLE_CDM_ADMIN')">
            <div id="authorities" style="display: none">true</div>
        </sec:authorize>
        <sec:authorize access="!hasRole('ROLE_CDM_ADMIN')">
            <div id="authorities" style="display: none">false</div>
        </sec:authorize>
    </div>
</div>
</body>

<script type='text/javascript'>

    var IS_ROLE_ADMIN = false;
    var newsStandTypes = ['D8', 'D9', 'DN', 'DU', 'DW', 'DX', 'DY', 'EF', 'QY', 'QZ', 'W7', 'W8'];

    $('#searchText').keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            launchSearch();
        }
    });

    function launchSearch() {

        var filterText = $('#searchText').val();
        filterText = filterText.trim();
        var pattern = /^\d{13}$/;
        var contextPath = "<%=request.getContextPath()%>";
        var submitUrl = contextPath + "/pub?ean=" + filterText;

        $('#searchText').addClass('spinner');
        $('#glyphicon').hide();
        $('#searchText').parent().removeClass('has-feedback');
        $('#searchText').parent().parent().removeClass('has-feedback');
        $('#searchText').val('');

        // Not an 13-digit all-numeric EAN. Redirect to Newsstand listings
        if (!(jQuery.isNumeric(filterText) && pattern.test(filterText))) {
            submitUrl = "<%=request.getContextPath()%>" + "/nshome?search=" + encodeURIComponent(filterText);
            window.location = submitUrl;
        } else {
            $.ajax({
                url: 'api/data/reader/getProductType?ean=' + filterText,
                type: 'POST',
                async: true,
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (json, textStatus, request) {
                    if (json.content.grid == null || json.content.grid.length == 0) {
                        submitUrl = contextPath + "/nshome?ean=" + filterText;
                        return;
                    }
                    var formatCode = json.content.grid[0].catalog_formatCode.value;
                    var isSipIssue = json.content.grid[0].catalogsubscription_isSipIssue.value;
                    isSipIssue = (isSipIssue == 'null' || isSipIssue == null) ? '0' : isSipIssue;
                    var isTradeProduct = (jQuery.inArray(formatCode, newsStandTypes) == -1) ? true : false;
                    if (formatCode == 'EF') {
                        isTradeProduct = (isSipIssue == '1') ? false : true;
                    }
                    if (isTradeProduct) {
                        submitUrl = contextPath + "/ean?ean=" + filterText;
                    }
                },
                error: function (xhr, code, text) {
                    console.log('Unable to determine product type.. Redirecting to Newsstand');
                    submitUrl = contextPath + "/nshome?ean=" + filterText;
                },
                complete: function () {
                    IS_ROLE_ADMIN = $('#authorities').text() == "true";
                    window.location = submitUrl;
                }
            });
        }
    }

</script>
</html>
