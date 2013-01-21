<%-- 
    Document   : todolist
    Created on : 2012-12-10, 18:17:58
    Author     : VigossZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app>
    <head>
        <title>To-Do List | DailyAssist</title>
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet"/>
        <link href="css/nav.css" type="text/css" rel="stylesheet"/>
        <link href="css/todolist.css" type="text/css" rel="stylesheet"/>
        <link href="css/datepicker.css" type="text/css" rel="stylesheet"/>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/datepicker.js"></script>
        <script type="text/javascript" src="js/angular.js"></script>
        <script type="text/javascript" src="js/todolist.js"></script>
        <script type="text/javascript" src="js/underscore.js"></script>
        <script type="text/javascript" src="js/todoCalendar.js"></script>
    </head>
    <body ng-controller="TodoCtrl">

        <% if (null == request.getSession().getAttribute("user")) {%>
        <%
            response.sendRedirect("signin.jsp");
        %>
        <% } else {%>

        <section>
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
                        <li class="active">
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
                <section class="span12" id="todo">
                    <section class="span5" id="todoList">
                        <h3>To-Do List
                            <small>@DailyAssist</small>
                        </h3>
                        <hr/>
                        <section id="thingsTodo">
                            <span id="todoTitle" class="muted"><b
                                    class="taskAmount">{{getTotalTodos()}} </b> Thing(s) To Do: </span>
                            <br/><br/>
                            <table class="table table-striped">
                                <tr ng-repeat="todo in todos">
                                <label>
                                    <td class="checkTd">
                                        <input type="checkbox" class="checkbox" ng-model="todo.done"/>
                                    </td>
                                    <td class="textTd">
                                        <span class="todoContent done-{{todo.done}}">{{todo.text}}</span>
                                    </td>
                                    <td class="timeTd">
                                        <span class="todoContent done-{{todo.done}}">{{todo.time}}</span>
                                    </td>
                                </label>
                                </tr>
                            </table>
                            <hr/>
                            <button class="btn btn-block" ng-click="clearTodos()"><i class="icon-trash"></i> DELETE</button>
                            <hr/>
                        </section>
                    </section>

                    <section class="span5" id="rightCol">
                        <section id="addControl">
                            <h4>Add New Task</h4>
                            <hr/>
                            <form class="form-horizontal">
                                <button class="btn btn-info" id="addbtn" ng-click="addTodo()">
                                    <i class="icon-pencil icon-white"></i> Add<br/>To-do Item
                                </button>
                                <section class="input-prepend">
                                    <span class="add-on"><i class="icon-pencil"></i></span>
                                    <input type="text" ng-model="newTodo" class="input"
                                           id="newTodo" placeholder="New To-do..."/>
                                </section>
                                <hr/>
                                <section class="input-prepend">
                                    <span class="add-on"><i class="icon-time"></i></span>
                                    <input type="text" class="input" ng-model="datePick"
                                           placeholder="25-12-2012" id="datePick">
                                </section>
                            </form>
                            <hr/>
                            <section class="alert hide" id="sorry">
                                <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
                                <strong>Sorry!</strong> You cannot add a task with nothing!
                            </section>
                            <section class="alert alert-info hide" id="great">
                                <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
                                <strong>Great!</strong> Check your To-do List, a new task added!
                            </section>
                        </section>
                        <section id="todoCalendar">
                            <section>
                                <span class="year"></span>
                                <span class="time"></span>
                                <span class="month"></span>
                                <table id="calendar" class="calendar table table-striped">
                                    <thead>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </section>
                        </section>
                        <section class="controlBtn">
                            <button name="last" id="last" class="btn btn-info"><i class="icon-arrow-left icon-white"></i>
                            </button>
                            <button name="current" id="current" class="btn"><i class="icon-tasks"></i></button>
                            <button name="next" id="next" class="btn btn-info"><i class="icon-arrow-right icon-white"></i>
                            </button>
                        </section>
                        <hr/>
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

            <script>
                $(document).ready(function () {
                    $("#datePick").datepicker({format:'mm-dd-yyyy'});
                })
            </script>
            
            <%}%>
    </body>
</html>
