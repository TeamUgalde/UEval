var app = angular.module('UEval',[]);

var path;

app.factory('schoolInfo', ['$http', function($http) {

    path = window.location+".json";

    return $http.get( path )
        .success(function(data) {
            return data;
        })
        .error(function(err) {
            return err;
        });
}]);



app.controller('MainController', ['$scope', 'schoolInfo', function($scope, schoolInfo) {

    schoolInfo.success(function(data){
        $scope.schools = data;
    });

}]);

