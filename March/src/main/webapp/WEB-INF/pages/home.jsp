<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
    <title>March Blog | Home</title>
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

    <link href="${APP_PATH}/static/toastr/build/toastr.min.css" rel="stylesheet"/>
    <link href="${APP_PATH}/static/res/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/res/css/my.css" rel="stylesheet">

</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
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
                <a class="navbar-brand" href="#">March</a>
            </div>
            <div class="collapse navbar-collapse" id="custom-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Home</a>
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
                                    <li><a href="${APP_PATH}/admin/go" target="_blank">Admin</a></li>
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

    <div class="main">
        <section class="module-small">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <!-- Search Area 搜索-->
                        <form class="form searchForm hWitheBg" style="display: none">
                            <div class="form-row mb-sm-10 mt-sm-40">
                                <div class="col-sm-3">
                                    <div class="form-group hInputGroup">
                                        <input class="form-control input-sm" name="userName" type="text"
                                               placeholder="Author ">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group hInputGroup">
                                        <input class="form-control input-sm" name="blogTitle" type="text"
                                               placeholder="Blog title">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group hInputGroup">
                                        <input class="form-control input-sm" name="blogId" type="text"
                                               placeholder="Blog Id">
                                    </div>
                                </div>
                                <div class="col-sm-3">

                                    <div class="form-group hInputGroup">
                                        <select class="form-control" name="blogStatus">
                                            <option selected disabled value="">Blog status...</option>
                                            <option value="7">highlight</option>
                                            <option value="6">normal</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-sm-3">
                                    <div class="form-group hInputGroup">
                                        <div class='input-group date hourMinTimePicker timeRangeStart'>
                                            <input type='text' name="updateTimeStart" class="form-control  input-sm"
                                                   placeholder="最近更新-起"
                                                   readonly/>
                                            <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group hInputGroup">
                                        <div class='input-group date hourMinTimePicker timeRangeEnd'>
                                            <input type='text' name="updateTimeEnd" class="form-control input-sm"
                                                   placeholder="最近更新-止"
                                                   readonly/>
                                            <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">

                                    <div class="form-group hInputGroup">
                                        <select class="form-control blogTypeSelector" name="blogType">
                                            <option selected disabled value="">Blog type</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-3">

                                    <div class="form-group hInputGroup">
                                        <select class="form-control seriesIdSelector" name="seriesId">
                                            <option selected disabled>Blog series</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group text-center">
                                <button class="btn btn-d btn-round btn-xs" onclick='start_search($(".searchForm"))'
                                        type="button">
                                    <i class="fal fa-search"></i> 搜索
                                </button>
                                <button class="btn btn-g btn-round btn-xs" onclick='reset_search($(".searchForm"))'
                                        type="button">
                                    <i class="fal fa-sync"></i> 重置
                                </button>
                                <p class="help-block text-danger hInputInfo searchWarning"></p>
                            </div>
                        </form>
                        <h4 class="font-alt mb-0 tabTitle">Blog List</h4>
                        <a class="font-alt mb-20 pull-right"
                           onclick='search_bar_hide_or_show($(this),$(".searchForm"))'><i
                                class="fas fa-filter"></i> 筛选一下?</a>
                        <hr class="divider-w mt-10 mb-0">
                        <div class="row">
                            <div class="col-sm-3 dropdown"><a class="dropdown-toggle font-alt blogListSort"
                                                              data-toggle="dropdown"><i class="fas fa-sort fa-lg"></i>
                                排序</a>
                                <ul class="dropdown-menu sortMenu" role="menu">
                                    <li value="updateTimeASC"><a><i class="fal fa-sort-amount-up-alt"></i> 更新时间-升序</a>
                                    </li>
                                    <li value="updateTimeDESC"><a><i class="fal fa-sort-amount-down"></i> 更新时间-降序</a>
                                    </li>
                                    <li value="viewASC"><a><i class="fal fa-sort-amount-up-alt"></i> 浏览量-升序</a></li>
                                    <li value="viewDESC"><a><i class="fal fa-sort-amount-down"></i> 浏览量-降序</a></li>
                                    <%--                                    <li value="commentASC"><a><i class="fal fa-sort-amount-up-alt"></i> 评论数-升序</a></li>--%>
                                    <%--                                    <li value="commentDESC"><a><i class="fal fa-sort-amount-down"></i> 评论数-降序</a></li>--%>
                                    <li value="likeASC"><a><i class="fal fa-sort-amount-up-alt"></i> 点赞数-升序</a></li>
                                    <li value="likeDESC"><a><i class="fal fa-sort-amount-down"></i> 点赞数-降序</a></li>
                                    <li value><a><i class="far fa-circle-notch"></i> 默认排序</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-7" style="width: min-content">
                                <small class="mb-0 pull-right searchAndSortInfo"></small>
                            </div>
                        </div>
                        <div class="row post-masonry post-columns" id="listPostArea">
                            <!-- 列表区 -->

                        </div>
                        <div class="pagination font-alt"><a href="#"><i class="fa fa-angle-left"></i></a><a
                                class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a
                                href="#"><i class="fa fa-angle-right"></i></a></div>
                    </div>

                    <!-- SideBarArea -->
                    <div class="col-sm-3 col-md-3 col-md-offset-1 sidebar homeSideBarArea">
                        <div class="widget" style="text-align: center">
                            <hr class="divider-w mb-10">
                            <h4 class="font-alt mb-0">欢迎</h4>
                            <div class="row mb-10">
                                <h5 class="font-alt mb-0 guestIp">当前Ip:111:111:111:111</h5>
                            </div>
                            <hr class="divider-w mb-10">
                            <h5 class="font-alt mb-0">欢迎访问:</h5>
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
                            <h5 class="widget-title font-alt">推荐博文:</h5>
                            <div role="tabpanel">
                                <ul class="nav nav-tabs font-alt" role="tablist">
                                    <li class="active"><a href="" name="commendBlogSidebarTab"
                                                          data-toggle="tab"><span
                                            class="icon-tools-2"></span>Blog</a></li>
                                    <li><a href="" name="commendBlogSidebarTab" data-toggle="tab"><span
                                            class="icon-tools-2"></span>Series</a>
                                    </li>
                                </ul>
                            </div>
                            <ul class="icon-list">
                                <li><a href="#" target="_blank" class="hText-limit-chars"></a></li>
                            </ul>
                        </div>
                        <div class="widget">
                            <h5 class="widget-title font-alt">活跃用户:</h5>
                            <div role="tabpanel">
                                <ul class="nav nav-tabs font-alt" role="tablist">
                                    <li class="active"><a href="" name="commendUserSidebarTab"
                                                          data-toggle="tab"><span
                                            class="icon-tools-2"></span>最近</a></li>
                                    <li><a href="" name="commendUserSidebarTab" data-toggle="tab"><span
                                            class="icon-tools-2"></span>活跃</a>
                                    </li>
                                </ul>
                            </div>
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
<script src="${APP_PATH}/static/toastr/build/toastr.min.js"></script>
<script src="${APP_PATH}/static/res/js/my.js"></script>
<script src="${APP_PATH}/static/res/js/bloglist.js"></script>
<script type="text/javascript">
    $(function () {
        global_url_map.context_base = '${APP_PATH}';
        global_server_running_time = ${runningSec};
        runningTime(global_server_running_time, $("#showTime"));
        init_blog_list($("#listPostArea"), 'home', null, false);

        init_type_list(-1, $('.blogTypeSelector'), 'home');
        init_series_list(-1, $('.seriesIdSelector'), 'home');
        get_home_summary($('.homeSideBarArea'));
    });
</script>
</body>
</html>
