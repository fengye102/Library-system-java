<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书列表 - 图书借阅管理系统</title>
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
    <div class="card">
        <div class="toolbar">
            <div class="page-header" style="margin-bottom:0;">
                <h2><div class="ph-icon">📖</div> 图书列表</h2>
            </div>
            <div style="display:flex;align-items:center;gap:10px;flex-wrap:wrap;">
                <form method="get" action="${pageContext.request.contextPath}/books" class="search-form">
                    <input type="text" name="keyword" value="${keyword}" placeholder="🔍 搜索书名、作者或ISBN...">
                    <button type="submit" class="btn btn-primary">搜索</button>
                    <c:if test="${not empty keyword}">
                        <a href="${pageContext.request.contextPath}/books" class="btn btn-outline">重置</a>
                    </c:if>
                </form>
                <c:if test="${sessionScope.loginUser.admin}">
                    <a href="${pageContext.request.contextPath}/books/add" class="btn btn-success">＋ 添加图书</a>
                </c:if>
            </div>
        </div>

        <c:if test="${not empty keyword}">
            <p style="color:var(--muted);font-size:13px;margin-bottom:14px;">
                关键词「${keyword}」共找到 ${books.size()} 本图书
            </p>
        </c:if>

        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>分类</th>
                        <th>总量</th>
                        <th>可借</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td style="font-weight:500;">📗 ${book.name}</td>
                            <td>${book.author}</td>
                            <td style="color:var(--muted);">${book.publisher}</td>
                            <td>
                                <c:if test="${not empty book.category}">
                                    <span class="badge badge-info">${book.category}</span>
                                </c:if>
                            </td>
                            <td>${book.total}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${book.available > 0}">
                                        <span class="badge badge-success">✔ ${book.available} 本</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-danger">✘ 无库存</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div style="display:flex;gap:6px;flex-wrap:wrap;">
                                    <c:if test="${not sessionScope.loginUser.admin and book.available > 0}">
                                        <a href="${pageContext.request.contextPath}/borrow/borrow/${book.id}"
                                           class="btn btn-primary btn-sm">📥 借阅</a>
                                    </c:if>
                                    <c:if test="${sessionScope.loginUser.admin}">
                                        <a href="${pageContext.request.contextPath}/books/edit/${book.id}"
                                           class="btn btn-warning btn-sm">✏️ 编辑</a>
                                        <a href="${pageContext.request.contextPath}/books/delete/${book.id}"
                                           class="btn btn-danger btn-sm"
                                           onclick="return confirm('确定删除《${book.name}》？')">🗑 删除</a>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty books}">
                        <tr><td colspan="7" class="td-empty">📭 暂无图书数据</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
