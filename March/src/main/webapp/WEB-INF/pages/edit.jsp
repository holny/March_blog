<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
        System.out.println(request.getContextPath());
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="holny">

    <title>March Blog | Edit-${blog.blogTitle}</title>
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">

    <!-- CSS -->
    <link href="${APP_PATH}/static/res/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link href="${APP_PATH}/static/res/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="${APP_PATH}/static/res/css/colors/default.css" rel="stylesheet">
    <link href="${APP_PATH}/static/res/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/res/lib/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/static/res/lib/et-line-font/et-line-font.css" rel="stylesheet">

    <link href="${APP_PATH}/static/res/lib/animate.css/animate.css" rel="stylesheet">

    <link rel="stylesheet" href="${APP_PATH}/static/editormd/css/editormd.css"/>
    <link href="${APP_PATH}/static/toastr/build/toastr.min.css" rel="stylesheet"/>
    <link href="${APP_PATH}/static/res/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/res/css/my.css" rel="stylesheet">

</head>
<body>
<main>
    <div class="page-loader">
        <div class="loader">Loading...</div>
    </div>
    <div class="main">
        <div id="blogEditor" style="height: 100%;margin: 0">
               <textarea style="display:block;">
                   ${blog.blogContent}
               </textarea>
        </div>

        <footer class="footer bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <p class="copyright font-alt">&copy; 2020&nbsp;<a href="#">Hly</a>, All Rights
                            Reserved</p>
                    </div>
                    <div class="col-sm-4 text-center    ">
                        <p class="font-alt" style="margin: 0" id="showTime"></p>
                    </div>
                    <div class="col-sm-4">
                        <div class="footer-social-links">
                            <a href="${githubLink}" target="_blank"><i class="fab fa-github"></i></a>
                            <a href="${weiboLink}" target="_blank"><i class="fab fa-weibo"></i></a>
                            <a href="${weixinLink}" target="_blank"><i class="fab fa-weixin"></i></a>
                            <a href="${emailLink}" target="_blank"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
</div>


</main>
<!-- Modal -->
<div class="modal fade itemInfoModal" tabindex="-1" role="dialog">
    <div class="modal-dialog hShadowAndRound" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h5 class="font-alt mb-0 modal-title">Blog Edit</h5>
            </div>
            <div class="modal-body">
                <h4 class="font-alt mb-0 hModalInfo" style="display: none">Message</h4>
                <form class="form" style="display: none">

                    <div class="form-group" style="display: none">
                        <input class="form-control" name="userId" type="text" placeholder="User Id" value=" ${blog.userId}" readonly>
                    </div>
                    <h5 class="font-alt mb-0">Blog ID:</h5>
                    <div class="form-group">
                        <input class="form-control" name="blogId" type="text" placeholder="Blog Id" value=" ${blog.blogId}" readonly>
                    </div>
                    <div style="display: none" name="originBlogIdArea">
                        <hr class="divider-w mt-10 mb-20">
                        <h5 class="font-alt mb-0">Origin Blog Id:</h5>
                        <div class="form-group">
                            <input class="form-control" name="originalBlogId" type="text" value="${blog.originalBlogId}" placeholder="Origin Blog Id" readonly>
                        </div>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog update time:</h5>
                    <div class="form-group">
                        <p class="form-control" name="blogUpdateTime"><fmt:formatDate type="both" value="${blog.blogUpdateTime}" /></p>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Title:</h5>
                    <div class="form-group">
                        <input class="form-control" name="blogTitle" type="text" value="${blog.blogTitle}" placeholder="Title">
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Intro:</h5>
                    <div class="form-group">
                        <textarea class="form-control hTextarea"  name="blogIntro" rows="7" cols="7" maxlength="300"
                                  placeholder="Blog Intro">${blog.blogIntro}</textarea>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Type:</h5>
                    <div class="row form-group">
                        <div class="col-xs-5 col-sm-5">
                            <select class="form-control blogTypeSelector" name="blogType"  value="${blog.blogType}">
                                <option selected disabled value="">Choose...</option>
                            </select>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <label>
                                <input type="checkbox" name="blogTypeCheckbox" onclick="blog_modify_checkbox($(this),'type')" >
                                添加
                            </label>
                        </div>
                        <div class="col-xs-5 col-sm-5">
                            <input class="form-control" name="newType" type="text" disabled>
                        </div>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Series:</h5>
                    <div class="row form-group" >
                        <div class="col-xs-5 col-sm-5">
                            <select class="form-control seriesIdSelector" value="${blog.seriesId}" name="seriesId">
                                <option selected disabled >Choose...</option>
                            </select>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <label>
                                <input type="checkbox" name="seriesIdCheckbox"  onclick="blog_modify_checkbox($(this),'series')" >
                                添加
                            </label>
                        </div>
                        <div class="col-xs-5 col-sm-5">
                            <input class="form-control" name="newSeries" type="text" disabled>
                        </div>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Status:</h5>
                    <div class="form-group">
                        <select class="form-control" name="blogStatus" value="${blog.blogStatus}" readonly>
                            <option selected disabled value="">Choose...</option>
                            <option value="7" disabled>highlight</option>
                            <option value="6" disabled>normal</option>
                            <option value="5" disabled>friendly</option>
                            <option value="4" disabled>private</option>
                            <option value="3" disabled>draft</option>
                            <option value="2" disabled>preview</option>
                            <option value="1" disabled>pre-create</option>
                        </select>
                        <p class="help-block text-danger pull-right hInputInfo itemInfoModalWarning"></p>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn btn-border-d btn-round cancelBtn" data-dismiss="modal" type="button">Close</button>
                <button class="btn btn-b btn-round confirmBtn"  type="button">Save changes</button>
            </div>
        </div>
    </div>
</div>
<!-- Javascript -->
<script src="${APP_PATH}/static/jquery/jquery.min.js"></script>
<script src="${APP_PATH}/static/res/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/res/lib/wow/dist/wow.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="${APP_PATH}/static/editormd/editormd.js"></script>
<script src="${APP_PATH}/static/xss/dist/xss.min.js"></script>
<script src="${APP_PATH}/static/res/js/main.js"></script>
<script src="${APP_PATH}/static/toastr/build/toastr.min.js"></script>
<script src="${APP_PATH}/static/res/js/my.js"></script>
<script src="${APP_PATH}/static/res/js/edit.js"></script>
<script src="${APP_PATH}/static/res/js/bloglist.js"></script>

<script type="text/javascript">

    $(function () {
        global_blogMap.userId='${blog.userId}';
        global_blogMap.blogId='${blog.blogId}';
        global_blogMap.sourceFrom='${blog.sourceFrom}';
        global_blogMap.blogStatus ='${blog.blogStatus}';

        global_url_map.context_base='${APP_PATH}';
        global_server_running_time = ${runningSec};
        runningTime(global_server_running_time,$("#showTime"));
        blog_editor_init("blogEditor");

        editPageInit($(".itemInfoModal"));
        init_type_list('${blog.userId}',$('.blogTypeSelector'));
        init_series_list('${blog.userId}',$('.seriesIdSelector'));

    });
    // // 删除缓存
    // blogEditor.CodeAutoSaveDelCache();
    // // 清空缓存的文档内容
    // blogEditor.CodeAutoSaveEmptyCacheContent();
    // // 自定义设置缓存
    // blogEditor.CodeAutoSaveSetCache('缓存内容');


</script>
</body>
<!-- Bootstrap core JavaScript -->
<%--<script src="${APP_PATH}/static/res/lib/wow/dist/wow.js"></script>--%>
<%--<script src="${APP_PATH}/static/res/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>--%>
<%--<script src="${APP_PATH}/static/res/lib/isotope/dist/isotope.pkgd.js"></script>--%>
<%--<script src="${APP_PATH}/static/res/lib/imagesloaded/imagesloaded.pkgd.js"></script>--%>
<%--<script src="${APP_PATH}/static/res/lib/flexslider/jquery.flexslider.js"></script>--%>
<%--<script src="${APP_PATH}/static/res/lib/owl.carousel/dist/owl.carousel.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/res/lib/smoothscroll.js"></script>--%>
<%--<script src="${APP_PATH}/static/res/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>--%>

</html>
