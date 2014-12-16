var flashcardsApp = angular.module('flashcardsApp', [
    'ngRoute',
    'flashcardsControllers'
]);

flashcardsApp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider
            .when('/flashcards', {
                templateUrl: 'partials/hurrdurr.html',
                controller: 'CardsAdminController'
            })
            .otherwise({
                templateUrl: 'partials/not_found.html',
                controller: 'NotFoundController'
            });
    }]);
