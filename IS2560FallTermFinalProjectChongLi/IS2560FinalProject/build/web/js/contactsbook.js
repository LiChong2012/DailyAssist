/**
 * Created with JetBrains WebStorm.
 * User: VigossZ
 * Date: 12-11-4
 * Time: 上午1:37
 * To change this template use File | Settings | File Templates.
 */

var i = 0

function ContactsCtrl($scope) {
    
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
            
            var len = jsonRes.userObject[thisId].contacts.contact.length;
            var contactObj = new Array();
            contactObj = jsonRes.userObject[thisId].contacts.contact; 
            
            
            var count = 0;
            $scope.contacts = [];
            
            for(count = 0; count < len; count++){
                $scope.contacts.push({
                    "id" : contactObj[count].id,
                    "name" : contactObj[count].name,
                    "email": contactObj[count].email,
                    "phone": contactObj[count].phone,
                    "address": contactObj[count].address,
                    "group": contactObj[count].group,
                    "img": contactObj[count].img
                });
                i++;
            }
            
            $scope.addNewContact = function(){
                var newName = document.getElementById("name").value;
                var newEmail = document.getElementById("email").value;
                var newPhone = document.getElementById("phone").value;
                var newAddress = document.getElementById("address").value;
                var newGroup = document.getElementById("group").value;
                var newImg = document.getElementById("picture").value;
                var newId = i;
                i++;
                
                var newContactJSON = {
                    "id": newId,
                    "name": newName,
                    "email": newEmail,
                    "phone": newPhone,
                    "address": newAddress,
                    "group": newGroup,
                    "img": newImg
                }
                
                $scope.contacts.push(newContactJSON);
                
                var newContactJSONSer = {
                    "id": newId,
                    "name": newName,
                    "email": newEmail,
                    "phone": newPhone,
                    "address": newAddress,
                    "group": newGroup,
                    "img": newImg,
                    "user": jsonRes.userObject[thisId].email
                }
  
                $.post("ContactsbookServlet", newContactJSONSer);
            }
        }
    });
}



function deleteContact(contact){
    var thisUser = document.getElementById("sessionUser").innerHTML;
    var checkname = $(contact).attr("check");
    $.post("ContactsbookDelete", {
        "check": checkname,
        "user":thisUser
    });
}

var theUser;

function editContact(editCon){
    theUser = $(editCon).attr("check");
}

function submitEdit(){
    var newId = i;
    var editName = document.getElementById("name2").value;
    var editEmail = document.getElementById("email2").value;
    var editPhone = document.getElementById("phone2").value;
    var editAddress = document.getElementById("address2").value;
    var editGroup = document.getElementById("group2").value;
    var editImg = document.getElementById("picture2").value;
    i++;
    
    var editContactJSON = {
        "person": theUser,
        "id": newId,
        "name": editName,
        "email": editEmail,
        "phone": editPhone,
        "address": editAddress,
        "group": editGroup,
        "img": editImg,
        "user": document.getElementById("sessionUser").innerHTML
    }
    $.post("ContactsbookModify", editContactJSON);
}
