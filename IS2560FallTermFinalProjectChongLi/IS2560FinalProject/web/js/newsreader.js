/**
 * Created with JetBrains WebStorm.
 * User: VigossZ
 * Date: 12-10-30
 * Time: 下午8:03
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function(){
    $("#subscribe").popover({
        placement:"bottom"
    });
    
    jQuery.ajax({
        url:"./files/api.json",
        async: false,
        success:function(result){
            var jsonRes = jQuery.parseJSON(result);
            var thisUser = document.getElementById("sessionUser").innerHTML;
            var userAmounts = jsonRes.userObject.length;
            var count = 0;
            var thisId = 0;
            for(count = 0; count < userAmounts; count++){
                if(thisUser == jsonRes.userObject[count].email){
                    thisId = count;
                }
            }
            $.each(jsonRes.userObject[thisId].newsreader.bookmarks, function(i, value){
                google.feeds.lookupFeed(value, loadFeedList);
            });
            
        }
    });
});

google.load("feeds", "1");
var checklistitem = 0;

function initialize(url) {
    $("#newsList").remove();
    google.feeds.lookupFeed(url, lookupDone);
    $("#subscribe").popover("hide");
}

function loadFeedList(result){
    if (!result.error && result.url != null) {
        var url = result.url;
        var feed = new google.feeds.Feed(url);
        feed.load(function(result){
            if(checklistitem == 0){
                var feedList = document.getElementById("feedList");
                var newItem = document.createElement("li");
                newItem.setAttribute("class", "newItem");
                var newItemTitle = document.createElement("span");
                newItemTitle.setAttribute("class", "newItemTitle");
                newItemTitle.setAttribute("id", result.feed.feedUrl);
                newItemTitle.setAttribute("onclick", "loadItem(this)");
                newItemTitle.appendChild(document.createTextNode(result.feed.title));
                newItem.appendChild(newItemTitle);
                var deleteBtn = document.createElement("button");
                deleteBtn.setAttribute("class", "btn btn-link deleteBtn");
                deleteBtn.setAttribute("onclick", "deleteItem(this)");
                deleteBtn.setAttribute("style", "opacity: 0.6");
                deleteBtn.setAttribute("check", result.feed.feedUrl);
                var delIcon = document.createElement("i");
                delIcon.setAttribute("class", "icon-trash");
                deleteBtn.appendChild(delIcon);
                var divider = document.createElement("li");
                divider.setAttribute("class", "divider");
                newItem.appendChild(deleteBtn);
                newItem.appendChild(divider);
                feedList.appendChild(newItem);
            }
        });
    }
}

function lookupDone(result) {
    if (!result.error && result.url != null) {
        var feedContent = document.getElementById("feedContent");
        var newsList = document.createElement("ul");
        newsList.setAttribute("id", "newsList");
        newsList.setAttribute("class", "thumbnails")
        feedContent.appendChild(newsList);
        var url = result.url;
        var feed = new google.feeds.Feed(url);
        feed.setNumEntries(99);
        feed.load(function(result){
            if(!result.error){
                $("#feedList").children(".newItem").children(".newItemTitle").each(function(){
                    if($(this).text() == result.feed.title){
                        checklistitem++;
                    }
                });
                if(checklistitem == 0){
                    var feedList = document.getElementById("feedList");
                    var newItem = document.createElement("li");
                    newItem.setAttribute("class", "newItem");
                    var newItemTitle = document.createElement("span");
                    newItemTitle.setAttribute("class", "newItemTitle");
                    newItemTitle.setAttribute("id", result.feed.feedUrl);
                    newItemTitle.setAttribute("onclick", "loadItem(this)");
                    newItemTitle.appendChild(document.createTextNode(result.feed.title));
                    newItem.appendChild(newItemTitle);
                    var deleteBtn = document.createElement("button");
                    deleteBtn.setAttribute("class", "btn btn-link deleteBtn");
                    deleteBtn.setAttribute("onclick", "deleteItem(this)");
                    deleteBtn.setAttribute("style", "opacity: 0.6");
                    var delIcon = document.createElement("i");
                    delIcon.setAttribute("class", "icon-trash");
                    deleteBtn.appendChild(delIcon);
                    var divider = document.createElement("li");
                    divider.setAttribute("class", "divider");
                    newItem.appendChild(deleteBtn);
                    newItem.appendChild(divider);
                    feedList.appendChild(newItem);
                    
                    $.post("NewsreaderServlet", {
                        bookmarks: result.feed.feedUrl,
                        user: document.getElementById("sessionUser").innerHTML
                        });
                }
                var feedIntro = document.createElement("h5");
                feedIntro.appendChild(document.createTextNode("News From : "));
                feedIntro.setAttribute("style", "color: #ababab; margin-left:40px; width: 90%");
                var sourceTitle = document.createElement("span");
                sourceTitle.appendChild(document.createTextNode(result.feed.title));
                sourceTitle.setAttribute("style", "color: #2F96B4;font-family: helveticaneue;font-weight:bolder;font-size:120%;text-decoration:underline;margin-left:10px");
                feedIntro.appendChild(sourceTitle);
                feedIntro.appendChild(document.createElement("hr"));
                newsList.appendChild(feedIntro);
                for(var i = 0; i<result.feed.entries.length; i++){
                    var entry = result.feed.entries[i];
                    var newsItem = document.createElement("li");
                    newsItem.setAttribute("class", "span7 thumbnail newsItem");
                    newsItem.setAttribute("style", "margin: 0 0 6px 38px")

                    var titleSection = document.createElement("section");
                    titleSection.setAttribute("class", "titleSection");
                    titleSection.setAttribute("onclick", "slideDownNews()")
                    // title
                    var titleText = document.createElement("a");
                    titleText.setAttribute("style", "font-size: 110%;font-weight:bold;text-decoration:none;font-family: helveticaneue;")
                    titleText.appendChild(document.createTextNode(entry.title));
                    titleSection.appendChild(titleText);
                    titleSection.appendChild(document.createElement("br"));
                    // time
                    var pubDate = document.createElement("span");
                    pubDate.setAttribute("class","muted small");
                    var now = new Date();
                    var nowHour = now.getHours();
                    var nowMinutes = now.getMinutes();
                    var today = now.getDate();
                    var thisMonth = now.getMonth() + 1;
                    var thisYear = now.getFullYear();
                    var theDate = new Date(String(entry.publishedDate));
                    var year = theDate.getFullYear();
                    var month = theDate.getMonth() + 1;
                    var day = theDate.getDate();
                    var hours = theDate.getHours();
                    var minutes = theDate.getMinutes();
                    if(minutes < 10){
                        minutes = "0"+minutes
                        }
                    var monthshow;
                    switch(month){
                        case 1:
                            monthshow = "January";
                            break;
                        case 2:
                            monthshow = "February"
                            break;
                        case 3:
                            monthshow = "March";
                            break;
                        case 4:
                            monthshow = "April";
                            break;
                        case 5:
                            monthshow = "May";
                            break;
                        case 6:
                            monthshow = "June";
                            break;
                        case 7:
                            monthshow = "July";
                            break;
                        case 8:
                            monthshow = "August";
                            break;
                        case 9:
                            monthshow = "September";
                            break;
                        case 10:
                            monthshow = "October";
                            break;
                        case 11:
                            monthshow = "November";
                            break;
                        default :
                            monthshow = "December";
                    }
                    if( year == thisYear && month == thisMonth && day == today ){
                        var time = nowHour - hours;
                        if(time > 0){
                            pubDate.appendChild(document.createTextNode(time));
                            var timePassed = document.createElement("span");
                            timePassed = " hours ago.";
                            pubDate.appendChild(document.createTextNode(timePassed));
                        }
                        else{
                            var minutesago = nowMinutes - minutes;
                            if(minutesago < 0)
                                minutesago += 60;
                            pubDate.appendChild(document.createTextNode(minutesago));
                            var timePassed = document.createElement("span");
                            timePassed = " minutes ago.";
                            pubDate.appendChild(document.createTextNode(timePassed));
                        }
                    }
                    else {
                        var time = monthshow + " " + day + ", " + year +" , at " + hours + ":" + minutes;
                        pubDate.appendChild(document.createTextNode(time));
                    }
                    titleSection.appendChild(pubDate);
                    // author(optional)
                    var author = document.createElement("span");
                    author.setAttribute("class", "muted small");
                    author.setAttribute("style", "margin-left:10px")
                    var by = document.createElement("span");
                    author.appendChild(document.createTextNode("by "));
                    author.appendChild(document.createTextNode(entry.author));
                    if(entry.author != null && entry.author != ""){
                        titleSection.appendChild(author);
                    }

                    newsItem.appendChild(titleSection);

                    // snippet
                    var snippetSection = document.createElement("section");
                    snippetSection.setAttribute("class", "snippetSection muted");
                    snippetSection.appendChild(document.createElement("hr"));
                    var snippetText = document.createElement("section");
                    snippetText.appendChild(document.createTextNode(entry.contentSnippet));
                    snippetSection.appendChild(snippetText);
                    snippetSection.appendChild(document.createElement("br"));
                    // slideup button
                    var slideupBtn = document.createElement("a");
                    slideupBtn.setAttribute("class", "btn btn-info btn-small slideupBtn");
                    slideupBtn.setAttribute("style", "margin-left: 10px; float:right");
                    slideupBtn.setAttribute("onclick", "slideUpNews()")
                    slideupBtn.appendChild(document.createTextNode("Hide"));
                    // link to source
                    var source = document.createElement("a");
                    source.setAttribute("class", "btn btn-small");
                    source.setAttribute("style", "margin-left: 10px; float:right");
                    source.setAttribute("href", entry.link)
                    source.appendChild(document.createTextNode("More"));
                    source.setAttribute("target","external");
                    snippetSection.appendChild(source);
                    snippetSection.appendChild(slideupBtn);
                    newsItem.appendChild(snippetSection);
                    newsList.appendChild(newsItem);
                    checklistitem = 0;
                }
                $(".snippetSection").hide();
                var toTop = document.createElement("button");
                toTop.setAttribute("class", "btn btn-block");
                toTop.setAttribute("onclick", "toTop()");
                toTop.setAttribute("style", "float: right; margin-top: 10px; opacity: 0.5; width: 620px;");
                var topIcon = document.createElement("i");
                topIcon.setAttribute("class", "icon-circle-arrow-up");
                toTop.appendChild(topIcon);
                toTop.appendChild(document.createTextNode(" TOP"));
                newsList.appendChild(toTop);
            }
        });
    }
}

google.setOnLoadCallback(initialize);

function searchFeed(){
    var searchUrl = document.getElementById("url");
    var url = searchUrl.value;
    return url;
}

function keySubmit(){
    if(event.keyCode == 13){
        event.returnValue = false;
        initialize(searchFeed());
    }
}

function slideDownNews(){
    $(".titleSection").click(function(){
        $(this).siblings(".snippetSection").slideDown();
    });
    $(".titleSection").css("cursor", "default");
}

function slideUpNews(){
    $(".slideupBtn").click(function(){
        $(this).parent(".snippetSection").slideUp();
    });
    $(".titleSection").css("cursor", "pointer");
}

function loadItem(loaditem){
    $("#newsList").remove();
    initialize(loaditem.id);
}

function deleteItem(deleteitem){
    deleteitem.parentNode.innerHTML = "";
    var thisUser = document.getElementById("sessionUser").innerHTML;
    var checkUrl = $(deleteitem).attr("check");
    $.post("NewsreaderDelete", {"check": checkUrl,"user":thisUser});
}

function toTop(){
    window.scrollBy(0,-100);
    var scrollDelay = setTimeout('toTop()',50);
    var stop = document.documentElement.scrollTop + document.body.scrollTop;
    if(stop==0)
        clearTimeout(scrollDelay);
}