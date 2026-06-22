<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>借阅管理 - 图书借阅管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/index" class="brand">
        <div class="brand-icon">📚</div>
        图书借阅管理系统
    </a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/index">🏠 首页</a>
        <a href="${pageContext.request.contextPath}/books">📖 图书列表</a>
        <a href="${pageContext.request.contextPath}/admin/users">👥 用户管理</a>
        <a href="${pageContext.request.contextPath}/borrow/all">📊 借阅管理</a>
        <a href="${pageContext.request.contextPath}/logout" class="nav-user">
            <div class="nav-avatar">👤</div>
            ${sessionScope.loginUser.username}
        </a>
    </div>
</nav>

<div class="container">
    <div class="card">
        <div class="page-header">
            <h2><div class="ph-icon">📊</div> 所有借阅记录</h2>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th>借阅人</th>
                        <th>书名</th>
                        <th>借阅时间</th>
                        <th>应还时间</th>
                        <th>归还时间</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${borrows}">
                        <tr>
                            <td>
                                <div style="font-weight:500;">${b.user.realname}</div>
                                <div style="font-size:12px;color:var(--muted);">@${b.user.username}</div>
                            </td>
                            <td style="font-weight:500;">📗 ${b.book.name}</td>
                            <td><fmt:formatDate value="${b.borrowTime}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${b.dueTime}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty b.returnTime}">
                                        <fmt:formatDate value="${b.returnTime}" pattern="yyyy-MM-dd"/>
                                    </c:when>
                                    <c:otherwise><span style="color:var(--muted);">—</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${b.status == 0}">
                                        <span class="badge badge-warning">⏳ 借阅中</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-success">✔ 已归还</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${b.status == 0}">
                                    <a href="${pageContext.request.contextPath}/borrow/return/${b.id}"
                                       class="btn btn-success btn-sm"
                                       onclick="return confirm('确认该书已归还？')">✔ 确认归还</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty borrows}">
                        <tr><td colspan="7" class="td-empty">📭 暂无借阅记录</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
