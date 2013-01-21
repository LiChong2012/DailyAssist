/**
 * Created with JetBrains WebStorm.
 * User: VigossZ
 * Date: 12-11-8
 * Time: 下午4:04
 * To change this template use File | Settings | File Templates.
 */


function TodoCtrl($scope){
    
    jQuery.ajax({
        url:"./files/api.json",
        async: false,
        success:function(result){
            var jsonRes = jQuery.parseJSON(result);
            
            var thisUser = document.getElementById("sessionUser").innerHTML;
            var userAmounts = jsonRes.userObject.length;
            var countUser = 0;
            var thisId = 0;
            for(countUser = 0; countUser < userAmounts; countUser++){
                if(thisUser == jsonRes.userObject[countUser].email){
                    thisId = countUser;
                }
            }
            
            var len = jsonRes.userObject[thisId].todolist.content.length;
            var todoObj = new Array();
            todoObj = jsonRes.userObject[thisId].todolist.content;

            var count = 0;
            
            $scope.todos = [];
            
            for(count = 0; count < len; count++){
                $scope.todos.push({
                    "text": todoObj[count].text,
                    "time": todoObj[count].time,
                    "done": todoObj[count].done
                });
            }
            
            $scope.getTotalTodos = function(){
                return $scope.todos.length;
            };

            $scope.addTodo = function(){
                $("#sorry").fadeOut();
                $("#great").fadeOut();
                var taskTime = document.getElementById("datePick").value;
                var newTodo = document.getElementById("newTodo").value;
                if($scope.newTodo == "" || $scope.newTodo == null){
                    $("#sorry").fadeIn();
                }
                else{
                    $("#great").fadeIn();
                    var newTodoContent = {
                        text:newTodo, 
                        done:false, 
                        time:taskTime
                    }
                    $scope.todos.push(newTodoContent);
                    $scope.newTodo = '';
                    $scope.datePick = '';
                    
                    var newTodoContentSer = {
                        text:newTodo, 
                        done:false, 
                        time:taskTime,
                        user:jsonRes.userObject[thisId].email
                    }
                    
                    $.post("TodolistServlet", newTodoContentSer);  
                }
            };

            $scope.clearTodos = function(){
                $scope.todos = _.filter($scope.todos, function(todo){
                    
                    $(todo.done).each(function(){ 
                        var TodoDel = {
                            text:todo.text, 
                            time:todo.time,
                            user:jsonRes.userObject[thisId].email
                        }   
                        $.post("TodolistDelete", TodoDel);
                    });
                    
                    return !todo.done;
                })
            }
            
        }
    });
}