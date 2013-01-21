<%-- 
    Document   : home.jsp
    Created on : 2012-12-6, 23:35:57
    Author     : VigossZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home | DailyAssist</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="css/homenav.css" type="text/css" rel="stylesheet"/>
    <link href="css/home.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/angular.js"></script>
    <script type="text/javascript" src="js/home.js"></script>
</head>
<body>
<% if (null == request.getSession().getAttribute("user")) {%>
<%
    response.sendRedirect("signin.jsp");
%>
<% } else {%>
<section id="home">
    <section>
        <section>
            <section id="session" class="pull-right">
                <ul class="unstyled">
                    <li>
                        <img src="img/logo.jpg" id="logo"/>
                    </li>
                    <li>
                        <h1>Daily<span>Assist</span></h1>
                    </li>
                </ul>
                <hr/>
                <jsp:useBean id="user" scope="session" class="is2560.User" />
                <section id="person">
                    <strong class="text-info"><jsp:getProperty name="user" property="username" /></strong><span id="sep"> |</span>
                    <a href="LogoutServlet">Log Out</a>
                </section>
            </section>
            <section class="carousel slide carousel-fade" id="homeCarousel">
                <section class="carousel-inner">
                    <section class="active item">
                        <img src="img/home1.jpg"/>
                    </section>
                    <section class="item">
                        <img src="img/home2.jpg"/>
                    </section>
                    <section class="item">
                        <img src="img/home3.jpg"/>
                    </section>
                    <section class="item">
                        <img src="img/home4.jpg"/>
                    </section>
                </section>
            </section>
            <nav id="homeNav" class="pull-right">
                <ul>
                    <li class="active">
                        <a href="home.jsp">Home</a>
                    </li>
                    <li>
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
                    <li>
                        <a href="more.jsp">More</a>
                    </li>
                </ul>
            </nav>
        </section>

        <section class="container" id="mainHome">
            <section class="span12">
                <table id="navTable">
                    <tr>
                        <td><img src="img/rss.png" class="img-rounded"/></td>
                        <td><img src="img/todo.png" class="img-rounded"/></td>
                        <td><img src="img/contacts.png" class="img-rounded"/></td>
                        <td><img src="img/twitter.png" class="img-rounded"/></td>
                    </tr>
                    <tr class="muted">
                        <td><h4>News Reader</h4></td>
                        <td><h4>To-Do List</h4></td>
                        <td><h4>Contacts Book</h4></td>
                        <td><h4>My Twitter</h4></td>
                    </tr>
                    <tr class="muted">
                        <td class="description">
                            Take a look at what's new in your Reader.
                            All that matters to you, are here.
                            <ul class="feature unstyled">
                                <li>Real-time Synchronization</li>
                                <li>Personalized Subscription</li>
                                <li>Fresh User Interface</li>
                                <li>Qulified Recommendation</li>
                            </ul>
                        </td>
                        <td class="description">
                            Why using a To-Do List?<br/>
                            From buying milk to finding a soul mate,
                            what you lists here reveals about you.<br/>
                            Reduce stress, remind yourself,<br/>
                            Get organized! Get going!<br/>
                            Create your To-Do List, <br/>RIGHT NOW!<br/>
                        </td>
                        <td class="description">
                            Your address book is full of people who won't stay still.
                            New jobs, new homes, and new social networks make it difficult to keep track of it all.
                            We pulls it together, so your contacts are always up-to-date,
                            and ready to go when and where you need it.
                        </td>
                        <td class="description">
                            Getting started with twitter easily! We provide best user experience for you
                            to get into Twitter.
                            <ul class="feature unstyled">
                                <li>Perfectly Synced</li>
                                <li>All Normal Functions</li>
                                <li>Clear User Interface</li>
                                <li>Secure Account Login</li>
                            </ul>
                        </td>
                    </tr>
                </table>
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
                            <dd><a href="more.jsp">Find us in DailyAssist Contacts!</a></dd>
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
</section>
    <%}%>
</body>
</html>
