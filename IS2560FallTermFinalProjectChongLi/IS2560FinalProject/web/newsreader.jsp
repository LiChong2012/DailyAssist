<%-- 
    Document   : newsreader
    Created on : 2012-12-10, 13:44:36
    Author     : VigossZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>News Reader | DailyAssist</title>
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
        <link href="css/newsreader.css" type="text/css" rel="stylesheet" />
        <link href="css/nav.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript" src="js/newsreader.js"></script>
    </head>
    <body>

        <% if (null == request.getSession().getAttribute("user")) {%>
        <%
            response.sendRedirect("signin.jsp");
        %>
        <% } else {%>

        <section id="newsreader">
            <nav class="navbar">
                <section class="navbar-inner">
                    <span id="brand">Daily<b>Assist</b>.</span>
                    <span id="titleNote">We help you to manage your daily life!</span>
                    <ul class="nav pull-right">
                        <li>
                            <a href="home.jsp">Home</a>
                        </li>
                        <li class="active">
                            <a href="newsreader.jsp">News</a>
                        </li>
                        <li>
                            <a href="todolist.jsp">To-Do</a>
                        </li>
                        <li>
                            <a href="contactsbook.jsp">Contacts</a>
                        </li>
                        <li>
                            <a href="twitter.jsp">Twitter</a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="">
                                More <i class="icon-chevron-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a id="sessionUser" href=""><jsp:getProperty name="user" property="username" /></a></li>
                                <li class="divider"></li>
                                <li><a tabindex="-1" href="more.jsp">About DailyAssist</a></li>
                                <li><a tabindex="-1" href="LogoutServlet">Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
            </nav>
            <section class="container">
                <section id="reader" class="span12">
                    <section class="span4" id="feedControl">
                        <section id="leadTitle" class="well well-large">
                            <center>
                                <h2>Thought<br/>Of<br/>Your Day</h2>
                                <small class="pull-right muted"> - by DailyAssist</small>
                            </center>
                        </section>
                        <section id="addFeedSection" class="well">
                            <button type="button" class="btn btn-info btn-block" rel="popover" id="subscribe"
                                    data-content="<input type='text' class='search-query' id='url' onkeydown='keySubmit()'/><br/>
                                    <small class='muted'>e.g. www.mit.edu</small>
                                    <button class='btn' id='searchBtn' onclick='initialize(searchFeed())'>
                                    <i class='icon-share-alt' style='opacity:0.6'></i> Search</button>"
                                    data-original-title="<h5 id='popoverTitle'>Add New Subscription<h5>">
                                <i class="icon-plus-sign icon-white"></i> <b>Subscribe</b>
                            </button>
                            <hr/>
                            <section>
                                <ul class="nav nav-list" id="feedList">
                                    <li class="nav-header" style="font-family: helveticaneue;font-size: 110%">Subscription List</li>
                                    <li class="divider"></li>
                                </ul>
                            </section>
                        </section>
                        <section class="well" id="recommend">
                            <ul class="nav nav-list">
                                <li class="nav-header" style="font-family: helveticaneue;font-size: 110%">Recommended Subscriptions</li>
                                <li class="divider"></li>
                                <li><span class="btn-link" onclick="initialize('infoworld.com')"><i class="icon-hand-right"></i> Info World - infoworld.com</span></li>
                                <li class="divider"></li>
                                <li><span class="btn-link" onclick="initialize('espn.com')"><i class="icon-hand-right"></i> ESPN Go! - espn.com</span></li>
                                <li class="divider"></li>
                                <li><span class="btn-link" onclick="initialize('forbes.com')"><i class="icon-hand-right"></i> Forbes Real Time - Forbes.com</span></li>
                                <li class="divider"></li>
                                <li><span class="btn-link" onclick="initialize('digg.com')"><i class="icon-hand-right"></i> Digg Top Stories - Digg.com</span></li>
                                <li class="divider"></li>
                                <li><span class="btn-link" onclick="initialize('cnn.com')"><i class="icon-hand-right"></i> CNN - cnn.com</span></li>
                                <li class="divider"></li>
                                <li><span class="btn-link" onclick="initialize('mit.edu')"><i class="icon-hand-right"></i> MIT - MIT.edu</span></li>
                                <li class="divider"></li>
                            </ul>
                        </section>
                    </section>
                    <section class="span8" id="feedContent">

                    </section>
                </section>
            </section>

        </section>
        <footer>
            <section class="container">
                <table>
                    <tr>
                        <th class="">
                            DailyAssist..
                        </th>
                        <th class="">
                            Developer Info
                        </th>
                        <th class="">
                            Social
                        </th>
                        <th>
                            Other Links
                        </th>
                    </tr>
                    <tr>
                        <td><hr/></td>
                        <td><hr/></td>
                        <td><hr/></td>
                        <td><hr/></td>
                    </tr>
                    <tr>
                        <td>
                            DailyAssist is a group final project for IS2560 Web Technology and Standards.
                            This project improved us in client-oriented web application design and development,
                            and during the developing process our group members also got some exposure in managing project resources,
                            time-lines, risks and cross-group collaborations.
                        </td>
                        <td id="developer">
                            <dl>
                                <dt>Developers</dt>
                                <dd>
                                    <table>
                                        <tr>
                                            <td>Chong Li</td>
                                            <td>JiaHua Yan</td>
                                        </tr>
                                        <tr>
                                            <td>Di Lu</td>
                                            <td>YuMing Chen</td>
                                        </tr>
                                    </table>
                                </dd>
                                <dt>Address</dt>
                                <dd>
                                    University of Pittsburgh<br/>
                                    Information School
                                </dd>
                                <dt>Major</dt>
                                <dd>Information Science</dd>
                                <dt>Contact Info</dt>
                                <dd><a href="more.html">Find us in DailyAssist Contacts!</a></dd>
                            </dl>
                        </td>
                        <td id="social">
                            <p>Find us on social network sites, we would love to hear advice from you.</p>
                            <table>
                                <tr>
                                    <td>
                                        <a href="">
                                            <img src="img/twitter-sns.png" title="twitter"/>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="">
                                            <img src="img/facebook-sns.png" title="facebook"/>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="">
                                            <img src="img/google-sns.png" title="facebook"/>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="">
                                            <img src="img/linkedin-sns.png" title="facebook"/>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                            <p>
                                This is an on-going process, we will complete the social network support in near future.
                            </p>
                        </td>
                        <td>
                            <p>We provide some useful links, which includes UPitt information,
                                academic resources from prof. Spring, and web development sites,
                                hoping to be helpful to you.</p>
                            <ul class="unstyled">
                                <li>
                                    <a href="http://www.pitt.edu">
                                        <i><img src="img/caret-right.png"></i>
                                        <span>University of Pittsburgh</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.sis.pitt.edu">
                                        <i><img src="img/caret-right.png"></i>
                                        <span>iSchool of UPitt</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.sis.pitt.edu/~spring/">
                                        <i><img src="img/caret-right.png"></i>
                                        <span>Professor M.B.Spring</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.w3schools.com">
                                        <i><img src="img/caret-right.png"></i>
                                        <span>Web Develop W3Schools.com</span>
                                    </a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </section>
        </footer>
        <section class="container end">
            <span>DailyAssist | @2012 All Rights Reserved</span>
        </section>
                                
                                <%}%>
    </body>
</html>