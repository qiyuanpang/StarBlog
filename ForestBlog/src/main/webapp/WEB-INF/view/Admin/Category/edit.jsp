<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - Categories
    </rapid:override>
<rapid:override name="header-style">
    <style>
        .layui-input-block {
            margin:0px 10px;
        }
    </style>
</rapid:override>

<rapid:override name="content">


    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/category">Categories</a>
              <a><cite>Edit Category</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4" >
            <form class="layui-form"  method="post" id="myForm" action="/admin/category/editSubmit">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>Modify Category</strong>
                    </div>
                    <input type="hidden" name="categoryId" value="${category.categoryId}">
                    <div class="layui-input-block">
                        Name <span style="color: #FF5722; ">*</span>
                        <input type="text" name="categoryName" value="${category.categoryName}" placeholder="" autocomplete="off" class="layui-input" required>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Parent Node <span style="color: #FF5722; ">*</span>
                        <select name="categoryPid" class="layui-input" required>
                            <c:forEach items="${categoryList}" var="c">
                                <c:choose>
                                    <c:when test="${c.categoryId==category.categoryPid}">
                                        <option value="${c.categoryId}" selected>${c.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${c.categoryPid==0}">
                                            <option value="${c.categoryId}">${c.categoryName}</option>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <option value="0" <c:if test="${category.categoryPid==0}">selected</c:if> >None</option>
                        </select>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Description
                        <input type="text" name="categoryDescription" value="${category.categoryDescription}"  class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Icon
                        <input type="text" name="categoryIcon" value="${category.categoryIcon}"class="layui-input" >
                    </div>
                    <br>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo" type="submit">Save</button>
                    </div>
                </div>
            </form>
            <br><br>
        </div>
        <div class="layui-col-md8" >
            <table class="layui-table" >
                <colgroup>
                    <col width="300">
                    <col width="100">
                    <col width="100">
                    <col width="100">
                    <col width="50">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>Name</th>
                    <th>#Articles</th>
                    <th>Action</th>
                    <th>ID</th>
                    <th>pid</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categoryList}" var="c">
                    <c:if test="${c.categoryPid==0}">
                        <tr>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.categoryName}</a>
                            </td>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.articleCount}</a>
                            </td>
                            <td>
                                <a href="/admin/category/edit/${c.categoryId}" class="layui-btn layui-btn-mini">Edit</a>
                                <c:if test="${c.articleCount==0}">
                                    <a href="/admin/category/delete/${c.categoryId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">Delete</a>
                                </c:if>
                            </td>
                            <td>${c.categoryId}</td>
                            <td>${c.categoryPid}</td>
                        </tr>
                        <c:forEach items="${categoryList}" var="c2">
                            <c:if test="${c2.categoryPid==c.categoryId}">
                                <tr>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">——${c2.categoryName}</a>
                                    </td>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">${c2.articleCount}</a>
                                    </td>
                                    <td>
                                        <a href="/admin/category/edit/${c2.categoryId}" class="layui-btn layui-btn-mini">Edit</a>
                                        <c:if test="${c2.articleCount==0}">
                                            <a href="/admin/category/delete/${c2.categoryId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">Delete</a>
                                        </c:if>
                                    </td>
                                    <td class="cate-parent">${c2.categoryId}</td>
                                    <td>${c2.categoryPid}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:if>


                </c:forEach>
                </tbody>
            </table>
            <blockquote class="layui-elem-quote layui-quote-nm">
                Notice:
                <ul>
                    <li>There almost two level of a category. The first level is pid=0 and the second one is pid=parent node id.</li>
<%--                    <li>分类最多只有两级，一级分类pid=0，二级分类pid=其父节点id</li>--%>
                    <li>You could not delete a non-empty category.</li>
                </ul>
            </blockquote>
        </div>

    </div>






</rapid:override>
<rapid:override name="footer-script">

</rapid:override>

<%@ include file="../Public/framework.jsp"%>
