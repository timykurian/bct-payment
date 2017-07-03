
/**
 * Main AngularJS Web Application
 */
var app = angular.module('bctPayAdmin', [
  'ngRoute'
]);

var merchantPaymentList = [];
var totalOrderCount = 0 ;
var totalRecurringOrderCount = 0 ;
var totalRefunds = 0;
var totalStoppedRecurring = 0;
var orderDetails = {};

/**
 * Configure the Routes
 */
app.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    // Home
    .when("/", {templateUrl: "partials/dashboard.html", controller: "adminCtrl"})
    // Pages
      .when("/refund-transaction", {templateUrl: "partials/refund-transaction.html", controller: "adminCtrl"})
      .when("/transaction-details", {templateUrl: "partials/transaction-details.html", controller: "adminCtrl"})
      .when("/stop-recurring", {templateUrl: "partials/stop-recurring.html", controller: "adminCtrl"})
      .when("/blank", {templateUrl: "partials/blank.html", controller: "adminCtrl"})
    // else 404
    .otherwise("/404", {templateUrl: "partials/404.html", controller: "adminCtrl"});
}]);



app.factory('adminService', ['$http', function($http) {

    var searchMerchantSummaryFun = function() {
        console.log("searchMerchantSummaryFun Called");
        return $http({
            method : 'GET',
            url :'admin/merchant/0'
        }).then(function successCallback(response) {
            return response.data ;
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };

    return {
        searchMerchantSummary : searchMerchantSummaryFun
    };


}]);


/**
 * Controls all other Pages
 */

app.controller('adminCtrl', ['$rootScope','$scope','$http','adminService', function($rootScope,$scope,$http,adminService) {

    $scope.orderNo = "" ;
    $scope.orderDetails = "";
    $scope.errorMsg = "" ;



    $scope.searchMerchantDetails = function () {
        var reqUrl = 'admin/merchant/0' ;
        return $http({
            method : 'GET',
            url :reqUrl
        }).then(function successCallback(response) {
            console.log(response);
            $rootScope.merchantPaymentList  =  JSON.parse(response.data.merchantDetails);
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };


    $scope.searchOrderDetails = function () {
        console.log($scope.orderNo);
        var reqUrl = 'admin/merchant/0/paymentDetails/'+ $scope.orderNo ;
        console.log(reqUrl);
        return $http({
            method : 'GET',
            url :reqUrl
        }).then(function successCallback(response) {
            console.log(response);
            console.log(response.data.merchantDetails);
          if(response.data != null){
              $scope.orderDetails = JSON.parse(response.data.merchantDetails);
              if (response.data.errorMsg == "") {
                  $scope.orderDetails = JSON.parse(response.data.merchantDetails);
              } else {
                  $scope.errorMsg = response.data.errorMsg;
              }
           }
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };

    $scope.refundTransaction = function () {
        console.log($scope.orderNo);
        var reqUrl = 'admin/merchant/0/refund/'+ $scope.orderNo ;
        console.log(reqUrl);
        return $http({
            method : 'GET',
            url :reqUrl
        }).then(function successCallback(response) {
            if(response.data != null){
                if(response.data.errorMsg == ""){
                    $scope.orderDetails  = JSON.parse(response.data.merchantDetails);
                }else {
                    $scope.errorMsg = response.data.errorMsg ;
                }
            }
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };


    $scope.getDashboardData = function () {
        console.log("int called");
        var reqUrl = 'admin/merchant/0/dashboard/summary' ;
        return $http({
            method : 'GET',
            url :reqUrl
        }).then(function successCallback(response) {
            console.log(response);
            $rootScope.totalOrderCount = response.data.totalOrderCount;
            $rootScope.totalRecurringOrderCount = response.data.totalRecurringOrderCount;
            $rootScope.totalRefunds = response.data.totalRefunds;
            $rootScope.totalStoppedRecurring = response.data.totalStoppedRecurring;
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };



    $scope.searchSubsriptions = function () {
        var reqUrl = 'admin/merchant/0/dashboard/subscriptions' ;
        return $http({
            method : 'GET',
            url :reqUrl
        }).then(function successCallback(response) {
            console.log(response);
            $rootScope.merchantPaymentList  =  JSON.parse(response.data.subscriptions);
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };

    $scope.searchRefunds = function () {
        var reqUrl = 'admin/merchant/0/dashboard/refunds';
        return $http({
            method: 'GET',
            url: reqUrl
        }).then(function successCallback(response) {
            console.log(response);
            $rootScope.merchantPaymentList = JSON.parse(response.data.subscriptions);
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };

    $scope.stopRecurring = function () {
        var reqUrl = 'admin/merchant/0/stopRecurring/' + $scope.orderNo;
        return $http({
            method: 'GET',
            url: reqUrl
        }).then(function successCallback(response) {
            if (response.data != null) {
                if (response.data.errorMsg == "") {
                    $scope.orderDetails = JSON.parse(response.data.orderDetails);
                } else {
                    $scope.errorMsg = response.data.errorMsg;
                }
            }
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    };

    $scope.searchStoppedRecurring = function () {
        var reqUrl = 'admin/merchant/0/dashboard/recurringStoppedTransactions';
        return $http({
            method: 'GET',
            url: reqUrl
        }).then(function successCallback(response) {
            console.log(response);
            $rootScope.merchantPaymentList = JSON.parse(response.data.recurringStoppedTransactions);
        }, function errorCallback(response) {
            console.log(response.statusText);
        });
    }



}]);
