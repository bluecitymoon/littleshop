
document.write('<script type="text/javascript" src="http://s.138mr.com/Js/common/jquery.LQ.Pop.js"><\/script>');

function showMicroRegister() {
    hideBar();
    var skin = ".LQ_form_container{border-width:10px;}";
    LQ.Pop.show({ id: "LQ_PopDialog", width: 570, height: 500, caption: "0", content: "url:/person/MicroRegister.aspx", skin: skin });
}

function loadPopDialog() {
    $("#LQ_PopDialog").css("height", "250px");
}

$(document).ready(function () {
    $.ajax({
        url: '/AjaxMethods/AjaxLoadContacts.aspx?action=hirecontacts&comId=' + cid + '&hireId=' + hid,
        cache: false,
        success: function (html) {
            $('#hirecontact').html(html);
            // 复制
            var text = window.location.href.split('#')[0] + '#' + 'hire_' + hid;
            copyText('btn' + hid, text);
        }
    });
    //$("#hirecontact").load("/AjaxMethods/AjaxLoadContacts.aspx", { action: "hirecontacts", comId: cid, hireId: hid, t: (new Date().getTime()) });
    $("#Certification").load("/AjaxMethods/AjaxCertification.aspx", { id: cid, t: (new Date().getTime()) });
    $("#sDate").load("/AjaxMethods/AjaxHire.aspx", { action: "announcedate", id: hid, t: (new Date().getTime()) });
    $('#visitCount').load("/AjaxMethods/AjaxHire.aspx", { action: 'visitcount', id: hid, t: (new Date().getTime()) });

    // 当前职位
    var p = getPageName(window.location.href);
    $('.blue_box a').each(function () {
        if (getPageName(this.href) == p) {
            $(this).parent().addClass('ovli');
            return;
        }
    });
    // 其他公司也在招聘此相关职位
    $.ajax({
        url: '/AjaxMethods/Handler.aspx?action=LoadSameHireCompanys&id=' + hid,
        cache: false,
        success: function (html) {
            if (html != '0') {
                $('#divOtherHires').show();
                $('#hire_companys').html(html);
            }
        }
    });
    // 修复职位过长布局混乱的问题
    $('.place_item').each(function () {
        if ($.trim($(this).html()).length > 8) {
            $(this).next().addClass('place_title');
        }
    });
    var _hireTip = "<h2>求职提醒</h2> <ul><li>查看招聘职位信息时，点击职位下方“我要应聘”，即可向该企业发出您的简历哦！</li>";
    _hireTip += "<li>查看招聘职位信息时，请留意招聘工作地区和招聘期限，确保该职位信息有效并且与您的意向工作地区相符。</li>";
    _hireTip += "<li>留意招聘信息上的出位描述和招聘要求，确保能够找到您期望并且能够胜任的工作。</li>";
    _hireTip += "<li>留意招聘信息中的待遇信息，在求职过程中与招聘单位核实待遇，避免上岗之后产生的纠纷。";
    _hireTip += " <br /><a href='http://www.138job.com/help/index.asp' target='_blank'>[更多帮助]</a></li></ul>";
    $(".ptips").html(_hireTip);
});

function showMobile(tel) {
    $("#tel_1").hide();
    $("#tel_2").show();
    if (tel != undefined) {
        $.ajax({
            type: "POST",
            url: '/AjaxMethods/Handler.aspx?action=MobileRecord&cid=' + cid + '&hid=' + hid + "&tel=" + tel,
            success: function (msg) {
            }
        });
    }
}

function getPageName(str) {
    var k = str.split('/');
    return k[k.length - 1].split('?')[0].split('#')[0];
}
function MM_reloadPage(init) {
    if (init == true) with (navigator) {
        if ((appName == "Netscape") && (parseInt(appVersion) == 4)) {
            document.MM_pgW = innerWidth;
            document.MM_pgH = innerHeight;
            onresize = MM_reloadPage;
        }
    } else if (innerWidth != document.MM_pgW || innerHeight != document.MM_pgH) {
        location.reload();
    }
}
MM_reloadPage(true);
function showcompany(str) {
    if (str == 1) {
        document.all("hire").style.display = "none";
        document.all("company").style.display = "";
    } else {
        document.all("company").style.display = "none";
        document.all("hire").style.display = "";
    }
}
//功能：去掉字符串前后空格
//返回值：去掉空格后的字符串
function fnRemoveBrank(strSource) {
    return strSource.replace(/^\s*/, '').replace(/\s*$/, '')
}
function check(myform) {
    if (fnRemoveBrank(myform.loginname.value) == "" || fnRemoveBrank(myform.loginname.value) == "用户名") {
        alert("请输入用户名！");
        myform.loginname.focus();
        return (false);
    }
    if (myform.pwd.value == "" || myform.pwd.value == "密码") {
        alert("请输入密码！");
        myform.pwd.focus();
        return (false);
    }
}
function pwdblur(c) { if (c.value == '') { $('#pwd').hide(); $('#password').show(); } }
var secs = 30;
var ull = window.location.href;
ull1 = ull.split("_")[1]
function update(num) {
    if (num == secs) {
        AreaDisplayIsOpen();
    }
}
/*
for (i = 1; i <= secs; i++) {
window.setTimeout("update(" + i + ")", i * 1000);
}
*/
function CloseDVArea() {
    var dv = document.getElementById("dvArea");
    dv.style.display = "none";
    document.getElementById("bodyly").style.display = 'none';
}
function AreaDisplayIsOpen() {
    if (document.getElementById("bodyly") == null) return;
    document.getElementById("bodyly").style.display = "block";
    document.getElementById("bodyly").style.width = document.body.clientWidth + 'px';
    document.getElementById("bodyly").style.height = document.body.clientHeight + 'px';
    document.getElementById("dvArea").style.display = 'block';
    var diffY;
    if (document.documentElement && document.documentElement.scrollTop)
        diffY = document.documentElement.scrollTop + 200;
    else if (document.body)
        diffY = document.body.scrollTop + 200;
    else
        diffY = 200;
    document.getElementById("dvArea").style.top = diffY + "px";
}
lastScrollY = 0;

function heartBeat() {
    var diffY;
    if (document.documentElement && document.documentElement.scrollTop)
        diffY = document.documentElement.scrollTop;
    else if (document.body)
        diffY = document.body.scrollTop;
    else { }
    percent = .1 * (diffY - lastScrollY);
    if (percent > 0)
        percent = Math.ceil(percent);
    else percent = Math.floor(percent);
    document.getElementById("full").style.top = parseInt(document.getElementById("full").style.top) + percent + "px";
    //    var _wp = $('.pageheader').eq(0);
    //    if (_wp.html() != null) {
    //        document.getElementById("full").style.left = (_wp.width() + _wp.offset().left - 20) + 'px';
    //    }
    lastScrollY = lastScrollY + percent;
}
//suspendcode = "<div id=\"full\" style='right:5px;POSITION:absolute;TOP:150px;z-index:100'><div  style='background-image: url(http://www.138job.com/images/RightBg.gif);width:110px; height:145px;'><div style='color:#FFFFFF;padding-top:45px;padding-left:18px;line-height:18px;font-size:12px;'>马上向该企业<br/>投递简历？</div><div style='padding-top:12px;padding-left:8px;'><a href='http://www.138job.com/Register.aspx?Member_type=1' target='_blank'><img src='http://www.138job.com/images/rightReg.gif' border=0 /></a></div></div></div>";


//suspendcode = "<div id=\"full\" style='right:5px;POSITION:absolute;TOP:150px;z-index:100'><a href='http://www.138job.com/Register.aspx?Member_type=1&f=c3' target='_blank'><img src='/skin/skin2012/Images/company_job_tip.gif'></a></div>";

suspendcode = "<style>html{ _background:url(about:blank);_background-attachment:fixed;}.job_info{top:300px;left:50%;margin-left:540px;position:fixed; _position: absolute;_top:expression(documentElement.scrollTop + 300+ 'px');width:60px;z-index:1;}.job_info a{height:60px; width:60px; display:block;background:url(http://s.138mr.com/images/icons/job_info_btn.gif) no-repeat;}.job_apply,.job_resume{width:60px; height:60px; display:inline-block; overflow:hidden; margin-bottom:5px;}.job_apply a{background-position:0 0;}.job_resume a{background-position:0 -65px;}.job_apply a:hover{background-position:-60px 0px;}.job_resume a:hover{background-position:-60px -65px;}</style><div class='job_info'><div class='job_apply'><a href=\"http://my.138job.com/Person/ResumeSend.aspx?strHireIds=" + hid + "\" target=_blank></a></div><div class='job_resume'><a href=\"http://www.138job.com/Register.aspx?Member_type=1&f=c3\" target=_blank></a></div></div>"

//document.write(suspendcode);
//window.setInterval("heartBeat()", 1);


function AddFavorite() {
    $.post("/AjaxMethods/AjaxAddFavorite.aspx", { hireid: hid, t: (new Date().getTime()) }, function (msg) { if (msg == "0") { alert("请先登录个人求职会员"); window.location = "/login.aspx?url=" + window.location.pathname; } else alert(msg); });
    return false;
}

/*2013修改*/

function loadLoginaq() {
    $.ajax({
        url: "/AjaxMethods/Handler.aspx?action=LoadLoginInfo",
        cache: false,
        success: function (msg) {
            var state;
            if (msg == '0') {
                state = 0;
            }
            else {
                var items = msg.split('|');
                state = items[0] == '2' ? 2 : 1;
            }
            showInfo(state);
        }
    });
}

$(document).ready(function () {
    //var status=2; //0未登陆，1个人登陆，2企业登陆
    //showInfo(status);
    //alert(status);
    loadLoginaq();
    writeCss();
});

function writeCss() {
    var $css = "<style>.footer_bar_bg{height:100px; width:100%; position:fixed; left:0px; bottom:-100px; _position:absolute; _bottom:auto; _top: expression(offsetParent.scrollTop+document.documentElement.clientHeight-this.offsetHeight); background:#000; opacity:0.7; filter: alpha(opacity=70); z-index:998;}.footer_bar_close{width:20px; height:20px; position:fixed; right:10px; bottom:85px; _position:absolute; _bottom:auto; _top: expression(offsetParent.scrollTop+document.documentElement.clientHeight-this.offsetHeight-60); font-size:30px; font-family:\"microsoft yahei\",\"微软雅黑\",\"黑体\"; color:#fff; z-index:999; cursor:pointer; display:none;}.footer_bar_hide{width:60px; height:60px; display:inline-block;  position:fixed; left:50%; margin-left:520px; bottom:40px; _position:absolute; _bottom:auto; _top: expression(offsetParent.scrollTop+document.documentElement.clientHeight-this.offsetHeight); background:url(http://s.138mr.com/138job/images/footer_bar_hide.jpg) no-repeat 0 0; cursor:pointer; display:none;}.footer_bar{height:60px; width:980px; padding-top:40px; position:fixed; left:50%; margin-left:-490px; bottom:-100px; _position:absolute; _bottom:auto; _top: expression(offsetParent.scrollTop+document.documentElement.clientHeight-this.offsetHeight); z-index:1000;}.footer_bar a,.footer_bar span{display:inline-block; margin-right:10px; height:35px; line-height:35px; font-size:14px; font-family:\"microsoft yahei\",\"微软雅黑\",\"黑体\";  color:#fff;}.footer_bar span{}.footer_bar a{padding:0px 15px; color:#fff;}.footer_bar a.register{font-size:18px; background-color:#eb3d00; padding:0px 20px;}.footer_bar a.login{font-size:16px; background-color:#00b6de;}.footer_bar a.contact{font-size:16px; background-color:#53d37e;}.footer_bar a.replay{font-size:18px; background-color:#ff5a00;}.barclose{height:30px; padding-top:0px;}.oklogin{background:url(http://s.138mr.com/138job/images/bar_bg.png) no-repeat 10px 0;}.nologin{background:url(http://s.138mr.com/138job/images/bar_bg.png) no-repeat 0 -100px;}.bar_inner{text-align:right; padding-right:55px;}.nologin .bar_inner{text-align:right; padding-right:0;}.replay_tips_bg{width:100%; height:100%; position:absolute; left:0; top:0; background:#000; opacity:0.1; filter: alpha(opacity=10); z-index:1001; display:none;}.replay_tips{width:224px; height:104px; background:#fff; border:3px solid #999; position:fixed; _position:absolute; left:50%; top:50%; _top:expression(documentElement.scrollTop + 252+ 'px'); margin-left:-112px; margin-top:-52px; z-index:1002; -moz-box-shadow:2px 2px 5px rgba(0,0,0,0.2); -webkit-box-shadow:2px 2px 5px rgba(0,0,0,0.2); box-shadow:2px 2px 5px rgba(0,0,0,0.2); display:none;}.tips_content{height:50px; background-color:#ff5a00; line-height:50px; font-size:14px; font-family:\"microsoft yahei\",\"微软雅黑\",\"黑体\";  text-align:center; color:#fff;}.tips_button{padding:15px 0px 0px; text-align:center;}.tips_button input{width:60px; height:25px; border:0 none; background:url(http://s.138mr.com/138job/images/reply_tips_btn.jpg) no-repeat 0 0; cursor:pointer; margin-right:10px;}.tips_button input.btn_ok{background-position:0 0px;}.tips_button input.btn_cancel{background-position:0 -25px;}</style>";
    $("body").append($css);
}
function showInfo(status) {
    if (status == 2) return;
    footerBar(status);

    /*if (status != 2) {
    setInterval(function () {
    var tips = $(".replay_tips");
    if (tips.length > 0) {
    } else {
    showTips();
    }
    }, 30000);
    }*/
}

function footerBar(status) {
    var html = "<div class=\"footer_bar_bg\"></div><div class=\"footer_bar_close\" onclick=\"hideBar();\">&times;</div><div class=\"footer_bar_hide\" onclick=\"showBar();\"></div>";
    var loginhtml;
    if (status == 0) {
        loginhtml = "<div class=\"footer_bar nologin\"><div class=\"bar_inner\"><a href=\"http://www.138job.com/Register.aspx?Member_type=1&f=cn\" target=\"_blank\"  class=\"register\">免费注册</a><span>或直接</span><a href=\"http://cas.138mr.com/login?service=http://my.138mr.com/loginhandler.aspx?url=" + window.location.href + "\" class=\"login\">登录</a><a href=\"#hirecontact\" class=\"contact\">联系企业</a></div></div>";
    } else if (status == 1) {
        loginhtml = "<div class=\"footer_bar oklogin\"><div class=\"bar_inner\"><a href=\"http://my.138job.com/Person/ResumeSend.aspx?strHireIds=" + hid + "\" class=\"replay\">立即应聘</a><span>或直接</span><a href=\"#hirecontact\" class=\"contact\">联系企业</a></div></div>";
    }
    $("body").append(html + loginhtml);

    //setTimeout(showBar, 100);
}

function showBar() {
    if (isIE6()) {
        $(".footer_bar_bg,.footer_bar").show();
        $(".footer_bar_close").fadeIn("fast");
        $(".footer_bar_hide").fadeOut("fast");
        return false;
    }
    $(".footer_bar_bg,.footer_bar").animate({ bottom: 0 }, 300, function () {
        $(".footer_bar_close").fadeIn("fast");
        $(".footer_bar_hide").fadeOut("fast");
    });
}

function hideBar() {
    if (isIE6()) {
        $(".footer_bar_bg,.footer_bar").hide();
        $(".footer_bar_close").fadeOut("fast");
        $(".footer_bar_hide").fadeIn("fast");
        return false;
    }
    $(".footer_bar_bg,.footer_bar").animate({ bottom: -100 + "px" }, 300, function () {
        $(".footer_bar_close").fadeOut("fast");
        $(".footer_bar_hide").fadeIn("fast");
    });
}

function showTips() {
    var $html = "<div class=\"replay_tips_bg\"></div><div class=\"replay_tips\"><div class=\"tips_content\">您是否要应聘该职位?</div><div class=\"tips_button\"><input type=\"button\" name=\"tips_ok\" value=\" \" class=\"btn_ok\" onclick=\"replayOk();\" \/><input type=\"button\" name=\"tips_cancel\" value=\" \" class=\"btn_cancel\" onclick=\"hideTips();\" \/></div></div>";
    $("body").append($html);
    $(".replay_tips_bg").css({ "width": $(document).width(), "height": $(document).height() }).show();
    $(".replay_tips").fadeIn();
}

function hideTips() {
    $(".replay_tips_bg").hide().remove();
    $(".replay_tips").fadeOut().remove();
}

function replayOk() {
    hideTips();
    window.open('http://my.138job.com/Person/ResumeSend.aspx?strHireIds=' + hid);
}

function isIE6() {
    return ($.browser.msie && $.browser.version == "6.0") ? true : false;
}
