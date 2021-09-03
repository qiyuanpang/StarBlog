<%--保留此处 start--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%--保留此处 end--%>
    <rapid:override name="title">
        - New Article
    </rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/article">Articles</a>
              <a><cite>New Article</cite></a>
        </span>
    </blockquote>



    <form class="layui-form"  method="post" id="myForm" action="/admin/article/insertSubmit">

        <div class="layui-form-item">
            <label class="layui-form-label">Title <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="articleTitle" lay-verify="title" id="title" autocomplete="off" placeholder="title" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">Content <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="articleContent" lay-verify="content" id="content"></textarea>
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">Categories <span style="color: #FF5722; ">*</span> </label>
            <div class="layui-input-inline">
                <select name="articleParentCategoryId" id="articleParentCategoryId" lay-filter="articleParentCategoryId" required>
                    <option value="" selected="">First Level</option>
                    <c:forEach items="${categoryList}" var="c">
                        <c:if test="${c.categoryPid==0}">
                            <option value="${c.categoryId}">${c.categoryName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="articleChildCategoryId" id="articleChildCategoryId">
                    <option value="" selected>Second Level</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">Tags</label>
            <div class="layui-input-block">
                <c:forEach items="${tagList}" var="t">
                    <input type="checkbox" name="articleTagIds" lay-skin="primary" title="${t.tagName}" value="${t.tagId}">
                </c:forEach>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">ThumbNail</label>
            <div class="layui-input-inline">
                <div class="layui-upload">
                    <div class="layui-upload-list" style="">
                        <img class="layui-upload-img"  id="demo1" width="100"
                             height="100">
                        <p id="demoText"></p>
                    </div>
                    <button type="button" class="layui-btn" id="test1">Upload Photo</button>
                    <input type="hidden" name="articleThumbnail" id="articleThumbnail" >
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Status</label>
            <div class="layui-input-block">
                <input type="radio" name="articleStatus" value="1" title="launch" checked>
                <input type="radio" name="articleStatus" value="0" title="draft" >
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
                <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
            </div>
        </div>

    </form>


</rapid:override>

<rapid:override name="footer-script">

    <script>
        //上传图片
        layui.use('upload', function () {
            var $ = layui.jquery,
                upload = layui.upload;
            var uploadInst = upload.render({
                elem: '#test1',
                url: '/admin/upload/img',
                before: function (obj) {
                    obj.preview(function (index, file, result) {
                        $('#demo1').attr('src', result);
                    });
                },
                done: function (res) {
                    $("#articleThumbnail").attr("value", res.data.src);
                    if (res.code > 0) {
                        return layer.msg('Failed to upload!');
                    }
                },
                error: function () {
                    var demoText = $('#demoText');
                    demoText.html('' +
                        '<span style="color: #FF5722;">Failed to upload!</span>' +
                        ' <a class="layui-btn layui-btn-mini demo-reload">Try again!</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });

        });
    </script>

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

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 10) {
                        return 'Title at least contains 10 characters!';
                    }
                }
                , pass: [/(.+){6,12}$/, 'Password must contain 6 to 12 characters!']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            layedit.build('content', {
                tool: [
                    'strong' //加粗
                    ,'italic' //斜体
                    ,'underline' //下划线
                    ,'del' //删除线
                    ,'|' //分割线
                    ,'left' //左对齐
                    ,'center' //居中对齐
                    ,'right' //右对齐
                    ,'link' //超链接
                    ,'unlink' //清除链接
                    ,'face' //表情
                    ,'image' //插入图片
                    ,'code'
                ]
            });

            layui.use('code', function(){ //加载code模块
                layui.code();
            });

            //二级联动
            form.on("select(articleParentCategoryId)",function () {
                var optionstring = "";
                var articleParentCategoryId = $("#articleParentCategoryId").val();
                <c:forEach items="${categoryList}" var="c">
                if(articleParentCategoryId==${c.categoryPid}) {
                    optionstring += "<option name='childCategory' value='${c.categoryId}'>${c.categoryName}</option>";
                }
                </c:forEach>
                $("#articleChildCategoryId").html("<option value=''selected>Second Level</option>"+optionstring);
                form.render('select'); //这个很重要
            })

     });
//        window.onbeforeunload = function() {
//            return "确认离开当前页面吗？未保存的数据将会丢失";
//        }



    </script>

</rapid:override>


<%--此句必须放在最后--%>
<%@ include file="../Public/framework.jsp"%>

