<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页 - 图书借阅管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/index" class="brand">
        <div class="brand-icon">📚</div>
        图书借阅管理系统
    </a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/books">📖 图书列表</a>
        <a href="${pageContext.request.contextPath}/borrow/my">📋 我的借阅</a>
        <c:if test="${sessionScope.loginUser.admin}">
            <a href="${pageContext.request.contextPath}/admin/users">👥 用户管理</a>
            <a href="${pageContext.request.contextPath}/borrow/all">📊 借阅管理</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/logout" class="nav-user">
            <div class="nav-avatar">👤</div>
            ${sessionScope.loginUser.username}
        </a>
    </div>
</nav>

<div class="container">
    <div class="welcome-banner">
        <div class="wb-text">
            <h2>欢迎回来，${sessionScope.loginUser.realname}！</h2>
            <p>
                您的身份：
                <c:choose>
                    <c:when test="${sessionScope.loginUser.admin}">
                        <span style="background:rgba(255,255,255,.2);padding:2px 10px;border-radius:99px;font-size:12px;">🔑 管理员</span>
                    </c:when>
                    <c:otherwise>
                        <span style="background:rgba(255,255,255,.2);padding:2px 10px;border-radius:99px;font-size:12px;">📖 普通用户</span>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
        <div class="wb-avatar">
            <c:choose>
                <c:when test="${sessionScope.loginUser.admin}">🔑</c:when>
                <c:otherwise>📖</c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="stat-grid">
        <a href="${pageContext.request.contextPath}/books" class="stat-card">
            <div class="stat-icon si-blue">📚</div>
            <div class="stat-info">
                <div class="si-label">图书中心</div>
                <div class="si-value">浏览全部馆藏</div>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/borrow/my" class="stat-card">
            <div class="stat-icon si-green">📋</div>
            <div class="stat-info">
                <div class="si-label">借阅记录</div>
                <div class="si-value">查看我的借阅</div>
            </div>
        </a>
        <c:if test="${sessionScope.loginUser.admin}">
            <a href="${pageContext.request.contextPath}/admin/users" class="stat-card">
                <div class="stat-icon si-orange">👥</div>
                <div class="stat-info">
                    <div class="si-label">用户管理</div>
                    <div class="si-value">管理系统用户</div>
                </div>
            </a>
            <a href="${pageContext.request.contextPath}/borrow/all" class="stat-card">
                <div class="stat-icon si-purple">📊</div>
                <div class="stat-info">
                    <div class="si-label">借阅管理</div>
                    <div class="si-value">查看所有借阅</div>
                </div>
            </a>
        </c:if>
    </div>
</div>
</body>
</html>
