<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${empty book ? '添加图书' : '编辑图书'} - 图书借阅管理系统</title>
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
        <a href="${pageContext.request.contextPath}/logout" class="nav-user">
            <div class="nav-avatar">👤</div>
            ${sessionScope.loginUser.username}
        </a>
    </div>
</nav>

<div class="container">
    <div class="card" style="max-width:660px;">
        <div class="page-header">
            <h2>
                <div class="ph-icon">${empty book ? '➕' : '✏️'}</div>
                ${empty book ? '添加图书' : '编辑图书'}
            </h2>
            <a href="${pageContext.request.contextPath}/books" class="btn btn-outline btn-sm">← 返回列表</a>
        </div>

        <c:choose>
            <c:when test="${empty book}">
                <form method="post" action="${pageContext.request.contextPath}/books/add">
            </c:when>
            <c:otherwise>
                <form method="post" action="${pageContext.request.contextPath}/books/edit">
                <input type="hidden" name="id" value="${book.id}">
            </c:otherwise>
        </c:choose>

            <div class="form-grid-2">
                <div class="form-group">
                    <label>书名 <span style="color:#dc2626">*</span></label>
                    <input type="text" name="name" value="${book.name}" required placeholder="请输入书名">
                </div>
                <div class="form-group">
                    <label>作者 <span style="color:#dc2626">*</span></label>
                    <input type="text" name="author" value="${book.author}" required placeholder="请输入作者">
                </div>
            </div>

            <div class="form-grid-2">
                <div class="form-group">
                    <label>出版社</label>
                    <input type="text" name="publisher" value="${book.publisher}" placeholder="请输入出版社">
                </div>
                <div class="form-group">
                    <label>ISBN</label>
                    <input type="text" name="isbn" value="${book.isbn}" placeholder="如：978-7-XXX">
                </div>
            </div>

            <div class="form-grid-2">
                <div class="form-group">
                    <label>分类</label>
                    <input type="text" name="category" value="${book.category}" placeholder="如：计算机、文学">
                </div>
                <div class="form-group">
                    <label>总数量 <span style="color:#dc2626">*</span></label>
                    <input type="number" name="total" value="${empty book ? 1 : book.total}" min="1" required>
                </div>
            </div>

            <div class="form-group">
                <label>可借数量 <span style="color:#dc2626">*</span></label>
                <input type="number" name="available" value="${empty book ? 1 : book.available}" min="0" required>
            </div>

            <div class="form-group">
                <label>简介</label>
                <textarea name="description" rows="3" placeholder="请输入图书简介（选填）">${book.description}</textarea>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">💾 保存</button>
                <a href="${pageContext.request.contextPath}/books" class="btn btn-outline">取消</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
