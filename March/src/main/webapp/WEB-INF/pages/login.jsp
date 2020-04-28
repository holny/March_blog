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

    <title>March Blog | Welcome</title>

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
                <a class="navbar-brand" href="${APP_PATH}/home">March</a>
            </div>
            <div class="collapse navbar-collapse" id="custom-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${APP_PATH}/home">Home</a>
                    </li>
                    <shiro:user>
                        <li><a href="${APP_PATH}/myblog">My Blog</a>
                        </li>
                    </shiro:user>
                    <shiro:hasPermission name="blog:create">
                        <li><a href="${APP_PATH}/blog/edit/-1">A New Blog</a>
                        </li>
                    </shiro:hasPermission>
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
        <div class="hWhole_bg" style="background: url('${APP_PATH}/static/res/img/bg/home-bg3.jpg') no-repeat fixed;">
            <div class="hOverlay"></div>
        </div>
        <section class="module-small">

            <div class="row">

                <div class="text-center col-sm-offset-5 col-md-offset-7 col-lg-offset-8">
                    <!-- Login Form -->
                    <form class="form hFormWhiteBg hLoginFormSize hShadowAndRound" id="loginForm">
                        <h4 class="font-alt hInputGroup">Log in</h4>
                        <hr class="divider-w mb-10">
                        <div class="form-group hInputGroup">
                            <input class="form-control hNoSpaceNAutoClear " type="text" name="account"
                                   placeholder="Account">
                            <p class="help-block text-danger hInputInfo"></p>
                        </div>
                        <div class="form-group hInputGroup">
                            <input class="form-control hNoSpaceNAutoClear" type="password" name="userPassword"
                                   placeholder="Password">
                            <p class="help-block text-danger hInputInfo"></p>
                        </div>
                        <div class="form-group hInputGroup">
                            <input type="text" name="captchaCode" class="form-control  pull-left hNoSpaceNAutoClear"
                                   placeholder="Code" style="width: 50%;display: inline">
                            <img src="${APP_PATH}/captcha" id="loginCaptchaPic" onclick="getCaptchaPic('${APP_PATH}/captcha',this)"
                                 class="captchaPic pull-right"/>
                            <p class="help-block text-danger hInputInfo"></p>
                        </div>
                        <div class="form-group center-block">
                            <label class="font-alt">
                                <input type="checkbox" name="remember"> Remeber Me
                            </label>
                        </div>
                        <div class="form-group">
                            <%--                            <button class="btn btn-block btn-round btn-d"  type="submit">Submit</button>--%>
                            <button type="button" class="btn btn-block btn-round btn-b hEnterKeyListener"
                                    onclick="user_login('${APP_PATH}','/userlogin',$('#loginForm'))">
                                <i class="fa fa-cog fa-spin" style="display: none"></i>
                                Log in
                            </button>
                        </div>
<%--                        <div class="form-group"><a href="">Forgot Password?</a></div>--%>
                        <div class="">
                            <%--                            <button class="btn btn-block btn-round btn-d"  type="submit">Submit</button>--%>
                            <button type="button" class="btn btn-block btn-round btn-border-d " id="goSignUpBtn">
                                Sign Up
                            </button>
                        </div>

                    </form>

                    <!-- Sign Up Form -->
                    <form class="form hFormWhiteBg hRegFormSize hShadowAndRound" id="regForm" style="display: none">
                        <h4 class="font-alt hInputGroup">Sign Up</h4>
                        <hr class="divider-w mb-10">
                        <div class="form-group hInputGroup">
                            <input class="form-control hNoSpaceNAutoClear"
                                   onchange="regEmailCheck('${APP_PATH}/registercheck',this)" type="text" name="userEmail"
                                   placeholder="Email*">
                            <p class="help-block text-danger hInputInfo" id="regEmailWarning"></p>
                        </div>
                        <div class="form-group hInputGroup">
                            <input class="form-control hNoSpaceNAutoClear" onchange="regUserNameCheck(this)" type="text"
                                   name="userName"
                                   placeholder="Your Name*">
                            <p class="help-block text-danger hInputInfo" id="regUserNameWarning"></p>
                        </div>

                        <div class="form-group hInputGroup">
                            <input class="form-control hNoSpaceNAutoClear"
                                   onchange="regUserPSW1Check(this,$('#regUserPSW2'))" id="regUserPSW1" type="password"
                                   placeholder="Password*">
                            <p class="help-block text-danger hInputInfo" id="regUserPSWWarning1"></p>
                        </div>
                        <div class="form-group hInputGroup">
                            <input class="form-control hNoSpaceNAutoClear"
                                   onchange="regUserPSW2Check(this,$('#regUserPSW1'))" id="regUserPSW2" type="password"
                                   name="userPassword"
                                   placeholder="Re-enter Password*">
                            <p class="help-block text-danger hInputInfo" id="regUserPSWWarning2"></p>
                        </div>
                        <div class="form-group hInputGroup">
                            <input class="form-control hNoSpaceNAutoClear" type="text"
                                   name="invitationCode"
                                   placeholder="Invitation code">
                            <p class="help-block text-danger hInputInfo" id="invitationCodeWarning"></p>
                        </div>
                        <div class="form-group hInputGroup">
                            <input type="text" name="captchaCode" class="form-control  pull-left hNoSpaceNAutoClear"
                                   placeholder="Code" style="width: 50%;display: inline">
                            <img src="${APP_PATH}/captcha" id="regCaptchaPic" onclick="getCaptchaPic('${APP_PATH}/captcha',this)"
                                 class="captchaPic pull-right"/>
                            <p class="help-block text-danger hInputInfo " id="regCaptchaWarning"></p>
                        </div>
                        <div class="form-group">
                            <%--                            <button class="btn btn-block btn-round btn-d"  type="submit">Submit</button>--%>
                            <button type="button" class="btn btn-block btn-round btn-b"
                                    onclick="user_register('${APP_PATH}','/register',$('#regForm'))">
                                <i class="fa fa-cog fa-spin" style="display: none"></i>
                                Sign Up
                            </button>
                        </div>
                        <div class="">
                            <button type="button" class="btn btn-block btn-round btn-border-d " id="goLogInBtn">
                                Back
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </section>

        <footer class="footer bg-dark  navbar-fixed-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <p class="copyright font-alt">&copy; 2020&nbsp;<a href="#">Hly</a>, All Rights
                            Reserved</p>
                    </div>
                    <div class="col-sm-3 text-center">
                        <p class="font-alt" style="margin: 0">您是本站的第${visitorNum}位访客!</p>
                    </div>
                    <div class="col-sm-3 text-center">
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

<script src="${APP_PATH}/static/res/js/main.js"></script>

<script src="${APP_PATH}/static/toastr/build/toastr.min.js"></script>
<script src="${APP_PATH}/static/res/js/my.js"></script>
<script src="${APP_PATH}/static/res/js/hlogin.js"></script>
</body>
<script type="text/javascript">
    $(function () {
        global_url_map.context_base = '${APP_PATH}';
        global_server_running_time = ${runningSec};
        runningTime(global_server_running_time, $("#showTime"));
    });
    let regEmailPass = false, regUserNamePass = false, regPSW1Pass = false, regPSW2Pass = false;
    function item_setting(index) {
        $('#myModal').modal();
    }

    // 点击切换到Sign up界面
    $("#goSignUpBtn").click(function () {

        $("#loginForm").slideUp("slow", function () {
            $("#regForm").slideDown("slow");
        });

    });
    // 点击切换到Log in界面
    $("#goLogInBtn").click(function () {
        $("#regForm").slideUp("slow", function () {
            $("#loginForm").slideDown("slow");
        });
    });


</script>
</html>

