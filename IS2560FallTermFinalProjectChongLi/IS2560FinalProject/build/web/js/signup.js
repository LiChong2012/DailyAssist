/**
 * Created with JetBrains WebStorm.
 * User: VigossZ
 * Date: 12-10-26
 * Time: 上午8:23
 * To change this template use File | Settings | File Templates.
 */

var flag_email = false;
var flag_pwd = false;
var flag_cpwd = false;
var flag_term = false;

$(document).ready(function(){
    $("#emailError").hide();
    $("#emailSuccess").hide();
    $("#pwdLength").hide();
    $("#pwdFormet").hide();
    $("#pwdSuccess").hide();
    $("#checkPwdError").hide();
    $("#checkPwdSuccess").hide();
    $("#checkUseTerm").hide();
    $("#checkFormTip").hide();
    
})

function emailCheck(){
    var email = document.getElementById("email");
    if(email.value != null && email.value != ""){
        var emailaddr = email.value;
        var emailReg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        var matchArray=emailaddr.match(emailReg);
        if (matchArray==null) {
            $("#emailSuccess").hide();
            $("#emailError").fadeIn();
            flag_email = false;
            return false;
        }
        else{
            $("#emailError").hide();
            $("#emailSuccess").fadeIn();
            flag_email=true;
            return true;
        }
    }
    else{
        $("#emailSuccess").hide();
        $("#emailError").hide();
    }
}

function pwdCheck(){
    pwdMatch();
    var password = document.getElementById("password");
    if(password.value != null && password.value != ""){
        var pwd = password.value;
        var pwdReg2=/^[A-Za-z0-9]/; //pwd cannot begin with symbol
        var pwdReg3=/^.{6,}$/;  //pwd must longer than 6
        var match2=pwd.match(pwdReg2);
        var match3=pwd.match(pwdReg3);
        if (match3==null) {
            $("#pwdFormet").hide();
            $("#pwdSuccess").hide();
            $("#pwdLength").fadeIn();
            flag_pwd = false;
            return false;
        }
        else if (match2==null){
            $("#pwdSuccess").hide();
            $("#pwdLength").hide();
            $("#pwdFormet").fadeIn();
            flag_pwd = false;
            return false;
        }
        else{
            $("#pwdLength").hide();
            $("#pwdFormet").hide();
            $("#pwdSuccess").fadeIn();
            flag_pwd=true;
            return true;
        }
    }
    else{
        $("#pwdLength").hide();
        $("#pwdFormet").hide();
        $("#pwdSuccess").hide();
    }
}

function pwdMatch(){
    var prenode=document.getElementById("password");
    var prepwd=prenode.value;
    var curnode=document.getElementById("checkPassword");
    var curpwd=curnode.value;
    if( prepwd != null && prepwd != ""){
        if (curpwd==prepwd){
            $("#checkPwdError").hide();
            $("#checkPwdSuccess").fadeIn();
            flag_cpwd=true;
            return true;
        }
        else{
            $("#checkPwdSuccess").hide();
            $("#checkPwdError").fadeIn();
            flag_cpwd=false;
            return false;
        }
    }
    else{
        $("#checkPwdError").hide();
        $("#checkPwdSuccess").hide();
    }
}

function checkUseTerm(check){
    if(check.checked){
        $("#checkUseTerm").hide();
    }
    else{
        $("#checkFormTip").hide();
        $("#checkUseTerm").fadeIn();
    }
}

function CheckAll(){
    emailCheck();
    pwdCheck();
    pwdMatch();
    $("#duplicateMsg").hide();
    $("#checkUseTerm").hide();
    $("#checkFormTip").hide();
    var check=document.getElementById("checkTerm");
    if(!check.checked){
        $("#checkUseTerm").fadeIn();
        return false;
    }
    else{
        if (!(flag_email && flag_pwd && flag_cpwd)){
            $("#checkFormTip").fadeIn();
            return false;
        }
        else{
            return true;
        }
    }
}

