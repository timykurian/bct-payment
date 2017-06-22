<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="footer"></div>
<script type='text/javascript'>
    $(function () {
        addFooter($('#footer'), '<%=request.getContextPath()%>/');
    });
</script>