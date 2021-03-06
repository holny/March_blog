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

    <title>March Blog | Admin</title>
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
                <a class="navbar-brand" href="${APP_PATH}/home">Titan</a>
            </div>
            <div class="collapse navbar-collapse" id="custom-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${APP_PATH}/home">Home</a>
                    </li>
                    <shiro:user>
                        <li><a href="#">My Blog</a>
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
                                <img src="${APP_PATH}/file/showPic/<shiro:principal property='userProfilePic'/>"
                                     alt="头像" class="img-circle loginProfilePic hAvatar-small">
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a class="font-alt"><shiro:principal property="userName"/>(<shiro:hasRole
                                            name="forbidden">Forbidden</shiro:hasRole><shiro:hasRole
                                            name="admin">Admin</shiro:hasRole>)</a>
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

    <div class="main">
        <section class="module-small">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <div role="tabpanel">
                            <ul class="nav nav-tabs font-alt hMyBlogTab" role="tablist">
                                <li class="active">
                                    <a href="#blogNotice" name="adminSwitchTab" data-toggle="tab" aria-expanded="false">
                                        <span class="icon-newspaper"></span>Blog
                                    </a>
                                </li>
                                <li class="">
                                    <a href="#draftNotice" name="adminSwitchTab" data-toggle="tab" aria-expanded="true">
                                        <span class="icon-documents"></span>Draft
                                    </a>
                                </li>
                                <li class="">
                                    <a href="#userNotice" name="adminSwitchTab" data-toggle="tab" aria-expanded="true">
                                        <span class="icon-documents"></span>User
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="blogNotice">
                                </div>
                                <div class="tab-pane fade" id="draftNotice">
                                </div>
                                <div class="tab-pane fade" id="userNotice">
                                </div>
                            </div>
                        </div>
                        <form class="form searchForm listSearchForm hWitheBg" style="display: none">
<%--                            <div class="form-row mb-sm-10 mt-sm-40">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <input class="form-control input-sm" name="userName" type="text"--%>
<%--                                               placeholder="Author ">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <input class="form-control input-sm" name="blogTitle" type="text"--%>
<%--                                               placeholder="Blog title">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <input class="form-control input-sm" name="blogId" type="text"--%>
<%--                                               placeholder="Blog Id">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-3">--%>

<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <select class="form-control" name="blogStatus">--%>
<%--                                            <option selected disabled value="">Blog status...</option>--%>
<%--                                            <option value="7">highlight</option>--%>
<%--                                            <option value="6">normal</option>--%>
<%--                                            <option value="5">friendly</option>--%>
<%--                                            <option value="4">private</option>--%>
<%--                                            <option value="3">draft</option>--%>
<%--                                            <option value="2">preview</option>--%>
<%--                                            <option value="1">pre-create</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-row">--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <div class='input-group date hourMinTimePicker timeRangeStart'>--%>
<%--                                            <input type='text' name="updateTimeStart" class="form-control  input-sm"--%>
<%--                                                   placeholder="最近更新-起"--%>
<%--                                                   readonly/>--%>
<%--                                            <span class="input-group-addon">--%>
<%--                                                    <span class="glyphicon glyphicon-calendar"></span>--%>
<%--                                                    </span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-3">--%>
<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <div class='input-group date hourMinTimePicker timeRangeEnd'>--%>
<%--                                            <input type='text' name="updateTimeEnd" class="form-control input-sm"--%>
<%--                                                   placeholder="最近更新-止"--%>
<%--                                                   readonly/>--%>
<%--                                            <span class="input-group-addon">--%>
<%--                                                    <span class="glyphicon glyphicon-calendar"></span>--%>
<%--                                                    </span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-3">--%>

<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <select class="form-control blogTypeSelector" name="blogType">--%>
<%--                                            <option selected disabled value="">Blog type</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-sm-3">--%>

<%--                                    <div class="form-group hInputGroup">--%>
<%--                                        <select class="form-control seriesIdSelector" name="seriesId">--%>
<%--                                            <option selected disabled>Blog series</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group text-center">--%>
<%--                                <button class="btn btn-d btn-round btn-xs" onclick='start_search($(".searchForm"))'--%>
<%--                                        type="button">--%>
<%--                                    <i class="fal fa-search"></i> 搜索--%>
<%--                                </button>--%>
<%--                                <button class="btn btn-g btn-round btn-xs" onclick='reset_search($(".searchForm"))'--%>
<%--                                        type="button">--%>
<%--                                    <i class="fal fa-sync"></i> 重置--%>
<%--                                </button>--%>
<%--                                <p class="help-block text-danger hInputInfo searchWarning"></p>--%>
<%--                            </div>--%>
                        </form>
<%--                        <h4 class="font-alt mb-0 tabTitle">Blog List</h4>--%>
                        <a class="font-alt mb-20 pull-right"
                           onclick='search_bar_hide_or_show($(this),$(".searchForm"))'><i
                                class="fas fa-filter"></i> 筛选一下?</a>
                        <hr class="divider-w mt-10 mb-0">
                        <div class="row">
                            <div class="col-sm-3 dropdown lisSort">
                                <a class="dropdown-toggle font-alt" data-toggle="dropdown"><i class="fas fa-sort fa-lg"></i>排序</a>
                                <ul class="dropdown-menu sortMenu " role="menu">
<%--                                    <li value="updateTimeASC"><a><i class="fal fa-sort-amount-up-alt"></i> 更新时间-升序</a>--%>
<%--                                    </li>--%>
<%--                                    <li value="updateTimeDESC"><a><i class="fal fa-sort-amount-down"></i> 更新时间-降序</a>--%>
<%--                                    </li>--%>
<%--                                    <li value="viewASC"><a><i class="fal fa-sort-amount-up-alt"></i> 浏览量-升序</a></li>--%>
<%--                                    <li value="viewDESC"><a><i class="fal fa-sort-amount-down"></i> 浏览量-降序</a></li>--%>
<%--                                    <li value="likeASC"><a><i class="fal fa-sort-amount-up-alt"></i> 点赞数-升序</a></li>--%>
<%--                                    <li value="likeDESC"><a><i class="fal fa-sort-amount-down"></i> 点赞数-降序</a></li>--%>
<%--                                    <li value><a><i class="far fa-circle-notch"></i> 默认排序</a></li>--%>
                                </ul>
                            </div>
                            <div class="col-sm-7" style="width: min-content">
                                <small class="mb-0 pull-right searchAndSortInfo"></small>
                            </div>
                        </div>
                        <div class="row post-masonry post-columns table-responsive" id="listPostArea">
                            <!-- 列表区 -->
<%--                            <table class="table table-striped table-hover">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th class="col-sm-1"><input type='checkbox' class='check_item'/></th>--%>
<%--                                    <th class="col-sm-1">Id</th>--%>
<%--                                    <th class="col-sm-2">Title</th>--%>
<%--                                    <th class="col-sm-1">Author(User Id)</th>--%>
<%--                                    <th class="col-sm-1">Status</th>--%>
<%--                                    <th class="col-sm-1">Type</th>--%>
<%--                                    <th class="col-sm-1">Series</th>--%>
<%--                                    <th class="col-sm-1">UpdateTime</th>--%>
<%--                                    <th class="col-sm-1">Views</th>--%>
<%--                                    <th class="col-sm-1">Likes</th>--%>
<%--                                    <th class="col-sm-1">操作</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <tr>--%>
<%--                                    <td><input type='checkbox' class='check_item'/></td>--%>
<%--                                    <td>bbbb</td>--%>
<%--                                    <td>ccc</td>--%>
<%--                                    <td>ddd</td>--%>
<%--                                    <td>eee</td>--%>
<%--                                    <td>fff</td>--%>
<%--                                    <td>aaaa</td>--%>
<%--                                    <td>bbbb</td>--%>
<%--                                    <td>ccc</td>--%>
<%--                                    <td>ccc</td>--%>
<%--                                    <td>--%>
<%--                                        <button class="btn btn-d btn-circle btn-block btn-xs" type="button">--%>
<%--                                            <i class="fa fa-cog fa-spin"></i> 设置</button>--%>
<%--                                        <button type="button" class="btn btn-g btn-circle btn-block btn-xs">--%>
<%--                                            <i class="fas fa-trash"></i>--%>
<%--                                            删除--%>
<%--                                        </button>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
                        </div>
                        <div class="pagination font-alt">
                            <a href="#"><i class="fa fa-angle-left"></i></a>
                            <a class="active" href="#">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#"><i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                    <!-- SideBar Area -->
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
                    <div class="col-sm-4">
                        <p class="copyright font-alt">&copy; 2020&nbsp;<a href="#">Hly</a>, All Rights
                            Reserved</p>
                    </div>
                    <div class="col-sm-4 text-center">
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
</main>

<!--Modal-->
<div class="modal fade itemInfoModal"  data-backdrop="static" tabindex="-1" role="dialog">
    <div class="modal-dialog hShadowAndRound" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h5 class="font-alt mb-0 modal-title">Blog</h5>
            </div>
            <div class="modal-body">
                <form class="form itemInfoForm">
                    <div class="form-group" style="">
                        <input class="form-control" name="sourceFrom" type="text" placeholder="sourceFrom" readonly>
                    </div>
                    <div class="form-group" style="display: none">
                        <input class="form-control" name="userId" type="text" placeholder="User Id" readonly>
                    </div>
                    <h5 class="font-alt mb-0">Blog ID:</h5>
                    <div class="form-group">
                        <input class="form-control" name="blogId" type="text" placeholder="Blog Id" readonly>
                    </div>
                    <div style="display: none" name="originBlogIdArea">
                        <hr class="divider-w mt-10 mb-20">
                        <h5 class="font-alt mb-0">Origin Blog Id:</h5>
                        <div class="form-group">
                            <input class="form-control" name="originalBlogId" type="text" placeholder="Origin Blog Id"
                                   readonly>
                        </div>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">User Name:</h5>
                    <div class="form-group">
                        <input class="form-control" name="userName" type="text" placeholder="User Name" readonly>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Title:</h5>
                    <div class="form-group">
                        <input class="form-control" name="blogTitle" type="text" placeholder="Title">
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Intro:</h5>
                    <div class="form-group">
                        <textarea class="form-control hTextarea" name="blogIntro" rows="7" cols="7" maxlength="300"
                                  placeholder="Blog Intro"></textarea>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Type:</h5>
                    <div class="row form-group">
                        <div class="col-xs-5 col-sm-5">
                            <select class="form-control blogTypeSelector" name="blogType">
                                <option selected disabled value="">Choose...</option>
                            </select>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <label>
                                <input type="checkbox" onclick="blog_modify_checkbox($(this),'type')">
                                添加
                            </label>
                        </div>
                        <div class="col-xs-5 col-sm-5">
                            <input class="form-control" name="newType" type="text" disabled>
                        </div>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Blog Series:</h5>
                    <div class="row form-group">
                        <div class="col-xs-5 col-sm-5">
                            <select class="form-control seriesIdSelector" name="seriesId">
                                <option selected disabled>Choose...</option>
                            </select>
                        </div>
                        <div class="col-xs-2 col-sm-2">
                            <label>
                                <input type="checkbox" onclick="blog_modify_checkbox($(this),'series')">
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
                        <select class="form-control" name="blogStatus">
                            <option selected disabled value="">Choose...</option>
                            <option value="7">highlight</option>
                            <option value="6">normal</option>
                            <option value="5">friendly</option>
                            <option value="4">private</option>
                            <option value="3">draft</option>
                            <option value="2" disabled>preview</option>
                            <option value="1" disabled>pre-create</option>
                        </select>
                        <p class="help-block text-danger pull-right hInputInfo itemInfoModalWarning"></p>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn btn-d btn-round" data-dismiss="modal" type="button">Close</button>
                <button class="btn btn-b btn-round" onclick="blog_info_modal_save($('.itemInfoForm'))" type="button">
                    Save changes
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Javascript -->
<script src="${APP_PATH}/static/jquery/jquery.min.js"></script>
<script src="${APP_PATH}/static/res/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/res/lib/wow/dist/wow.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="${APP_PATH}/static/res/js/main.js"></script>
<script src="${APP_PATH}/static/toastr/build/toastr.min.js"></script>
<script src="${APP_PATH}/static/res/js/my.js"></script>
<script src="${APP_PATH}/static/res/js/admin.js"></script>
<script src="${APP_PATH}/static/res/js/hlogin.js"></script>
<%--<script src="${APP_PATH}/static/res/js/bloglist.js"></script>--%>
<script type="text/javascript">
    $(function () {
        global_url_map.context_base = '${APP_PATH}';
        global_server_running_time = ${runningSec};
        runningTime(global_server_running_time, $("#showTime"));

        init_admin_page('blog',1,$("#listPostArea"),$('.listSearchForm'),$('.lisSort'),$('.itemInfoModal'), $('a[name="adminSwitchTab"]'));
        // admin_search_map_blog.pn = 1;
        // admin_list_data_from = 'blog';
        // admin_to_page(admin_search_map_blog,pn,$(".listPostArea"));

        get_home_summary($('.homeSideBarArea'));
    });
</script>
</body>
</html>
