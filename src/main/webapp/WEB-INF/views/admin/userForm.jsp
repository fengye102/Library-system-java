<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${empty user ? '添加用户' : '编辑用户'} - 图书借阅管理系统</title>
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
        <a href="${pageContext.request.contextPath}/admin/users">👥 用户管理</a>
        <a href="${pageContext.request.contextPath}/logout" class="nav-user">
            <div class="nav-avatar">👤</div>
            ${sessionScope.loginUser.username}
        </a>
    </div>
</nav>

<div class="container">
    <div class="card" style="max-width:620px;">
        <div class="page-header">
            <h2>
                <div class="ph-icon">${empty user ? '➕' : '✏️'}</div>
                ${empty user ? '添加用户' : '编辑用户'}
            </h2>
            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline btn-sm">← 返回列表</a>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">⚠️ ${error}</div>
        </c:if>

        <c:choose>
            <c:when test="${empty user}">
                <form method="post" action="${pageContext.request.contextPath}/admin/users/add">
            </c:when>
            <c:otherwise>
                <form method="post" action="${pageContext.request.contextPath}/admin/users/edit">
                <input type="hidden" name="id" value="${user.id}">
            </c:otherwise>
        </c:choose>

            <div class="form-grid-2">
                <div class="form-group">
                    <label>用户名 <span style="color:#dc2626">*</span></label>
                    <input type="text" name="username" value="${user.username}" required
                           ${not empty user ? 'readonly' : ''}
                           placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label>真实姓名 <span style="color:#dc2626">*</span></label>
                    <input type="text" name="realname" value="${user.realname}" required placeholder="请输入真实姓名">
                </div>
            </div>

            <div class="form-group">
                <label>
                    密码
                    <c:choose>
                        <c:when test="${not empty user}">
                            <span style="color:var(--muted);font-weight:400;">（不填则不修改）</span>
                        </c:when>
                        <c:otherwise><span style="color:#dc2626">*</span></c:otherwise>
                    </c:choose>
                </label>
                <input type="password" name="password" ${empty user ? 'required' : ''} placeholder="请输入密码">
            </div>

            <div class="form-grid-2">
                <div class="form-group">
                    <label>邮箱</label>
                    <input type="email" name="email" value="${user.email}" placeholder="选填">
                </div>
                <div class="form-group">
                    <label>手机</label>
                    <input type="text" name="phone" value="${user.phone}" placeholder="选填">
                </div>
            </div>

            <div class="form-grid-2">
                <div class="form-group">
                    <label>角色</label>
                    <select name="role">
                        <option value="0" ${user.role != 1 ? 'selected' : ''}>👤 普通用户</option>
                        <option value="1" ${user.role == 1 ? 'selected' : ''}>🔑 管理员</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>状态</label>
                    <select name="status">
                        <option value="1" ${user.status != 0 ? 'selected' : ''}>● 启用</option>
                        <option value="0" ${user.status == 0 ? 'selected' : ''}>○ 禁用</option>
                    </select>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">💾 保存</button>
                <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline">取消</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
