var app = angular.module('UEval',[]);

var path;

app.factory('notificationInfo', ['$http', function($http) {

    path = window.location+".json";

    return $http.get( path )
        .success(function(data) {
            return data;
        })
        .error(function(err) {
            return err;
        });
}]);



app.controller('MainController', ['$scope', 'notificationInfo', function($scope, notificationInfo) {

    notificationInfo.success(function(data){
        $scope.notification = data;
    });

}]);

