<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="description">
    <meta name="description" content="All Articles"/>
</rapid:override>

<rapid:override name="keywords">
    <meta name="keywords" content="All Articles"/>
</rapid:override>

<rapid:override name="title">
    <title>All Articles--${options.optionSiteTitle}</title>
</rapid:override>

<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>Home
        </a>
        <i class="fa fa-angle-right"></i>
        All Articles
        <i class="fa fa-angle-right"></i>
        Content
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>

<rapid:override name="left">
    <%--博客主体-左侧正文 start--%>
    <section id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <ul class="search-page">
                <c:forEach items="${articleList}" var="a">
                    <li class="search-inf">
                        <fmt:formatDate value="${a.articleCreateTime}" pattern="yyyy-MM-dd"/>
                    </li>
                    <li class="entry-title">
                        <a href="/article/${a.articleId}">${a.articleTitle}</a>
                    </li>
                </c:forEach>
            </ul>
        </main>
    </section>
</rapid:override>


<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="../Public/part/sidebar-3.jsp" %>
</rapid:override>
<%--侧边栏 end--%>
<%@ include file="../Public/framework.jsp" %>