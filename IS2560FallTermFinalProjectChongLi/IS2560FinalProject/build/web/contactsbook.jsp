<%-- 
    Document   : contactsbook
    Created on : 2012-12-10, 18:11:04
    Author     : VigossZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app>
    <head>
        <title> | DailyAssist</title>
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet"/>
        <link href="css/nav.css" type="text/css" rel="stylesheet"/>
        <link href="css/contactsbook.css" type="text/css" rel="stylesheet"/>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/angular.js"></script>
        <script type="text/javascript" src="js/contactsbook.js"></script>
    </head>
    <body ng-controller="ContactsCtrl">

        <% if (null == request.getSession().getAttribute("user")) {%>
        <%
            response.sendRedirect("signin.jsp");
        %>
        <% } else {%>

        <section id="contactsbook" class="">
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
                        <li class="active">
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

            <section class="container" id="contacts">
                <section class="span12">
                    <section class="span5" id="contactsControl">
                        <section id="leadTitle">
                            <img src="img/contactsLogo.jpg" class="img-rounded"/>
                        </section>
                        <section id="controlSection">
                            <section id="searchSection" class="well span3">
                                <ul class="nav nav-list">
                                    <li class="nav-header">Search Contacts</li>
                                    <li class="divider"></li>
                                    <li class="input-append">
                                        <input type="text" class="input" id="appendedInputButton" ng-model="query"/>
                                        <span class="add-on btn-info"><i class="icon-search icon-white"></i></span>
                                    </li>
                                </ul>
                            </section>
                            <section id="addSection" class="well span2">
                                <ul class="nav nav-list">
                                    <li class="nav-header">Add Contacts</li>
                                    <li class="divider"></li>
                                    <li class="muted">
                                        <strong>Guide:</strong>
                                        <p>Press the button below, and fill in form with contact information</p>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <button class="btn btn-info btn-block" data-toggle="modal" data-target="#addModal">Add Contact</button>
                                    </li>
                                    <li class="divider"></li>
                                </ul>
                            </section>
                            <section id="sortSection" class="well span3">
                                <ul class="nav nav-list">
                                    <li class="nav-header">Sort By</li>
                                    <li class="divider"></li>
                                    <li class="muted">
                                        <p>Select an attribute to order contacts</p>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <select id="selectOrder" ng-model="sort">
                                            <option value="name">NAME</option>
                                            <option value="group">GROUP</option>
                                        </select>
                                    </li>
                                </ul>
                            </section>
                        </section>
                        <section id="nameList" class="well span5">
                            <ul class="nav nav-list">
                                <li class="nav-header">Contacts List</li>
                                <li class="divider"></li>
                                <section ng-repeat="contact in contacts">
                                    <li>
                                        <span>
                                            <a href="# {{contact.id}}">{{contact.name}}</a>
                                            <button type="button" class="btn btn-link delete" check="{{contact.name}}" onclick="deleteContact(this)">
                                                <i class="icon-trash"></i></button>
                                            <button type="button" class="btn btn-link edit" data-toggle="modal" check="{{contact.name}}" data-target="#modifyModal" onclick="editContact(this)">
                                                <i class="icon-pencil"></i></button>
                                        </span>
                                    </li>
                                    <li class="divider"></li>
                                </section>
                            </ul>
                            <section id="addModal" class="modal hide fade text-info" tabindex="-1" role="dialog"
                                     aria-labelledby="addModalLabel" aria-hidden="true">
                                <section class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        <i class="icon-remove-circle"></i></button>
                                    <h3 id="addModalLabel">Add Contact</h3>
                                </section>
                                <section class="modal-body muted">
                                    <dl class="dl-horizontal">
                                        <dt>NAME</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="name"/>
                                        </dd>
                                        <dt>PHONE</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="phone"/>
                                        </dd>
                                        <dt>EMAIL</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="email"/>
                                        </dd>
                                        <dt>ADDRESS</dt>
                                        <dd>
                                            <textarea id="address" class="input-large"></textarea>
                                        </dd>
                                        <dt>PICTURE</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="picture"/>
                                        </dd>
                                        <dt>GROUP</dt>
                                        <dd>
                                            <select id="group">
                                                <option value ="Family">Family</option>
                                                <option value ="Friend">Friend</option>
                                                <option value="School">School</option>
                                                <option value="Job">Job</option>
                                                <option value="Neighbour">Neighbour</option>
                                                <option value="Developer" disabled></option>
                                            </select>
                                        </dd>
                                    </dl>
                                </section>
                                <section class="modal-footer">
                                    <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                    <button type="button" class="btn btn-info" ng-click="addNewContact()"
                                            data-dismiss="modal" aria-hidden="true">Submit</button>
                                </section>
                            </section>
                            <section id="modifyModal" class="modal hide fade text-info" tabindex="-1" role="dialog"
                                     aria-labelledby="modifyModalLabel" aria-hidden="true">
                                <section class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        <i class="icon-remove-circle"></i></button>
                                    <h3 id="modifyModalLabel">Modify Contact</h3>
                                </section>
                                <section class="modal-body muted">
                                    <dl class="dl-horizontal">
                                        <dt>NAME</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="name2"/>
                                        </dd>
                                        <dt>PHONE</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="phone2"/>
                                        </dd>
                                        <dt>EMAIL</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="email2"/>
                                        </dd>
                                        <dt>ADDRESS</dt>
                                        <dd>
                                            <textarea id="address2" class="input-large"></textarea>
                                        </dd>
                                        <dt>PICTURE</dt>
                                        <dd>
                                            <input type="text" class="input-large" id="picture2"/>
                                        </dd>
                                        <dt>GROUP</dt>
                                        <dd>
                                            <select id="group2">
                                                <option value ="Family">Family</option>
                                                <option value ="Friend">Friend</option>
                                                <option value="School">School</option>
                                                <option value="Job">Job</option>
                                                <option value="Neighbour">Neighbour</option>
                                                <option value="Developer" disabled></option>
                                            </select>
                                        </dd>
                                    </dl>
                                </section>
                                <section class="modal-footer">
                                    <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                    <button type="button" class="btn btn-info" onclick="submitEdit()" 
                                            data-dismiss="modal" aria-hidden="true">Submit</button>
                                </section>
                            </section>
                        </section>
                    </section>
                    <section class="span6" id="contactsContent">
                        <section id="contentTitle">
                            <span>Contacts List</span>
                            <small>We help you to manage your contacts</small>
                            <hr/>
                        </section>
                        <section id="contentSection" class="thumbnails span6">
                            <section class="nameCard thumbnail" ng-repeat="contact in contacts | filter: query | orderBy: sort">
                                <table class="table table-striped">
                                    <tr>
                                        <th colspan="2">
                                    <h4 class="name">{{contact.name}}</h4>
                                    </th>
                                    <td rowspan="5" class="pictureTd">
                                        <section class="picture">
                                            <img class="img-polaroid" src="{{contact.img}}"/>
                                        </section>
                                    </td>
                                    </tr>
                                    <tr class="personInfo">
                                        <th>PHONE</th>
                                        <td>{{contact.phone}}</td>
                                    </tr>
                                    <tr class="personInfo">
                                        <th>EMAIL</th>
                                        <td>{{contact.email}}</td>
                                    </tr>
                                    <tr class="personInfo">
                                        <th>ADDRESS</th>
                                        <td>{{contact.address}}</td>
                                    </tr>
                                    <tr class="personInfo">
                                        <th>GROUP</th>
                                        <td>{{contact.group}}</td>
                                    </tr>
                                </table>
                            </section>
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