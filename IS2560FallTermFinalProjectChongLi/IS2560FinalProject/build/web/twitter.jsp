<%@page import="twitter4j.UserMentionEntity"%>
<%@page import="twitter4j.MediaEntity"%>
<%@page import="twitter4j.HashtagEntity"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@page import="java.util.List"%>
<%@page import="twitter4j.TwitterException"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="twitter4j.URLEntity"%>
<%@page import="twitter4j.ResponseList"%>
<%@page import="twitter4j.Paging"%>
<%@page import="twitter4j.Status"%>
<%@page import="twitter4j.User"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitterapi.TweetEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="Twitter">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Twitter Assist | DailyAssist</title>
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
        <link href="css/nav.css" type="text/css" rel="stylesheet" />
        <link href="css/twitter.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/angular.js"></script>
        <script type="text/javascript" src="js/angular-resource.min.js"></script>
        <script type="text/javascript" src="js/twitter.js"></script>

        <script type="text/javascript">
            function refreshPage() {
                window.location = location.href;
            }
        </script>
    </head>
    <body id="twitter">

        <% if (null == request.getSession().getAttribute("user")) {%>
        <%
            response.sendRedirect("signin.jsp");
        %>
        <% } else {%>

        <section class="">
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
                        <li class="active">
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

            <section class="container" id="twitterMain">
                <% if (null == session.getAttribute("twitter")) {%>
                <section>
                    <ul id="login" class="unstyled">
                        <li id="firstLi">
                            <section>
                                <h1 class="muted" id="firstline">Daily<span class="text-info">Assist</span></h1>
                                <h1 id="secondline"><img src="img/logo.jpg" /></h1>
                                <h1 class="muted" id="thirdline">With <span class="text-info">Twitter</span></h1>
                            </section>
                            <hr/>
                            <form method="post" action="TwitterSigninServlet">
                                <input type="submit" class="btn btn-info" value="Sign In Twitter" />
                            </form>  
                        </li>
                        <li id="secondLi">
                            <h3 class="muted">Sign in your Twitter account in DailyAssist.</h3>
                            <img src="img/twitterT.jpg" />
                        </li>
                    </ul>
                </section>
                <% } else {%>
                <%
                    Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
                    try {
                        User user = twitter.verifyCredentials();
                        int pageNO = 1;
                        int err = 0;
                        try {
                            pageNO = Integer.parseInt(request.getParameter("page"));
                        } catch (Exception e) {
                            err = 1;
                        }
                        if (err == 1) {
                            pageNO = 1;
                        }
                %>    

                <section>
                    <ul class="nav nav-tabs" id="twitterTab">
                        <li><a href="#twitterHome" data-toggle="tab">My Twitter</a></li>
                        <li class="active"><a href="#postTweet" data-toggle="tab">Post Tweet</a></li>
                        <li><a href="#searchTweet" data-toggle="tab">Search Tweet</a></li>
                    </ul>
                    <section class="tab-content">
                        <section class="tab-pane fade" id="twitterHome">
                            <section class="well" id="welcome">
                                <h3 class="muted">Welcome <span class="text-info"><%=user.getScreenName()%></span> to your Twitter Viewer</h3>
                            </section>
                            <section class="thumbnail">
                                <section class="media">
                                    <section class="media-body">
                                        <h2 class="muted">
                                            <%=user.getScreenName()%><br/> 
                                            <small class="text-info">@<%=user.getName()%> |</small>
                                            <small><a href="TwitterLogoutServlet">Log Out</a></small>
                                        </h2>
                                        <hr/>
                                        <section>
                                            <ul class="unstyled">
                                                <li>
                                                    <img class="media-object img-polaroid" src="<%=user.getProfileImageURL()%>" />
                                                </li>
                                                <li>
                                                    <table>
                                                        <tr class="text-info">
                                                            <th><%=user.getStatusesCount()%></th>
                                                            <th><%=user.getFriendsCount()%></th>
                                                            <th><%=user.getFollowersCount()%></th>
                                                        </tr>
                                                        <tr class="muted">
                                                            <td>Tweets</td>
                                                            <td>Followings</td>
                                                            <td>Followers</td>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                        </section>
                                    </section>
                                </section>
                            </section>
                        </section>
                        <section class="tab-pane fade in active" id="postTweet">
                            <form action="TwitterPostServlet" class="form-horizontal" method="post">
                                <textarea name="text"></textarea>
                                <input type="submit" name="post" class="btn btn-info" value="Tweet it!"/>
                                <input name="refresh" type="button" class="btn" value="Refresh" onclick="refreshPage();"/>
                            </form>
                            <span class="muted">Check your twitter home timeline.</span>
                            <hr/>

                            <ul class="pager">
                                <% if (pageNO > 1) {
                                %>

                                <li class="previous">
                                    <a href="twitter.jsp?page=<%=pageNO - 1%>">&larr; Older</a>
                                </li>

                                <% }
                                    if (pageNO < 10) {
                                %>

                                <li class="next">
                                    <a href="twitter.jsp?page=<%=pageNO + 1%>#postTweet">Newer &rarr;</a>
                                </li>
                            </ul>

                            <table class="table table-striped">
                                <tr>
                                    <th>Pictures</th>
                                    <th>Names</th>
                                    <th>Tweets</th>
                                </tr>

                                <%
                                    }
                                    List<Status> statuses = twitter.getHomeTimeline(new Paging(pageNO, 20));
                                    for (Status st : statuses) {
                                        Status status;
                                        int retweeted = 0;//1 if the status is a RT status or 0 otherwise
                                        if (st.getRetweetedStatus() != null) {
                                            status = st.getRetweetedStatus();
                                            retweeted = 1;
                                        } else {
                                            status = st;
                                            retweeted = 0;
                                        }
                                        URLEntity[] urls = status.getURLEntities();
                                        HashtagEntity[] hashtags = status.getHashtagEntities();
                                        MediaEntity[] medias = status.getMediaEntities();
                                        UserMentionEntity[] usermentions = status.getUserMentionEntities();

                                        int urlNum = urls.length;
                                        int hashtagNum = hashtags.length;
                                        int usermentionNum = usermentions.length;
                                        int mediaNum = medias.length;
                                        int i = 0;

                                        ArrayList<TweetEntity> entityList = new ArrayList<TweetEntity>();
                                        for (i = 0; i < urlNum; i++) {
                                            entityList.add(new TweetEntity(urls[i].getStart(), urls[i].getEnd(), urls[i].getURL().toString(), 1));
                                        }
                                        for (i = 0; i < hashtagNum; i++) {
                                            entityList.add(new TweetEntity(hashtags[i].getStart(), hashtags[i].getEnd(), hashtags[i].getText(), 2));
                                        }
                                        for (i = 0; i < mediaNum; i++) {
                                            entityList.add(new TweetEntity(medias[i].getStart(), medias[i].getEnd(), medias[i].getURL().toString(), 3));
                                        }
                                        for (i = 0; i < usermentionNum; i++) {
                                            entityList.add(new TweetEntity(usermentions[i].getStart(), usermentions[i].getEnd(), usermentions[i].getScreenName(), 4));
                                        }

                                        //sort by the start of entities
                                        int entityNum = entityList.size();
                                        for (i = 0; i < entityNum; i++) {
                                            for (int j = 0; j < entityNum - 1 - i; j++) {
                                                if (entityList.get(j).start > entityList.get(j + 1).start) {
                                                    TweetEntity tempEntity = new TweetEntity(entityList.get(j).start, entityList.get(j).end, entityList.get(j).entity, entityList.get(j).type);
                                                    entityList.set(j, entityList.get(j + 1));
                                                    entityList.set(j + 1, tempEntity);
                                                }
                                            }
                                        }%>

                                <tr>
                                    <td>
                                        <img src="<%=status.getUser().getProfileImageURL()%>" class="img-polaroid" /> 
                                    </td>                                  
                                    <td>
                                        <%
                                            String tweetText = status.getText();
                                            out.print(status.getUser().getScreenName());
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            int beginIndex = 0;
                                            for (i = 0; i < entityNum; i++) {
                                                if (i == 0) {
                                                    out.print(tweetText.substring(0, entityList.get(i).start));
                                                } else {
                                                    switch (entityList.get(i - 1).type) {
                                                        case 1:
                                                        case 3:
                                                            beginIndex = entityList.get(i - 1).start + entityList.get(i - 1).entity.length();
                                                            break;
                                                        case 2:
                                                        case 4:
                                                            beginIndex = entityList.get(i - 1).end;
                                                            break;
                                                    }
                                                    out.print(tweetText.substring(beginIndex, entityList.get(i).start));
                                                }

                                                switch (entityList.get(i).type) {
                                                    case 1:
                                                        out.print("<a href=" + entityList.get(i).entity + ">" + tweetText.substring(entityList.get(i).start, entityList.get(i).start + entityList.get(i).entity.length()) + "</a>");
                                                        beginIndex = entityList.get(i).start + entityList.get(i).entity.length();
                                                        break;
                                                    case 2:
                                                        out.print("<a href=https://twitter.com/search?q=" + entityList.get(i).entity + "&src=hash" + ">" + tweetText.substring(entityList.get(i).start, entityList.get(i).end) + "</a>");
                                                        beginIndex = entityList.get(i).end;
                                                        break;
                                                    case 3:
                                                        out.print("<a href=" + entityList.get(i).entity + ">" + tweetText.substring(entityList.get(i).start, entityList.get(i).start + entityList.get(i).entity.length()) + "</a>");
                                                        beginIndex = entityList.get(i).start + entityList.get(i).entity.length();
                                                        break;
                                                    case 4:
                                                        out.print("<a href=https://twitter.com/" + entityList.get(i).entity + ">" + tweetText.substring(entityList.get(i).start, entityList.get(i).start + entityList.get(i).entity.length() + 1) + "</a>");
                                                        beginIndex = entityList.get(i).start + entityList.get(i).entity.length() + 1;
                                                        break;
                                                }
                                            }
                                            if (entityNum > 0) {
                                                out.print(tweetText.substring(beginIndex) + "<br/>");
                                            } else {
                                                out.print(tweetText + "<br />");
                                            }
                                            if (retweeted == 1) {
                                                out.print("Retweeted by " + st.getUser().getScreenName() + "<br />");
                                            }
                                        %>
                                    </td>
                                </tr>

                                <%
                                            }
                                        } catch (Exception e) {
                                        }
                                    }
                                %>
                            </table>
                        </section>
                        <section class="tab-pane fade" id="searchTweet" ng-controller="TwitterCtrl">
                            <form class="form-horizontal">
                                <input type="text" ng-model="searchTerm" class="input" />
                                <button class="btn-info btn" ng-click="doSearch()">Search</button>
                            </form>
                            <span class="muted">Search for the most recent tweets.</span>
                            <hr/>
                            <table class="table table-striped">
                                <th>Pictures</th>
                                <th>Names</th>
                                <th>Tweets</th>
                                <tr ng-repeat="tweet in twitterResult.results">
                                    <td><img src="{{tweet.profile_image_url}}" class="img-polaroid"/></td>
                                    <td>{{tweet.from_user}}</td>
                                    <td>{{tweet.text}}</td>
                                </tr>
                            </table>
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
        </section>

        <script>
            $('#twitterTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            })
        </script>
        
        <%}%>
    </body>
</html>
