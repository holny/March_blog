<%--
  Created by IntelliJ IDEA.
  User: hly
  Date: 2020/4/2
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
        System.out.println(request.getContextPath());
    %>
    <!-- 以下方式定时转到其他页面 -->
    <meta http-equiv="refresh" content="0;url=${APP_PATH}/home">
</head>
<body>

</body>
</html>
