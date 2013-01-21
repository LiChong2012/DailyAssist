<%-- 
    Document   : more
    Created on : 2012-12-10, 18:16:38
    Author     : VigossZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <title>More Information | DailyAssist</title>
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
        <link href="css/more.css" type="text/css" rel="stylesheet" />
        <link href="css/nav.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
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
                        <li class="active">
                            <a href="more.jsp">More</a>
                        </li>
                    </ul>
                </section>
            </nav>
            <section class="container">
                <section class="media" id="media">
                    <a href="home.jsp" class="pull-left">
                        <img class="media-object" src="img/logo.jpg" />
                    </a>
                    <section class="media-body">
                        <h3 class="media-heading text-info">About DailyAssist</h3>
                        <hr/>
                        <p class="muted">
                            DailyAssist is a group final project for IS2560 Web Technology and Standards. 
                            This project improved us in client-oriented web application design and development, 
                            and during the developing process our group members also got some exposure 
                            in managing project resources, time-lines, risks and cross-group collaborations.
                        </p>
                    </section>
                </section>
                <hr/>
                <section id="logoutBlock">
                    <h2>
                        <small class="muted">Thank you for visiting</small>
                        <span class="muted">Daily</span><span class="text-info">Assist.</span>
                    </h2>
                    <p class="text-info">We hope you have best user experience.</p>
                    <hr/>
                    <section id="logoutBtn">
                        <a class="btn" href="files/readme.pdf" target="_blank">Read me</a>
                        <a class="btn btn-info" href="LogoutServlet">Log Out</a>
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
        
        <%}%>
    </body>
</html>
