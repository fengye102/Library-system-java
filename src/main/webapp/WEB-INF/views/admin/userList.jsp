<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户管理 - 图书借阅管理系统</title>
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
            <h2><div class="ph-icon">👥</div> 用户管理</h2>
            <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-success">＋ 添加用户</a>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>邮箱</th>
                        <th>手机</th>
                        <th>角色</th>
                        <th>状态</th>
                        <th>注册时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td style="color:var(--muted);font-size:13px;">#${u.id}</td>
                            <td style="font-weight:500;">
                                <div style="display:flex;align-items:center;gap:7px;">
                                    <div style="width:30px;height:30px;background:#dbeafe;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:13px;">👤</div>
                                    ${u.username}
                                </div>
                            </td>
                            <td>${u.realname}</td>
                            <td style="color:var(--muted);font-size:13px;">${u.email}</td>
                            <td style="color:var(--muted);font-size:13px;">${u.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.role == 1}"><span class="badge badge-danger">🔑 管理员</span></c:when>
                                    <c:otherwise><span class="badge badge-info">👤 普通用户</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.status == 1}"><span class="badge badge-success">● 启用</span></c:when>
                                    <c:otherwise><span class="badge badge-danger">○ 禁用</span></c:otherwise>
                                </c:choose>
                            </td>
                            <td style="color:var(--muted);font-size:13px;"><fmt:formatDate value="${u.createTime}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <div style="display:flex;gap:6px;">
                                    <a href="${pageContext.request.contextPath}/admin/users/edit/${u.id}"
                                       class="btn btn-warning btn-sm">✏️ 编辑</a>
                                    <a href="${pageContext.request.contextPath}/admin/users/delete/${u.id}"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('确定删除用户 ${u.username}？')">🗑 删除</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty users}">
                        <tr><td colspan="9" class="td-empty">📭 暂无用户数据</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
