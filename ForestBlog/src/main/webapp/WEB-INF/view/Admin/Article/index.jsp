<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="title">
    - Articles
</rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input {
            display: inline-block;
            width: 33.333% !important;
        }

        .layui-input-block {
            margin: 0px 10px;
        }


    </style>
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
          <a href="/admin">Home</a>
          <a><cite>Articles</cite></a>
        </span>
    </blockquote>

    <div class="layui-tab layui-tab-card">
        <form id="articleForm" method="post">
            <input type="hidden" name="currentUrl" id="currentUrl" value="">
            <table class="layui-table">
                <colgroup>
                    <col width="100">
                    <col width="300">
                    <col width="150">
                    <col width="100">
                    <col width="150">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>User</th>
                    <th>Title</th>
                    <th>Categories</th>
                    <th>Status</th>
                    <th>Published Date</th>
                    <th>Action</th>
                    <th>id</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="a">
                    <tr>
                        <td>
                            <a title="${a.user.userName}" href="/admin/user/edit/${a.articleUserId}" target="_blank">${a.user.userNickname}</a>
                        </td>
                        <td>
                            <a href="/article/${a.articleId}"
                               target="_blank">
                                    ${a.articleTitle}

                            </a></td>
                        <td>
                            <c:forEach items="${a.categoryList}" var="c">
                                <a href="/category/${c.categoryId}"
                                   target="_blank">${c.categoryName}</a>
                                &nbsp;
                            </c:forEach>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${a.articleStatus == 1}">
                                    <a href="/admin/article?status=1">
                                        <span style="color:#5FB878;">Published</span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/admin/article?status=0">
                                        <span style="color:#FF5722;">Draft</span>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatDate value="${a.articleCreateTime}"
                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <a href="/admin/article/edit/${a.articleId}"
                               class="layui-btn layui-btn-mini">Edit</a>
                            <a href="javascript:void(0)"
                               onclick="deleteArticle(${a.articleId})"
                               class="layui-btn layui-btn-danger layui-btn-mini">Delete</a>
                        </td>
                        <td>${a.articleId}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
        <%@ include file="../Public/paging.jsp" %>
    </div>

</rapid:override>
<rapid:override name="footer-script">
    <script></script>
</rapid:override>
<%@ include file="../Public/framework.jsp" %>
