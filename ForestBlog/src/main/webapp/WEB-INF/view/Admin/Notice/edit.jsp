<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - Edit Notice
    </rapid:override>
<rapid:override name="header-style">
    <style>

    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/notice">Notices</a>
              <a><cite>Edit Notice</cite></a>
        </span>
    </blockquote>

    <form class="layui-form"  method="post" id="myForm" action="/admin/notice/editSubmit">
        <input type="hidden" name="noticeId" value="${notice.noticeId}">
        <div class="layui-form-item">
            <label class="layui-form-label">Title  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="noticeTitle" lay-verify="title" id="title" value="${notice.noticeTitle}" class="layui-input" required>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">Content  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="noticeContent" id="content" required>${notice.noticeContent}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Order </label>
            <div class="layui-input-inline">
                <input type="number" name="noticeOrder" value="${notice.noticeOrder}"class="layui-input" min="0" max="10" >
            </div>
            <div class="layui-form-mid layui-word-aux">Enter a number for 1 to 10.</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Status </label>
            <div class="layui-input-block">
                <input type="radio" name="noticeStatus" value="1" title="show" <c:if test="${notice.noticeStatus==1}">checked</c:if>>
                <input type="radio" name="noticeStatus" value="0" title="hide" <c:if test="${notice.noticeStatus==0}">checked</c:if>>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="" type="submit">Save</button>
            </div>
        </div>
    </form>


</rapid:override>
<rapid:override name="footer-script">
    <script>
        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;


            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                    url: '/admin/upload/img' //接口url
                    ,type: 'post' //默认post
                }
            });

            //创建一个编辑器
            var editIndex = layedit.build('content',{
                    height:350,
                }
            );

        });
        //end
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
