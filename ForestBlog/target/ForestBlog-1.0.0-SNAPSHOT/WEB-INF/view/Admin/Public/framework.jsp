<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="/img/logo.png">
    <title>
        ${options.optionSiteTitle}Backend
            <rapid:block name="title"></rapid:block>
    </title>
    <link rel="stylesheet" href="/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="/css/back.css">
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">
    <rapid:block name="header-style"></rapid:block>
    <rapid:block name="header-script"></rapid:block>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a href="/admin" style="color:#009688;">
        ${options.optionSiteTitle}Backend
        </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/" target="_blank"> Back to Frontend</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">New</a>
                <dl class="layui-nav-child">
                    <dd><a href="/admin/article/insert">Article</a></dd>
                    <dd><a href="/admin/page/insert">Page</a></dd>
                    <dd><a href="/admin/category/insert">Category</a></dd>
                    <dd><a href="/admin/notice/insert">Notice</a></dd>
                    <dd><a href="/admin/link/insert">Link</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${sessionScope.user.userAvatar}" class="layui-nav-img">
                    ${sessionScope.user.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/admin/profile">Basic Info</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="/admin/logout">Sign Out</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

            <c:if test="${sessionScope.user != null && sessionScope.user.userRole == 'admin'}">
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">Article</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/article">All Articles</a></dd>
                        <dd><a href="/admin/article/insert">Write Article</a></dd>
                        <dd><a href="/admin/category">All Categories</a></dd>
                        <dd><a href="/admin/tag">All tags</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">Page</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/page">All Pages</a></dd>
                        <dd><a href="/admin/page/insert">Add Page</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        Link
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/link">All Links</a></dd>
                        <dd><a href="/admin/link/insert">Add Link</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">Notice</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/notice">All Notices</a></dd>
                        <dd><a href="/admin/notice/insert">Add Notice</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/comment">
                        Comments
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">User</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/user">All Users</a></dd>
                        <dd><a href="/admin/user/insert">Add User</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">Setting</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/menu">Menu</a></dd>
                        <dd><a href="/admin/options">Options</a></dd>
                    </dl>
                </li>
            </ul>
            </c:if>

            <c:if test="${sessionScope.user != null && sessionScope.user.userRole == 'user'}">
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">Article</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/admin/article">My Articles</a></dd>
                            <dd><a href="/admin/article/insert">Write Article</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">Comment</a>
                        <dl class="layui-nav-child">
                            <dd><a href="/admin/comment">My Comments</a></dd>
                            <dd><a href="/admin/comment/receive">Received Comments</a></dd>
                        </dl>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <rapid:block name="content">

            </rapid:block>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © <a href="http://blog.liuyanzhao.com">言曌博客</a> 2021  欢迎加入开发者交流群 590480292，博主免费回答大家日常问题。同时博主代做毕设，解决开发问题，详情参看 <a href="https://liuyanzhao.com/shop.html" target="_blank">有偿服务</a>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/plugin/layui/layui.all.js"></script>
<script src="/js/back.js"></script>
<rapid:block name="footer-script">

</rapid:block>
<script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>

</body>
</html>
