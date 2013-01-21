/**
 * Created with JetBrains WebStorm.
 * User: VigossZ
 * Date: 12-11-6
 * Time: 下午7:07
 * To change this template use File | Settings | File Templates.
 */

angular.module("Twitter", ["ngResource"]);

function TwitterCtrl($scope, $resource){
    
    $scope.twitter = $resource("http://search.twitter.com/:action",
        {action: "search.json", q:"LiChong2012", callback: "JSON_CALLBACK"},
        {get:{method: "JSONP"}});
    
    $scope.doSearch = function(){
        $scope.twitterResult = $scope.twitter.get({q: $scope.searchTerm});
    }
    
}

