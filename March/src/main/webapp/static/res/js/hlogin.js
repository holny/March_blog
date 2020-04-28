

// // 让用户输入不了空格
// $(".hNoSpaceNAutoClear").keyup(function () {
//     this.value = this.value.replace(/\s+/g, '');
// });
//
// $(".hNoSpaceNAutoClear").focus(function () {
//     let elem = $( this );
//     // elem.val("");
//     elem.nextAll(".text-danger").empty();
// });

// 用户点击验证码图片切换新的验证码图片
// $(".captchaPic").click(function () {
function getCaptchaPic(url,elem){
    // console.log("重新获取验证码图片,url:"+url);
    // console.log("重新获取验证码图片,elem:"+elem);
    elem.src = url+"?tockenId=QWERTYUISDFGHJEW?" + Math.random();
    // this.src = getContextPath()+url+"?tockenId=QWERTYUISDFGHJEW?" + Math.random();
};

<!-- Login -->
// $("#loginBtn").click(function () {
function user_login(context_url,url,form){
    // let loginAccount = $("#loginAccount");
    let accountItem = form.find('[name*=account]');
    let accountWarn = accountItem.next('p');
    let pswItem = form.find('[type*=password]');
    let pswWarn = pswItem.next('p');
    let captchaWarn = form.find('img').next('p');
    console.log("user_login---account="+accountItem.val()+"  psw="+pswItem.val());
    // // 1. 先对登录信息进行前端校验,已经完成。不过为了便于测试，先取消
    // if(!validate_data(accountItem.val(),"email")){
    //     accountWarn.empty().append("账号不符合规范,请检查后再输入").show();
    // }
    // if(!validate_data(pswItem.val(),"password")){
    //     pswWarn.empty().append("密码不符合规范,请检查后再输入").show();;
    //     return;
    // }
    // console.log("loginBtn pass front validate");
    lockFormUI(form);

    $.ajax({
        url: context_url+url,
        type: "POST",
        data: form.serialize(),
        success: function (result) {
            console.log(result);
            if (result.code == 100) {
                // 用户登录成功
                // console.log(result.extend.redirect);
                unLockFormUI(form);
                window.location.href = context_url + result.extend.redirect;
                // alert("没有这个用户！");
            } else if (result.code == 200) {
                // 用户验证失败
                // console.log(result.extend.LoginMsg);
                unLockFormUI($("#loginForm"));
                captchaWarn.empty().append(result.msg).show();
                // $("#loginCaptchaWarning").show();
                // window.location.href = "/index";
                form.find('img').trigger("click");
            } else {
                // 后台处理失败
                // console.log(result);
                unLockFormUI($("#loginForm"));
                captchaWarn.empty().append("错误，请刷新").show();
                form.find('img').trigger("click");
                // $("#loginCaptchaWarning").show();
            }
        }
    });
};




document.onkeydown = keyListener;

function keyListener(e) {
    // 当按下回车键，执行我们的代码
    if (e.keyCode == 13) {
        $('.hEnterKeyListener').click();//换成按钮的id即可
    }
}

// <!-- 以下时 Sign UP界面 -->
// let regEmailPass = false, regUserNamePass = false, regPSW1Pass = false, regPSW2Pass = false,regPhoneNum=false;
// 邮箱账户输入不止要有正则校验，还要看是否已存在账户
// $(".regEmailCheck").change(function () {
function regEmailCheck(url,elem){

    let regEmail = elem.value;

    console.log("regEmail change and check,url="+url+"  ,regEmail="+regEmail);
    // console.log(elem);
    // 1. 先前端正则校验
    if (validate_data(regEmail, "email")) {
        // console.log("regEmail validate pass regEmail="+regEmail);
        // $("#regEmailWarning").empty().hide();
        // 2.发送ajax请求校验用户名是否可用
        $.ajax({
            url: url,
            type: "GET",
            data: "registerEmail=" + regEmail,
            success: function (result) {
                if (result.code == 100) {
                    console.log(result.msg);
                    if( $(elem).next(".text-danger").length>0) {
                        $(elem).next(".text-danger").empty().hide();
                    }
                    // $("#regEmailWarning").empty();
                    // $("#regEmailWarning").hide();
                    regEmailPass = true;
                } else {
                    if( $(elem).next(".text-danger").length>0) {
                        $(elem).next(".text-danger").empty().append(result.msg).show();
                    }
                    // $("#regEmailWarning").empty().append(result.extend.registerEmailCheck);
                    // $("#regEmailWarning").show();
                    regEmailPass = false;
                }
            }
        });

    } else {
        // 前端正则校验没过
        $(elem).next(".text-danger").empty().append("邮箱不规范(必须符合格式,并且最长30位)").show();
        regEmailPass = false;
        // console.log("regEmail validate not pass");
    }

};

function regPhoneNumCheck(url,elem){

    let regPhoneNum = elem.value;

    // 1. 先前端正则校验
    if (validate_data(regPhoneNum, "phoneNum")) {
        // console.log("regEmail validate pass regEmail="+regEmail);
        // $("#regEmailWarning").empty().hide();
        // 2.发送ajax请求校验用户名是否可用
        regPhoneNum = true;
        // $.ajax({
        //     url: url,
        //     type: "GET",
        //     data: "registerEmail=" + regEmail,
        //     success: function (result) {
        //         if (result.code == 100) {
        //             console.log(result.extend.registerEmailCheck);
        //             if( $(elem).next(".text-danger").length>0) {
        //                 $(elem).next(".text-danger").empty().hide();
        //             }
        //             // $("#regEmailWarning").empty();
        //             // $("#regEmailWarning").hide();
        //             regEmailPass = true;
        //         } else {
        //             if( $(elem).next(".text-danger").length>0) {
        //                 $(elem).next(".text-danger").empty().append(result.extend.registerEmailCheck).show();
        //             }
        //             // $("#regEmailWarning").empty().append(result.extend.registerEmailCheck);
        //             // $("#regEmailWarning").show();
        //             regEmailPass = false;
        //         }
        //     }
        // });

    } else {
        // 前端正则校验没过
        $(elem).next(".text-danger").empty().append("手机号码不规范").show();
        regPhoneNum = false;
        // console.log("regEmail validate not pass");
    }

};

// 用户姓名输入校验
// $(".regUserNameCheck").change(function () {
function regUserNameCheck(elem){
    let regUserName = elem.value;
    // console.log("regUserName--regUserName="+regUserName);
    // 1.先进行正则校验
    if (validate_data(regUserName, "name")) {
        // console.log("regUserName正则过了");
        // 正则校验过了才会隐藏提示信息
        // $("#regUserNameWarning").empty().hide();
        regUserNamePass = true;
    } else {
        // console.log("regUserName正则没过");
        if($(elem).next(".text-danger").length>0) {
            $(elem).next(".text-danger").empty().append("用户姓名不符合规范，字母/汉字和.最长10位").show();
        }
        regUserNamePass = false;
    }
};


// 密码1输入校验
// $("#regUserPSW1").change(function () {
function regUserPSW1Check(elem,brother){
    let regUserPSW1 = elem.value;
    let regUserPSW2 = brother.val();
    // console.log("regUserPSW1Check--PSW1="+regUserPSW1+"   PSW2="+regUserPSW2);
    // 1.先进行正则校验
    if (validate_data(regUserPSW1, "password")) {
        // 正则校验过了才会隐藏提示信息
        // $("#regUserPSWWarning1").empty().hide();
        regPSW1Pass = true;
    } else {
        if( $(elem).next(".text-danger").length>0) {
            $(elem).next(".text-danger").empty().append("密码不符合规范，6-18位字母数字").show();
        }
        regPSW1Pass = false;
    }
    // 预防用户让密码2与密码1匹配后再回头修改密码1情况
    // input什么都不输入input!=null，也input!=""。但是如果输入后再删除完就会input==""（估计是因为change了，触发了事件)。输入空格 input.trim()==""
    if(checkIsNullOrEmpty(regUserPSW2)){
        if (regUserPSW1 != regUserPSW2) {
            if( $(brother).next(".text-danger").length>0) {
                brother.next(".text-danger").empty().append("与上一个密码不同").show();
            }
            regPSW2Pass = false;
        }else {
            if( $(brother).next(".text-danger").length>0) {
                brother.next(".text-danger").empty().hide();
            }
            regPSW2Pass = true;
        }
    }
};

// 密码2输入校验
// $("#regUserPSW2").change(function () {
function regUserPSW2Check(elem,brother){
    let regUserPSW2 = elem.value;
    let regUserPSW1 = brother.val();
    // console.log("regUserPSW2Check--PSW1="+regUserPSW1+"   PSW2="+regUserPSW2);
    // 1.首先与密码1进行比对，相同才进行下一步
    if (regUserPSW1 != regUserPSW2) {
        if( $(elem).next(".text-danger").length>0) {
            $(elem).next(".text-danger").empty().append("与上一个密码不同").show();
        }
        regPSW2Pass = false;
    } else {
        // 进行正则校验
        if (validate_data(regUserPSW2, "password")) {
            if( $(elem).next(".text-danger").length>0) {
                // 2. 正则校验过了才会隐藏提示信息
                $(elem).next(".text-danger").empty().hide();
            }
            regPSW2Pass = true;
        } else {
            if( $(elem).next(".text-danger").length>0) {
                $(elem).next(".text-danger").empty().append("密码不符合规范，6-18位字母数字").show();
            }
            regPSW2Pass = false;
        }
    }
};
// 注册按钮点击事件
function user_register(context_url,url,form){
    let captchaPic = form.find('img');
    let captchaWarn = captchaPic.next('p');
    // console.log("user_login---account="+accountItem.val()+"  psw="+pswItem.val());
    console.log("signUpBtn.click");
    // 1.先看表单输入信息是否都通过了前端校验
    if (regEmailPass == true && regUserNamePass == true && regPSW1Pass == true && regPSW2Pass == true) {
        // 全部通过了前端校验才表单发往后端
        $.ajax({
            url: context_url+url,
            type: "POST",
            data: form.serialize(),
            success: function (result) {
                console.log(result);
                if (result.code == 100) {
                    console.log(result.msg);
                    console.log(result.extend.redirect);
                    captchaWarn.empty().hide();
                    window.location.href = context_url + result.extend.redirect;
                } else {
                    captchaWarn.empty().append(result.msg).show();
                    captchaPic.trigger("click");
                }
            }
        });
    }else{
        // 表单前端校验没通过
        captchaWarn.empty().append("注册输入信息未通过校验，请再检查一遍").show();
    }
};