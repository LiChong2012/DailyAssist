<!DOCTYPE html>
<html>
<head>
    <title>Sign In | DailyAssist</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="css/signin.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/signin.js"></script>
</head>
<body>
<script>
    $(document).ready(function(){
        $("#loginForm").hide();
        $("#loginForm").fadeIn(2000);
    })
    var backgroundOffset = 0;
    var bgObject = eval('document.body');
    function scrollBG(maxSize) {
        if (backgroundOffset <= maxSize) {
            backgroundOffset++;
            bgObject.style.backgroundPosition = "-250px " + (backgroundOffset - 310) + "px";
        }
        else {
        }
    }
    var ScrollTimer = window.setInterval("scrollBG(240)", 160);
</script>
<section id="signIn" class="row">
    <setion id="formSection">
        <form class="form-horizontal" id="loginForm" action="LoginServlet" method="POST">
            <span id="siteTitle">DailyAssist</span><br/><br/>
            <span id="loginText">We help you to manage your daily life!</span>
            <br/>
            <br/>
            <div class="input-prepend" id="loginBlock">
                <span class="add-on"><i class="icon-user"></i></span>
                <input type="text" id="username" name="username" class="input input-xlarge" placeholder="email....."/>
                <br/>
                <span class="add-on"><i class="icon-lock"></i></span>
                <input type="password" id="password" name="password" class="input input-xlarge" placeholder="password....."/>
            </div>
            <br/>
            <a id="getSignUp" href="signup.html"><i class="icon-pencil icon-white"></i> Do not have an account?</a>
            <input type="submit" class="btn btn-info" id="loginSubmit" value="Sign In"/>
        </form>
    </setion>
    <footer class="">
        <hr/>
        <table>
            <tr>
                <th class="">
                    Developers
                </th>
                <th class="">
                    About us
                </th>
                <th class="">
                    About DailyAssist
                </th>
                <th>
                    Lorem ipsum
                </th>
            </tr>
            <tr>
                <td>
                    <a href="">Chong Li</a><br/>
                    <a href="">Yu-Ming Chen</a><br/>
                    <a href="">Jia-Hua Yan</a><br/>
                    <a href="">Di Lu</a>
                </td>
                <td>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
                    sed diam nonummy nibh euismod tincidunt ut laoreet dolore
                    magna aliquam erat volutpat. Ut
                </td>
                <td>
                    This is a group final project for IS2560 Web Technology and Standards.
                    Lorem ipsum dolor sit amet, consectetuer
                </td>
                <td>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
                    sed diam nonummy nibh euismod tincidunt ut laoreet dolore
                    magna aliquam erat volutpat.
                </td>
            </tr>
        </table>
        <hr/>
        <span id="bottomBar">DailyAssist | @2012 All Rights Reserved</span>
    </footer>

</section>
</body>
</html>