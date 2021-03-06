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

    <link href="${APP_PATH}/static/res/fileinput/css/fileinput.min.css" rel="stylesheet">
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
                    <div class="col-sm-8">
                        <div class="post">
                            <div class="row font-alt hWitheBg hShadowAndRound">
                                <h4 class="font-alt  text-center">当前信息:</h4>
                                <p class="text-center">
                                    当前IP:<small id="nowIp"></small>&nbsp;|&nbsp;上一次登录时间:<small
                                        id="lastLoginTime"></small>
                                </p>

                            </div>
                            <hr class="divider-w mb-10">
                            <div class="row hWitheBg hShadowAndRound">

                                <h4 class="font-alt text-center">个人信息设置:</h4>
                                <br/>
                                <form class="form infoForm">
                                    <div class="col-sm-5 col-sm-offset-1 mb-sm-40 ">
                                        <h5 class="font-alt mb-0">User ID:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control userId" name="userId" type="text"
                                                   placeholder="Blog Id" readonly>
                                        </div>
                                        <h5 class="font-alt mb-0">User name*:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control hNoSpaceNAutoClear" name="userName" onchange="regUserNameCheck(this)" type="text"
                                                   placeholder="User name">
                                            <p class="help-block text-danger hInputInfo"></p>
                                        </div>
                                        <h5 class="font-alt mb-0">Nickname:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control hNoSpaceNAutoClear" name="userNickname" type="text"
                                                   placeholder="Nickname">
                                        </div>
                                        <h5 class="font-alt mb-0">Email*:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control hNoSpaceNAutoClear" onchange="regEmailCheck('${APP_PATH}/registercheck',this)" type="text" name="userEmail"
                                                   placeholder="Email">
                                            <p class="help-block text-danger hInputInfo"></p>
                                        </div>
                                        <h5 class="font-alt mb-0">Phone number*:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control hNoSpaceNAutoClear" type="text" name="userTelephoneNumber"  onchange="regPhoneNumCheck('${APP_PATH}/registercheck',this)"
                                                   placeholder="Phone number">
                                            <p class="help-block text-danger hInputInfo"></p>
                                        </div>
                                        <h5 class="font-alt mb-0">Sex*:</h5>
                                        <div class="form-group hInputGroup">
                                            <select class="form-control"  name="userSex">
                                                <option selected disabled value="">Choose...</option>
                                                <option value="m">男</option>
                                                <option value="f">女</option>
                                                <option value="n">未知</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-5">

                                        <h5 class="font-alt mb-0">Motto:</h5>
                                        <div class="form-group hInputGroup">
                                                <textarea class="form-control hTextarea" name="userMotto" rows="2"
                                                          cols="7" maxlength="100"
                                                          placeholder="Motto"></textarea>
                                        </div>
                                        <h5 class="font-alt mb-0">Birthday:</h5>
                                        <div class="form-group hInputGroup">
                                            <div class='input-group date monthMinTimePicker'>
                                                <input type='text' name="userBirthday" class="form-control"
                                                       readonly/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                            </div>
                                        </div>
                                        <h5 class="font-alt mb-0">Register time:</h5>
                                        <div class="form-group hInputGroup">
                                            <p name="userRegisterTime">2000年12月11日</p>
                                        </div>
                                        <h5 class="font-alt mb-0">Credit:</h5>
                                        <div class="form-group hInputGroup">
                                            <p name="userCreidt">123456</p>
                                        </div>
                                        <h5 class="font-alt mb-0">Rights:</h5>
                                        <div class="form-group hInputGroup">
                                            <p name="userRights">AAA</p>
                                        </div>
                                        <h5 class="font-alt mb-0">Account status:</h5>
                                        <div class="form-group hInputGroup">
                                            <p name="accountStatus">normal</p>
                                        </div>

                                    </div>
                                    <div class="form-group text-center">
                                        <button type="button" class="btn btn-round btn-b"
                                                onclick="update_myInfo($('.infoForm'),'${APP_PATH}/user')">
                                            <i class="fa fa-cog fa-spin" style="display: none"></i>
                                            确认修改
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <hr class="divider-w mb-10">
                            <div class="row hWitheBg hShadowAndRound">
                                <h4 class="font-alt text-center">密码修改:</h4>
                                <br/>
                                <form class="form pswForm">
                                    <div class="col-sm-5 col-sm-offset-1 mb-sm-40">
                                        <h5 class="font-alt mb-0">User ID:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control userId" name="userId" type="text"
                                                   placeholder="Blog Id" readonly>
                                        </div>
                                        <h5 class="font-alt mb-0">Old Password*:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control hNoSpaceNAutoClear" name="userPassword" type="password"
                                                   placeholder="Old Password*">
                                            <p class="help-block text-danger hInputInfo"></p>
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <h5 class="font-alt mb-0">New Password*:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control hNoSpaceNAutoClear" id="myInfoPSW1"  onchange="regUserPSW1Check(this,$('#myInfoPSW2'))" type="password" name="newPassword1"
                                                   placeholder="New Password*">
                                            <p class="help-block text-danger hInputInfo"></p>
                                        </div>
                                        <h5 class="font-alt mb-0">Re-enter new Password*:</h5>
                                        <div class="form-group hInputGroup">
                                            <input class="form-control hNoSpaceNAutoClear" id="myInfoPSW2"  onchange="regUserPSW2Check(this,$('#myInfoPSW1'))" type="password" name="newPassword"
                                                   placeholder="Re-enter new Password*">
                                            <p class="help-block text-danger hInputInfo"></p>
                                        </div>
                                    </div>
                                    <div class="form-group text-center">
                                        <button type="button" class="btn btn-round btn-b"
                                                onclick="update_myInfo($('.pswForm'),'${APP_PATH}/user')">
                                            <i class="fa fa-cog fa-spin" style="display: none"></i>
                                            确认修改
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <hr class="divider-w mb-10">
                            <div class="row hWitheBg hShadowAndRound">
                                <h4 class="font-alt text-center">个人链接:</h4>
                                <br/>
                                <form class="form linkForm">
                                    <div class="form-group" style="display: none">
                                        <input class="form-control userId" name="userId" type="text"
                                               placeholder="Blog Id" readonly>
                                    </div>
                                    <div class="col-sm-5 col-sm-offset-1 mb-sm-40">
                                        <h5 class="font-alt mb-0">Github链接:</h5>
                                        <div class="form-group">
                                            <input class="form-control hNoSpaceNAutoClear" name="githubLink" type="text"
                                                   placeholder="Github link">
                                        </div>
                                        <h5 class="font-alt mb-0">微博链接:</h5>
                                        <div class="form-group">
                                            <input class="form-control hNoSpaceNAutoClear" name="weiboLink" type="text"
                                                   placeholder="WeiBo link">
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <h5 class="font-alt mb-0">微信链接:</h5>
                                        <div class="form-group">
                                            <input class="form-control hNoSpaceNAutoClear" type="text" name="wechatLink"
                                                   placeholder="WeChat link">
                                        </div>
                                        <h5 class="font-alt mb-0">其他链接:</h5>
                                        <div class="form-group">
                                            <input class="form-control hNoSpaceNAutoClear" type="text" name="otherLink"
                                                   placeholder="Other link">
                                        </div>
                                    </div>
                                    <div class="form-group text-center">
                                        <button type="button" class="btn btn-round btn-b"
                                                onclick="update_myInfo($('.linkForm'),'${APP_PATH}/user')">
                                            <i class="fa fa-cog fa-spin" style="display: none"></i>
                                            确认修改
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <hr class="divider-w mb-10">
                            <div class="row  hWitheBg hShadowAndRound">
                                <h4 class="font-alt text-center">图片设置:</h4>
                                <br/>
                                <h5 class="font-alt mb-0">Profile Image:</h5>
                                <div class="form-group">
                                    <input name="upload" id="profilePicInput" type="file" multiple>
                                    <%--                                                    name="image_data[]"  一次性上传多图片--%>
                                    <%--                                                    多图上传  要将ajax设置成  同步--%>
                                    <%--                                                </form>--%>
                                </div>
                                <h5 class="font-alt mb-0">Blog background:</h5>
                                <div class="form-group">
                                    <%--                                                <form enctype="multipart/form-data">--%>
                                    <input name="upload" id="blogBgInput" type="file" multiple>
                                    <%--                                                    name="image_data[]"  一次性上传多图片--%>
                                    <%--                                                    多图上传  要将ajax设置成  同步--%>
                                    <%--                                                </form>--%>
                                </div>
                            </div>
                        </div>
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
<%--                                    <p style="font-weight: 900">1000</p>--%>
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
                                    <li class="active"><a href="#support" data-toggle="tab"><span
                                            class="icon-tools-2"></span>New</a></li>
                                    <li><a href="#sales" data-toggle="tab"><span class="icon-tools-2"></span>HOT</a>
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
<!-- Javascript -->
<script src="${APP_PATH}/static/jquery/jquery.min.js"></script>
<script src="${APP_PATH}/static/res/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/res/lib/wow/dist/wow.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="${APP_PATH}/static/res/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script src="${APP_PATH}/static/res/js/main.js"></script>

<script src="${APP_PATH}/static/res/fileinput/js/plugins/purify.min.js"></script>
<script src="${APP_PATH}/static/res/fileinput/js/fileinput.js"></script>
<script src="${APP_PATH}/static/res/fileinput/js/locales/zh.js"></script>

<script src="${APP_PATH}/static/toastr/build/toastr.min.js"></script>
<script src="${APP_PATH}/static/res/js/my.js"></script>
<script src="${APP_PATH}/static/res/js/hlogin.js"></script>
</body>
<script type="text/javascript">

    let regEmailPass = true, regUserNamePass = true, regPSW1Pass = false, regPSW2Pass = false,regPhoneNum=true;
    $(function () {
        global_url_map.context_base = '${APP_PATH}';
        global_server_running_time = ${runningSec};
        runningTime(global_server_running_time,$("#showTime"));

        $.ajax({
            url: "${APP_PATH}/myinfo",
            type: "GET",
            success: function (result) {
                // 这里result如果能一个字符串连用控制台显示，那控制台就显示Object，所以单独。
                myInfo = result.extend.user;
                console.log(myInfo);
                infoInitFill($('.infoForm'),$('.pswForm'),$('.linkForm'), myInfo, '${APP_PATH}');
                get_user_statics(myInfo.userId, $('.userInfoSidebarArea'), '${APP_PATH}', "/profile", "/blog", "/series");
            },
            error: function () {
                console.log("获取个人信息失败")
            }
        });
    });


    function infoInitFill(infoForm,pswForm,linkForm, myInfo, basePath) {
        console.log("infoInitFill");
        $(".userId").val(myInfo.userId);
        // infoForm.find('input[name*=userId]').val(myInfo.userId);
        infoForm.find('input[name*=userName]').val(myInfo.userName);
        infoForm.find('input[name*=userNickname]').val(myInfo.userNickname);
        infoForm.find('input[name*=userEmail]').val(myInfo.userEmail);
        infoForm.find('input[name*=userTelephoneNumber]').val(myInfo.userTelephoneNumber);
        infoForm.find('select[name*=userSex]').val(myInfo.userSex);
        infoForm.find('input[textarea*=userMotto]').val(myInfo.userMotto);
        infoForm.find('input[name*=userBirthday]').val(myInfo.userBirthday);
        infoForm.find('p[name*=userRegisterTime]').empty().append(myInfo.userRegisterTime);
        infoForm.find('p[name*=userCreidt]').empty().append(myInfo.userCredit);
        infoForm.find('p[name*=userRights]').empty().append(transform_code('userRights',myInfo.userRights));
        infoForm.find('p[name*=accountStatus]').empty().append(transform_code('accountStatus',myInfo.accountStatus));

        pswForm.find('input[name*=userId]').val(myInfo.userId);
        // "?tockenId=QWERTYUISDFGHJEW?" + Math.random()
        // $(".userProfilePic").attr("src", basePath + "/file/showPic/" + myInfo.userProfilePic);
        $("#nowIp").empty().append(myInfo.userIp);
        $("#lastLoginTime").empty().append(myInfo.userLastLoginTime);

        linkForm.find('input[name*=githubLink]').val(myInfo.githubLink);
        linkForm.find('input[name*=weiboLink]').val(myInfo.weiboLink);
        linkForm.find('input[name*=wechatLink]').val(myInfo.wechatLink);
        linkForm.find('input[name*=otherLink]').val(myInfo.otherLink);


    }

    // let regPSW1Pass =false,regPSW2Pass =false;

    function update_myInfo(form,src){
        console.log(form.find('input[name*=userName]').length)
        if(form.find('input[name*=userName]').length>0){
            if(!regUserNamePass){
                    toastr.warning("User name不符合规范!");
                    return;
            }
        }
        console.log(form.find('input[name*=userEmail]').length)
        if(form.find('input[name*=userEmail]').length>0){
            if(!regEmailPass){
                toastr.warning("Email地址不符合规范!");
                return;
            }
        }
        console.log(form.find('input[name*=userTelephoneNumber]').length)
        if(form.find('input[name*=userTelephoneNumber]').length>0){
            if(!regPhoneNum){
                toastr.warning("手机号码不符合规范!");
                return;
            }
        }
        console.log(form.find('input[name*=newPassword]').length)
        if(form.find('input[name*=newPassword]').length>0){
            console.log(regPSW1Pass);
            console.log(regPSW2Pass);
            if(!(regPSW1Pass&&regPSW2Pass)){
                toastr.warning("新密码不符合规范!");
                return;
            }
            if(form.find('input[name*=userPassword]').val()==""){
                toastr.warning("旧密码不能为空!");
                return;
            }
        }
        let data = form.serialize();
        // console.log(data);
        lockFormUI(form);
        $.ajax({
            url: src,
            type: "PUT",
            data: data,
            success: function (result) {
                console.log(result);
                unLockFormUI(form);
                if (result.code == 100) {

                    toastr.success("更新成功!"+result.msg);

                } else {
                    toastr.error("更新失败!"+result.msg);
                }
            },
            error:function () {
                unLockFormUI(form);
                toastr.error("更新出错!");
            }
        });
    }


    // $("#imgInput").fileinput();
    $("#profilePicInput").fileinput({
        uploadUrl: "${APP_PATH}/file/upload/img",  //还写具体上传地址才显示可拖拽区域
        language: 'zh', //设置语言
        allowedFileExtensions: ['jpg', 'gif', 'png','jpeg'],//接收的文件后缀
        uploadAsync: true, //默认异步上传
        browseClass: "btn btn-border-d btn-round", //按钮样式
        maxFileCount: 1, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        maxFileSize: 5120,//单位为kb，如果为0表示不限制文件大小
        minImageWidth: 50, //图片的最小宽度
        minImageHeight: 50,//图片的最小高度
        maxImageWidth: 400,//图片的最大宽度
        maxImageHeight: 400,//图片的最大高度
        resizeImage: true,
        resizePreference: 'width',
        showUpload: true, //是否显示上传按钮
        showRemove: true, //显示移除按钮
        showPreview: false, //是否显示预览
        previewFileType: ['jpg', 'gif', 'png', 'jpeg'],
        showCaption: true,//是否显示长条标题
        dropZoneEnabled: false,//是否显示拖拽区域
        // autoReplace: true,
        // msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        msgAjaxError: 'Something went wrong with the {operation} operation. Please try again later!', //错误提示
        uploadExtraData: {"destination": "profilepic"},//上传携带参数
        // // slugCallback:function(){}, //上传前的回调
        // overwriteInitial: true, //false时，本身已存在的预览图，后面在上传就继续追加而不是覆盖原来的
        // previewSettingsSmall:{image: {width: "100%", height: "100%", 'max-width': "auto",'max-height': "auto"}},  //修改之前上传的预览图
        // previewSettings: {image: {width: "100px", height: "100px"}},  //修改刚刚上传的预览图

        <%--initialPreview: ['<img id="defaultProfilePic" src="${APP_PATH}/static/res/img/default.jpeg">'], //初始化显示出预览图--%>
        // initialPreviewAsData: true, //为true时，initialPreview数组里面的html标签就不会解析，直接显示数据了
        <%--initialPreviewConfig: [ //初始化预览图时，为预览图设置属性--%>
        <%--    {--%>
        <%--        caption: '头像',// 预览图展示的图片名称--%>
        <%--        width: '20px',// 图片高度--%>
        <%--        url: "${APP_PATH}/file/deletePic",//删除预览图片的回调，返回的必须是json否则删除预览图的效果就没有--%>
        <%--        key: '1a',// 删除按钮会添加data-key="1a"，同时也会提交给后台key:'1a'值--%>
        <%--        extra: {"destination": "profilepic"} //调用删除路径所传参数--%>
        <%--    },--%>
        <%--    // {--%>
        <%--    //     caption: '名称2',--%>
        <%--    //     width: '120px',--%>
        <%--    //     url: 'http://localhost/1.php',--%>
        <%--    //     key: '2a',--%>
        <%--    //     extra: {id: 22}--%>
        <%--    // }--%>
        <%--]--%>
    }).on("filebatchselected", function (event, files) {  //选中要上传的文件后回调
        // $(this).fileinput("upload");  //自动上传

    }).on("fileuploaded", function (event, data) {
        if (data.response) {
            console.log("处理成功!");
            console.log(data.response);
            if (data.response.code == 100) {
                // 顺便头像
                init_user_avatar("${APP_PATH}/file/showPic/" + data.response.extend.path);
                $('.loginProfilePic').attr("src", "${APP_PATH}/file/showPic/" + data.response.extend.path);
                toastr.success("头像图片上传成功!" + data.response.msg);
            } else {
                toastr.error("头像图片上传失败!" + data.response.msg);
            }
        }
    });
    //     .on('filedeleted', function (event, data) {
    //     if (data.response) {
    //         console.log("删除成功!");
    //         console.log(data.response);
    //     }
    // }).on('filebatchuploadcomplete', function (event, files, extra) {
    //     // if(id_str.length == 0){
    //     //     layer.msg('上传失败', {icon: 0});//弹框提示
    //     //     return false;
    //     // }
    //     // setTimeout(function(){ //执行延时关闭
    //     //     closeSelf();
    //     // },1000);
    // });

    $("#blogBgInput").fileinput({
        uploadUrl: "${APP_PATH}/file/upload/img",  //还写具体上传地址才显示可拖拽区域
        language: 'zh', //设置语言
        allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
        uploadAsync: true, //默认异步上传
        browseClass: "btn btn-border-d btn-round", //按钮样式
        maxFileCount: 1, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        minImageWidth: 500, //图片的最小宽度
        minImageHeight: 500,//图片的最小高度
        maxImageWidth: 2500,//图片的最大宽度
        maxImageHeight: 4000,//图片的最大高度
        resizeImage: true,
        resizePreference: 'width',
        showUpload: true, //是否显示上传按钮
        showRemove: true, //显示移除按钮
        showPreview: false, //是否显示预览
        previewFileType: ['jpg', 'gif', 'png', 'jpeg'],
        showCaption: true,//是否显示长条标题
        dropZoneEnabled: false,//是否显示拖拽区域
        // autoReplace: true,
        // msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        msgAjaxError: 'Something went wrong with the {operation} operation. Please try again later!', //错误提示
        uploadExtraData: {"destination": "blogbg"},//上传携带参数
    }).on("filebatchselected", function (event, files) {  //选中要上传的文件后回调
        // $(this).fileinput("upload");  //自动上传

    }).on("fileuploaded", function (event, data) {
        if (data.response) {
            console.log("处理成功!");
            console.log(data.response);
            if (data.response.code == 100) {
                toastr.success("背景图片上传成功!" + data.response.msg);
                init_background_image("${APP_PATH}/file/showBg/" + data.response.extend.path)
            } else {
                toastr.error("背景图片上传失败!" + data.response.msg);
            }
        }
    });
    //     .on('filedeleted', function (event, data) {
    //     if (data.response) {
    //         toastr.success("删除成功!"+data.response);
    //         console.log("删除成功!");
    //         console.log(data.response);
    //     }
    // }).on('filebatchuploadcomplete', function (event, files, extra) {
    //     // if(id_str.length == 0){
    //     //     layer.msg('上传失败', {icon: 0});//弹框提示
    //     //     return false;
    //     // }
    //     // setTimeout(function(){ //执行延时关闭
    //     //     closeSelf();
    //     // },1000);
    // });

    //filesuccessremove  删除刚刚上传成功图片的回调
    //filebatchuploadcomplete 文件全部都上传完成才回调
    //fileuploaderror  上传文件错误后回调
    //filebatchpreupload  上传前回调

    $('.dayMonthTimePicker').datetimepicker({
        language: 'zh-CN',
        format: "yyyy年mm月dd日 ",
        weekStart: 1,
        todayBtn: "linked",
        autoclose: true,
        todayHighlight: true,
        startView: 3,
        forceParse: true,
        minView: "month",
        startDate: new Date(1970, 0, 0),
        endDate: new Date(),
    });
</script>
</html>