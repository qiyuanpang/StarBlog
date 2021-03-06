<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - Add Notice
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
              <a><cite>Add Notice</cite></a>
        </span>
    </blockquote>

    <form class="layui-form"  method="post" id="myForm" action="/admin/notice/insertSubmit">
        <div class="layui-form-item">
            <label class="layui-form-label">Title  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="noticeTitle" lay-verify="title" id="title" class="layui-input" required>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">Content  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="noticeContent" lay-verify="content" id="content" required></textarea>
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="" >Add</button>
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


            //?????????????????????
            form.verify({
                title: function (value) {
                    if (value.length < 10) {
                        return 'Title should contain at least 10 characters!';
                    }
                }
                ,content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            //????????????,???????????? ???????????????????????????
            layedit.set({
                uploadImage: {
                    url: '/admin/upload/img' //??????url
                    ,type: 'post' //??????post
                }
            });

            //?????????????????????
            var editIndex = layedit.build('content',{
                    height:350,
                }
            );

        });
        //end
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
