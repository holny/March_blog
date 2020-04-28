<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hly.march.vo.BlogUserVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="holny">

    <title>March Blog | ${blog.blogTitle}</title>
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

    <link rel="stylesheet" href="${APP_PATH}/static/editormd/css/editormd.min.css"/>
    <link href="${APP_PATH}/static/res/css/my.css" rel="stylesheet">

</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" >

<main>
    <div class="page-loader">
        <div class="loader">Loading...</div>
    </div>
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span
                        class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span></button>
                <a class="navbar-brand" href="${APP_PATH}/home">Titan</a>
            </div>
            <div class="collapse navbar-collapse" id="custom-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${APP_PATH}/home">Home</a>
                    </li>
                    <shiro:user>
                        <li><a href="${APP_PATH}/myblog" target="_blank">My Blog</a>
                        </li>
                    </shiro:user>
                    <shiro:hasPermission name="blog:create">
                        <li><a href="${APP_PATH}/blog/edit/-1" target="_blank">A New Blog</a>
                        </li>
                    </shiro:hasPermission>
                    <shiro:guest>
                        <li><a href="${APP_PATH}/login">Login</a>
                        </li>
                    </shiro:guest>
                    <shiro:user>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown">
                                <img src="${APP_PATH}/file/showPic/<shiro:principal property='userProfilePic'/>" alt="头像" class="img-circle loginProfilePic hAvatar-small">
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a class="font-alt"><shiro:principal property="userName"/>(<shiro:hasRole name="forbidden">Forbidden</shiro:hasRole><shiro:hasRole name="admin">Admin</shiro:hasRole>)</a>
                                </li>
                                <shiro:hasRole name="admin">
                                    <li><a href="${APP_PATH}/admin" target="_blank">Admin</a></li>
                                </shiro:hasRole>
                                <li><a href="${APP_PATH}/my" target="_blank">My profile</a></li>
                                <li><a href="${APP_PATH}/logout">Log out</a></li>
                            </ul>
                        </li>
                    </shiro:user>
                </ul>
            </div>
        </div>
    </nav>

    <div class="main" style="height: 100%">
        <div class="hWhole_bg" style="background: url('${APP_PATH}/static/res/img/bg/home-bg1.jpg') no-repeat fixed;">
            <div class="hOverlay"></div>
        </div>
        <section class="module-small">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 hWitheBg hWitheBg hShadowAndRound">
                        <div class="post">
                            <!-- Blog Title and Info Area -->
                            <div class="post-header font-alt text-center">
                                <h1 class="post-title">${blog.blogTitle}</h1>
                                <div class="post-meta">
                                    <a href="${APP_PATH}/profile/${blog.user.userId}" target="_blank"><i class="fad fa-user-alt"></i>${blog.user.userName}</a>
                                    | <i class="fad fa-calendar-alt"></i><fmt:formatDate type="both" value="${blog.blogUpdateTime}" />
                                    | <a href="${APP_PATH}/series/${blog.blogSeriesEntity.seriesId}" target="_blank"><i class="fab fa-slack-hash"></i>${blog.blogSeriesEntity.seriesName}</a>
                                </div>
                                <div class="post-meta">
                                    <i class="fal fa-eye"></i>${blog.blogViews}
                                    | <i class="fal fa-comment-lines"></i>${blog.blogCommentCount}
                                    | <%
                                        BlogUserVo  blogUserVo=(BlogUserVo)request.getAttribute("blog");
                                    if(request.getSession().getAttribute("like")!=null && ((ArrayList<Long>)request.getSession().getAttribute("like")).contains(blogUserVo.getBlogId()))
                                    {%>
                                    <a ><i class="fas fa-thumbs-up"></i>${blog.blogLikeCount+1}</a>
                                    <%}else{%>
                                    <a onclick="like_click($('.likeClickEvent'),${blog.blogId},${blog.blogLikeCount})" class="likeClickEvent"><i class="far fa-thumbs-up"></i>${blog.blogLikeCount}</a>
                                    <%}%>
                                </div>
                            </div>
                            <div class="post-entry">
                                <!-- Blog Content Area -->
                                <div id="blogContent" style="padding:0 5% 5% 5%">
                                    <textarea id="mdContent" style="display: none">
                                        ${blog.blogContent}
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <!-- Blog Comment Area -->
<%--                        <div class="comments">--%>
<%--                            <h4 class="comment-title font-alt">There are 3 comments</h4>--%>
<%--                            <div class="comment clearfix">--%>
<%--                                <div class="comment-avatar"><img src="" alt="avatar"/></div>--%>
<%--                                <div class="comment-content clearfix">--%>
<%--                                    <div class="comment-author font-alt"><a href="#">John Doe</a></div>--%>
<%--                                    <div class="comment-body">--%>
<%--                                        <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="comment-meta font-alt">Today, 14:55 - <a href="#">Reply</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="comment clearfix">--%>
<%--                                    <div class="comment-avatar"><img src="" alt="avatar"/></div>--%>
<%--                                    <div class="comment-content clearfix">--%>
<%--                                        <div class="comment-author font-alt"><a href="#">Mark Stone</a></div>--%>
<%--                                        <div class="comment-body">--%>
<%--                                            <p>Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="comment-meta font-alt">Today, 15:34 - <a href="#">Reply</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="comment clearfix">--%>
<%--                                <div class="comment-avatar"><img src="" alt="avatar"/></div>--%>
<%--                                <div class="comment-content clearfix">--%>
<%--                                    <div class="comment-author font-alt"><a href="#">Andy</a></div>--%>
<%--                                    <div class="comment-body">--%>
<%--                                        <p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The European languages are members of the same family. Their separate existence is a myth.</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="comment-meta font-alt">Today, 14:59 - <a href="#">Reply</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="comment-form">--%>
<%--                            <h4 class="comment-form-title font-alt">Add your comment</h4>--%>
<%--                            <form method="post">--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="sr-only" for="name">Name</label>--%>
<%--                                    <input class="form-control" id="name" type="text" name="name" placeholder="Name"/>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label class="sr-only" for="email">Name</label>--%>
<%--                                    <input class="form-control" id="email" type="text" name="email" placeholder="E-mail"/>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <textarea class="form-control" id="comment" name="comment" rows="4" placeholder="Comment"></textarea>--%>
<%--                                </div>--%>
<%--                                <button class="btn btn-round btn-d" type="submit">Post comment</button>--%>
<%--                            </form>--%>
<%--                        </div>--%>
                    </div>
                    <div class="col-sm-4 col-md-3 col-md-offset-1 sidebar userInfoSidebarArea  hWitheBg hShadowAndRound">
                        <div class="widget" style="text-align: center">
                            <img src="" alt="头像" class="img-circle userProfilePic hAvatar">
                            <h4 class="font-alt mb-0">XXX</h4>
                            <div class="row">
                                <div class="col-xs-4 col-sm-4">
                                    <h5 class="font-alt mb-0">原创:</h5>
                                    <p style="font-weight: 900">0</p>
                                </div>
                                <div class="col-xs-4 col-sm-4">
                                    <h5 class="font-alt mb-0">获赞:</h5>
                                    <p style="font-weight: 900">0</p>
                                </div>
<%--                                <div class="col-xs-3 col-sm-3">--%>
<%--                                    <h5 class="font-alt mb-0">评论:</h5>--%>
<%--                                    <p style="font-weight: 900">0</p>--%>
<%--                                </div>--%>
                                <div class="col-xs-4 col-sm-4">
                                    <h5 class="font-alt mb-0">访问:</h5>
                                    <p style="font-weight: 900">0</p>
                                </div>
                            </div>
                            <hr class="divider-w mb-10">
                            <div class="row" style="margin: 10px 0">
                                <div class="col-xs-3 col-sm-3">
                                    <a href="#" target="_blank"><i class="fab fa-github fa-2x"></i></a>
                                </div>
                                <div class="col-xs-3 col-sm-3">
                                    <a href="#" target="_blank"><i class="fab fa-weibo fa-2x"></i></a>
                                </div>
                                <div class="col-xs-3 col-sm-3">
                                    <a href="#" target="_blank"><i class="fab fa-weixin fa-2x"></i></a>
                                </div>
                                <div class="col-xs-3 col-sm-3">
                                    <a href="#" target="_blank"><i class="fas fa-envelope fa-2x"></i></a>
                                </div>
                            </div>
                            <hr class="divider-w mb-10">
                            <div class="post-quote">
                                <blockquote>
                                    <small class="hText-limit-line"></small>
                                </blockquote>
                            </div>
                        </div>

                        <div class="widget">
                            <h5 class="widget-title font-alt">博文:</h5>
                            <div role="tabpanel">
                                <ul class="nav nav-tabs font-alt" role="tablist">
                                    <li class="active"><a href="#support" name="newOrHotSidebarTab"
                                                          data-toggle="tab"><span
                                            class="icon-tools-2"></span>New</a></li>
                                    <li><a href="#sales" name="newOrHotSidebarTab" data-toggle="tab"><span
                                            class="icon-tools-2"></span>HOT</a>
                                    </li>
                                </ul>
                            </div>
                            <ul class="icon-list">
                                <li><a href="#" target="_blank" class="hText-limit-chars"></a></li>
                            </ul>
                        </div>
                        <div class="widget">
                            <h5 class="widget-title font-alt">专题:</h5>
                            <ul class="icon-list">
                                <li><a href="#" target="_blank" class="hText-limit-chars"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr class="divider-d">
        <footer class="footer bg-dark">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <p class="copyright font-alt">&copy; 2020&nbsp;<a href="#">Hly</a>, All Rights
                            Reserved</p>
                    </div>
                    <div class="col-sm-3 text-center">
                        <p class="font-alt" style="margin: 0">您是本站的第${visitorNum}位访客!</p>
                    </div>
                    <div class="col-sm-3 text-center    ">
                        <p class="font-alt" style="margin: 0" id="showTime"></p>
                    </div>
                    <div class="col-sm-3">
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
</main>

<!-- Javascript -->
<script src="${APP_PATH}/static/jquery/jquery.min.js"></script>
<script src="${APP_PATH}/static/res/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/res/lib/wow/dist/wow.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="${APP_PATH}/static/res/js/main.js"></script>
<script src="${APP_PATH}/static/res/js/my.js"></script>

<%--<script src="${APP_PATH}/static/strapdown/v/0.1/strapdown.js"></script>--%>

<!-- Editor.md Js -->
<script src="${APP_PATH}/static/editormd/lib/flowchart.min.js"></script>
<script src="${APP_PATH}/static/editormd/lib/jquery.flowchart.min.js"></script>
<script src="${APP_PATH}/static/editormd/lib/marked.min.js"></script>
<script src="${APP_PATH}/static/editormd/lib/prettify.min.js"></script>
<script src="${APP_PATH}/static/editormd/lib/raphael.min.js"></script>
<%--<script src="${APP_PATH}/static/editormd/lib/sequence-diagram.min.js"></script>--%>
<script src="${APP_PATH}/static/editormd/lib/underscore.min.js"></script>
<script src="${APP_PATH}/static/editormd/editormd.min.js"></script>


</body>
<script type="text/javascript">
    $(function () {
        let testEditor;
        testEditor = editormd.markdownToHTML("blogContent", {//注意：这里是上面DIV的id
            // markdown : markdown ,
            htmlDecode: "style,script,iframe",
            toc: false,
            tocm: true,
            emoji: true,
            taskList: true,
            tex: false, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: false, // 默认不解析
            codeFold: true,
        });
        global_url_map.context_base = '${APP_PATH}';

        global_server_running_time = ${runningSec};
        runningTime(global_server_running_time, $("#showTime"));

        get_user_statics(${blog.userId}, $('.userInfoSidebarArea'));
    });
</script>
</html>