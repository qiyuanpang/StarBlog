<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - Edit Link
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input-block {
            margin:0px 10px;
        }
        .layui-table {
            margin-top: 0;
        }
        .layui-col-md4 {
            padding:10px;
        }
        .layui-col-md8 {
            padding:10px;
        }
        .layui-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/link">Links</a>
              <a><cite>Edit Link</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4">
            <form class="layui-form" method="post" id="myForm" action="/admin/link/editSubmit">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>Edit Tag</strong>
                    </div>
                    <input type="hidden" name="linkId" value="${linkCustom.linkId}">
                    <div class="layui-input-block">
                        Name <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkName" value="${linkCustom.linkName}" autocomplete="off" class="layui-input" required>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        URL  <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkUrl" value="${linkCustom.linkUrl}" autocomplete="off" class="layui-input" required>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Contact
                        <input type="text" name="linkOwnerContact" value="${linkCustom.linkOwnerContact}" autocomplete="off" class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Description
                        <input type="text" name="linkDescription" value="${linkCustom.linkDescription}" autocomplete="off" class="layui-input" >
                    </div>

                    <br>
                    <div class="layui-input-block">
                         Order
                        <input type="number" name="linkOrder" value="${linkCustom.linkOrder}" autocomplete="off" class="layui-input" min="0" max="10">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Status <br>
                        <input type="radio" name="linkStatus" value="1" title="show" <c:if test="${linkCustom.linkStatus==1}">checked</c:if>>
                        <input type="radio" name="linkStatus" value="0" title="hide" <c:if test="${linkCustom.linkStatus==0}">checked</c:if>>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo" type="submit">Save</button>
                    </div>
                </div>
            </form>
            <blockquote class="layui-elem-quote layui-quote-nm">
                Notice:
                <ul>
                    <li>URL: e.g., http://qiyuanpang.com</li>
                    <li>Order: 0 by default.</li>
                </ul>
            </blockquote>
        </div>
        <div class="layui-col-md8">
            <table class="layui-table" >
                <colgroup>
                    <col width="50">
                    <col width="300">
                    <col width="100">
                    <col width="50">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>URL</th>
                    <th>Order</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${linkList}" var="l">

                    <tr>
                        <td>${l.linkId}</td>
                        <td>
                            ${l.linkName}
                        </td>
                        <td>
                             ${l.linkUrl}
                        </td>
                        <td>
                            ${l.linkOrder}
                        </td>
                        <td>
                            <a href="/admin/link/edit/${l.linkId}" class="layui-btn layui-btn-mini">Edit</a>
                            <a href="/admin/link/delete/${l.linkId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">Delete</a>

                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
