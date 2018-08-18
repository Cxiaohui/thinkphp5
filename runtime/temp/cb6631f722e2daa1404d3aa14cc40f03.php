<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:56:"C:\xampp\htdocs\thinkphp5/app/index\view\index\index.php";i:1534564860;}*/ ?>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>API在线文档</title>
    <link href="/index.php/static/admin/source/api.css" rel="stylesheet" type="text/css" />
    <script src="/index.phpstatic/admin/js/jquery-1.8.3.min.js"></script>
    <script language="javascript" src="/index.php/static/admin/source/jquery.min.js"></script>
    <script language="javascript" src="/index.php/static/admin/source/jquery.dimensions.js"></script>
</head>
<body>
<div class="tit">
    <div id="titcont">
        API在线文档
    </div>
</div>
<div id="cont">
    <div class='fun'>
        <div class='lineface'>一、测试接口</div>
        <a name="用户接口"></a>
        <span class='le'>#.<em>登录接口</em> <b>描述:用户登录接口</b></span>
        <div class='says'>传参说明：账号,密码</div>
        <form action="<?php echo url('index/api/login'); ?>" method="post">
            账号: <input type="text" name="user" value="">
            密码: <input type="text" name="pass" value="">
            <input type="submit" value="提交">
        </form>

        <a name="注册接口"></a>
        <span class='le'>#.<em>注册接口</em> <b>描述:注册接口</b> </span>
        <div class='says'>传参说明：手机号,验证码,用户名.</div>
        <form action="<?php echo url('index/api/register'); ?>" method="post">
            手机: <input type="text" name="FirstName" value="">
            用户名: <input type="text" name="LastName" value="">
            短信验证码: <input type="text" name="FirstName" value="">

            <input type="submit" value="提交">
        </form>
        <a name="短信接口"></a>
        <span class='le'>#.<em>短信接口</em> <b>描述:短信接口</b> </span>
        <div class='says'>传参说明：请传入手机号参数.</div>
        <form action="<?php echo url('index/api/sms'); ?>" method="post">
            手机: <input type="text" name="phone" value="">
            <input type="submit" value="提交">
        </form>

        <a name="用户信息接口"></a>
        <span class='le'>#.<em>用户信息接口</em> <b>描述:用户信息接口</b> </span>
        <div class='says'>传参说明：用户ID.</div>
        <form action="<?php echo url('index/api/userInfo'); ?>" method="post">
            用户ID: <input type="text" name="id" value="">
            <input type="submit" value="提交">
        </form>

    </div>
    <div class='fun'>
        <div class='lineface'>二、登录相关接口</div>
        <a name="文章列表接口"></a>
        <span class='le'>#.<em>文章列表接口</em> <b>描述:文章列表接口</b></span>


        <div class='says'>传参说明：无须其它参数</div>
        <a name="文章详情接口"></a>
        <span class='le'>#.<em>文章详情接口</em> <b>描述:文章详情接口</b> </span>

        <div class='says'>传参说明：请传入文章id参数.</div>

    </div>

</div>



<!--浮动接口导航栏-->
<div id="floatMenu">
    <ul class="menu"></ul>
</div>

</body>
</html>
