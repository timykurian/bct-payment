<%--
  Created by IntelliJ IDEA.
  User: timy
  Date: 5/23/17
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<div class="span4">
</div>
<div class="span5">
    <h3> Thank you for your payment! Output from Execute Payment Request </h3>
    <p>Message:  <%=request.getAttribute("response")%>
    </p>

    <table>
        <tbody>

        </tbody>
    </table>
    <h3> Click <a href='checkout.jsp'>here </a> to return to Home Page</h3>
</div>
<div class="span3">
</div>
</html>