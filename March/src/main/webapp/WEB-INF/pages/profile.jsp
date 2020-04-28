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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="holny">
    <title>March Blog | Profile</title>

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

    <div class="main">
        <section class="module-small">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <!--Search Area-->
                        <form class="form searchForm hWitheBg" style="display: none">
                            <div class="form-row mb-sm-10 mt-sm-40">
                                <div class="col-md-4 col-sm-4">
                                    <div class="form-group hInputGroup">
                                        <input class="form-control input-sm" name="blogTitle" type="text"
                                               placeholder="Blog title">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="form-group hInputGroup">
                                        <input class="form-control input-sm" name="blogId" type="text"
                                               placeholder="Blog Id">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">

                                    <div class="form-group hInputGroup">
                                        <select class="form-control seriesIdSelector" name="seriesId">
                                            <option selected disabled>Blog series</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="form-row">
                                <div class="col-md-4 col-sm-4">
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
                                <div class="col-md-4 col-sm-4">
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
                                <div class="col-md-4 col-sm-4">

                                    <div class="form-group hInputGroup">
                                        <select class="form-control blogTypeSelector" name="blogType">
                                            <option selected disabled value="">Blog type</option>
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
                        <a class="font-alt mb-20 pull-right searchBtn"
                           onclick='search_bar_hide_or_show($(this),$(".searchForm"))'><i
                                class="fas fa-filter"></i> 筛选一下?</a>
                        <hr class="divider-w mt-10 mb-0">
                        <div class="row">
                            <div class="col-sm-3 dropdown">
                                <a class="dropdown-toggle font-alt blogListSort" data-toggle="dropdown">
                                    <i class="fas fa-sort fa-lg"></i>排序
                                </a>
                                <ul class="dropdown-menu sortMenu" role="menu">
                                    <li value="updateTimeASC"><a><i class="fal fa-sort-amount-up-alt"></i> 更新时间-升序</a></li>
                                    <li value="updateTimeDESC"><a><i class="fal fa-sort-amount-down"></i> 更新时间-降序</a></li>
                                    <li value="viewASC"><a><i class="fal fa-sort-amount-up-alt"></i> 浏览量-升序</a></li>
                                    <li value="viewDESC"><a><i class="fal fa-sort-amount-down"></i> 浏览量-降序</a></li>
                                    <li value="commentASC"><a><i class="fal fa-sort-amount-up-alt"></i> 评论数-升序</a></li>
                                    <li value="commentDESC"><a><i class="fal fa-sort-amount-down"></i> 评论数-降序</a></li>
                                    <li value="likeASC"><a><i class="fal fa-sort-amount-up-alt"></i> 点赞数-升序</a></li>
                                    <li value="likeDESC"><a><i class="fal fa-sort-amount-down"></i> 点赞数-降序</a></li>
                                    <li value><a><i class="far fa-circle-notch"></i> 默认排序</a></li>
                                </ul>
                            </div>
                            <div class="col-sm-5" style="width: min-content">
                                <small class="mb-0 pull-right searchAndSortInfo"></small>
                            </div>
                            <div class="col-sm-4 pull-right seriesBtnGroup" style="width: min-content">
                                <button class="btn btn-d btn-circle btn-block btn-xs settingBtn" type="button">
                                    <i class="fa fa-cog fa-spin"></i> 设置</button>
                                <button type="button" class="btn btn-g btn-circle btn-block btn-xs deleteBtn">
                                    <i class="fas fa-trash"></i>
                                    删除
                                </button>
                            </div>
                        </div>
                        <div class="row post-masonry post-columns" id="listPostArea">
                            <!-- 列表区 -->
                        </div>
                        <div class="pagination font-alt">
                            <a href="#"><i class="fa fa-angle-left"></i></a>
                            <a class="active" href="#">1</a>
                            <a href="#">2</a>
                            <a href="#"><i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-md-offset-1 sidebar userInfoSidebarArea">
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


<!--Modal-->
<div class="modal fade seriesInfoModal" tabindex="-1" role="dialog">
    <div class="modal-dialog hShadowAndRound" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h5 class="font-alt mb-0 modal-title">Series Setting</h5>
            </div>
            <div class="modal-body">
                <form class="form seriesInfoForm">
                    <h5 class="font-alt mb-0">Series Id:</h5>
                    <div class="form-group" style="">
                        <input class="form-control" name="seriesId" type="text" placeholder="Series Id" readonly>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Series Name:</h5>
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
                    <h5 class="font-alt mb-0">Series ShortName:</h5>
                    <div class="form-group" style="display: none">
                        <input class="form-control" name="seriesShortName" type="text" placeholder="Series shortName">
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Create Time:</h5>
                    <div class="form-group">
                        <p class="form-control" name="blogId" type="text" placeholder="Blog Id" readonly>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Update Time:</h5>
                    <div class="form-group">
                        <p class="form-control" name="seriesUpdateTime" type="text" placeholder="Blog Id" readonly>
                    </div>
                    <hr class="divider-w mt-10 mb-20">
                    <h5 class="font-alt mb-0">Series Intro:</h5>
                    <div class="form-group">
                        <textarea class="form-control hTextarea" name="seriesIntro" rows="7" cols="7" maxlength="300"
                                  placeholder="Blog Intro"></textarea>
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
                <button class="btn btn-border-d btn-round cancelBtn" data-dismiss="modal" type="button">Close</button>
                <button class="btn btn-b btn-round confirmBtn" type="button">
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
<script src="${APP_PATH}/static/res/js/bloglist.js"></script>
<script type="text/javascript">
    $(function () {
        global_url_map.context_base = '${APP_PATH}';
        listSearchMap.userId = ${userId};
        if('${type}'=='blog') {
            $('.tabTitle').empty().append('${userName}'+"的Blog");
            $('.searchForm').find('input[name*=userName]').val('${userName}');
            init_blog_list($('#listPostArea'), 'home', null, false);
            init_type_list(${userId}, $('.blogTypeSelector'), 'home');
            init_series_list(${userId}, $('.seriesIdSelector'), 'home');
            $('.seriesBtnGroup').remove();
        }else if('${type}'=='series') {
            $('.tabTitle').empty().append('${userName}'+"的Series:   "+'${seriesName}');
            $('.searchForm').find('select[name*=seriesId]').attr('readonly','readonly');
            $('.searchForm').remove();
            $('.searchBtn').remove();
            listSearchMap.seriesId = ${seriesId};
            init_blog_list($('#listPostArea'), 'home', null, false);
            if('${userId}'=='<shiro:principal property="userId"/>'||'<shiro:principal property="userRights"/>'=='1'||'<shiro:principal property="userRights"/>'=='2'){
                init_myself_series_btnGrp($('.seriesBtnGroup'),${seriesId},$('.seriesInfoModal'));
            }else{
                $('.seriesBtnGroup').remove();
            }
        }
        get_user_statics(${userId}, $('.userInfoSidebarArea'));
        global_server_running_time = ${runningSec};
        runningTime(global_server_running_time,$("#showTime"));
    });

    function init_myself_series_btnGrp(elem,seriesId,modal) {
        elem.find('.settingBtn').click(function () {
            let form = modal.find('.seriesInfoForm');
            form.children().remove();
            let form_seriesId_head = $('<h5></h5>').addClass('font-alt mb-0').text('Series ID:');
            let form_seriesId = $('<div></div>').addClass('form-group').append($('<input/>').addClass('form-control').attr('name','seriesId').attr('type','text').attr('placeholder','Series Id').attr('readonly',''));

            let form_SeriesName_hr = $('<hr>').addClass('divider-w mt-10 mb-20');
            let form_SeriesName_head = $('<h5></h5>').addClass('font-alt mb-0').text('New Series name:');
            let form_SeriesName = $('<div></div>').addClass('row form-group');
            let seriesName_select =$('<div></div>').addClass('col-xs-5 col-sm-5').append($('<select></select>').addClass('form-control seriesIdSelector').attr('name','newSeriesId')
                .append($('<option></option>').attr('selected','').attr('disabled','').attr('value','').text('Choose...')));

            let seriesName_checkbox = $('<div></div>').addClass('col-xs-2 col-sm-2').append($('<label></label>').append($('<input>').attr('type','checkbox').addClass('seriesSwCheckbox')).append(' 添加'));
            let seriesName_input = $('<div></div>').addClass('col-xs-5 col-sm-5').append($('<input>').addClass('form-control').attr('name','newSeriesName').attr('placeholder','Alter series name').attr('type','text').attr('disabled',''));
            form_SeriesName.append(seriesName_select).append(seriesName_checkbox).append(seriesName_input);

            let form_shortName_hr = $('<hr>').addClass('divider-w mt-10 mb-20');
            let form_shortName_head = $('<h5></h5>').addClass('font-alt mb-0').text('Series shortName:');
            let form_shortName = $('<div></div>').addClass('form-group').append($('<input/>').addClass('form-control').attr('name','seriesShortName').attr('type','text').attr('placeholder','Series shortNam'));

            let form_createTime_hr = $('<hr>').addClass('divider-w mt-10 mb-20');
            let form_createTime_head = $('<h5></h5>').addClass('font-alt mb-0').text('Create time:');
            let form_createTime = $('<div></div>').addClass('form-group').append($('<p></p>').addClass('form-control').attr('name','seriesCreateTime').attr('type','text').attr('placeholder','Create time').attr('readonly',''));

            let form_updateTime_hr = $('<hr>').addClass('divider-w mt-10 mb-20');
            let form_updateTime_head = $('<h5></h5>').addClass('font-alt mb-0').text('Update time:');
            let form_updateTime = $('<div></div>').addClass('form-group').append($('<p></p>').addClass('form-control').attr('name','seriesUpdateTime').attr('type','text').attr('placeholder','Update time').attr('readonly',''));

            let form_seriesIntro_hr = $('<hr>').addClass('divider-w mt-10 mb-20');
            let form_seriesIntro_head = $('<h5></h5>').addClass('font-alt mb-0').text('Series Intro:');
            let form_seriesIntro = $('<div></div>').addClass('form-group').append($('<textarea></textarea>').addClass('form-control hTextarea').attr('name','seriesIntro').attr('rows','7').attr('cols','7').attr('maxlength','300').attr('placeholder','Series Intro'));

            let form_seriesStatus_hr = $('<hr>').addClass('divider-w mt-10 mb-20');
            let form_seriesStatus_head = $('<h5></h5>').addClass('font-alt mb-0').text('Series Status:');
            let form_seriesStatus = $('<div></div>').addClass('form-group');
            let status_select = $('<select></select>').addClass('form-control').attr('name','seriesStatus')
                .append($('<option></option>').attr('selected','').attr('disabled','').attr('value','').text('Choose...'))
                .append($('<option></option>').attr('value','7').text('highlight'))
                .append($('<option></option>').attr('value','6').text('normal'))
                .append($('<option></option>').attr('value','5').text('friendly'))
                .append($('<option></option>').attr('value','4').text('private'))
                .append($('<option></option>').attr('value','3').text('draft'))
                .append($('<option></option>').attr('value','2').text('preview').attr('disabled',''))
                .append($('<option></option>').attr('value','1').text('pre-create').attr('disabled',''));
            form_seriesStatus.append(status_select).append($('<p></p>').addClass('help-block text-danger pull-right hInputInfo itemInfoModalWarning'));

            form.append(form_seriesId_head).append(form_seriesId).append(form_SeriesName_hr).append(form_SeriesName_head).append(form_SeriesName)
                .append(form_shortName_hr).append(form_shortName_head).append(form_shortName).append(form_createTime_hr).append(form_createTime_head).append(form_createTime)
                .append(form_updateTime_hr).append(form_updateTime_head).append(form_updateTime).append(form_seriesIntro_hr).append(form_seriesIntro_head).append(form_seriesIntro)
                .append(form_seriesStatus_hr).append(form_seriesStatus_head).append(form_seriesStatus);

            init_series_list(${userId}, $('.seriesIdSelector'), 'series',${blogSeries.seriesId});

            $('.seriesSwCheckbox').click(function () {
                blog_modify_checkbox($(this),'newSeries');
            });

            modal.find('input[name*=seriesId]').val(${blogSeries.seriesId});
            modal.find('select[name*=newSeriesId]').val(${blogSeries.seriesId});
            modal.find('input[name*=seriesShortName]').val('${blogSeries.seriesShortName}');
            modal.find('p[name*=seriesCreateTime]').text('<fmt:formatDate type="both" value="${blogSeries.seriesCreateTime}" />');
            modal.find('p[name*=seriesUpdateTime]').text('<fmt:formatDate type="both" value="${blogSeries.seriesUpdateTime}" />');
            modal.find('textarea[name*=seriesIntro]').val('${blogSeries.seriesIntro}');
            modal.find('select[name*=seriesStatus]').val(${blogSeries.seriesStatus});
            modal.modal('show');
            modal.find('button.confirmBtn').click(function () {
                update_series(form);
            });
        });
        elem.find('.deleteBtn').click(function () {
            let form = modal.find('.seriesInfoForm');
            form.children().remove();
            form.append($('<h5></h5>').addClass('font-alt mb-0').text('确认删除此Series吗？(Id:${blogSeries.seriesId}, Series name:${blogSeries.seriesName})'));
            modal.modal('show');
            modal.find('button.confirmBtn').click(function () {
                delete_series(${blogSeries.seriesId});
            });

        });

    }

    function update_series(form) {
        $.ajax({
            url: global_url_map.context_base+global_url_map.series_url,
            type: "PUT",
            data: form.serialize(),
            success: function (result) {
                console.log(result);
                if (result.code == 100) {
                    toastr.success(result.msg);
                    window.location.href = global_url_map.context_base + global_url_map.series_url+'/'+result.extend.newSeriesId;
                } else {
                    toastr.error(result.msg);
                }
            },
            error:function () {
                toastr.error('更新失败');
            }
        });
    }

    function delete_series(seriesId) {
        $.ajax({
            url: global_url_map.context_base+global_url_map.series_url+'/'+seriesId,
            type: "DELETE",
            success: function (result) {
                console.log(result);
                if (result.code == 100) {
                    toastr.success(result.msg);
                    window.location.href = global_url_map.context_base + global_url_map.home_url;
                } else {
                    toastr.error(result.msg);
                }
            },
            error:function () {
                toastr.error('删除失败');
            }
        });
    }

</script>
</body>
</html>
