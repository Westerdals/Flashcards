var flashcardsApp = angular.module('flashcardsApp', [
    'ngRoute',
    'flashcardsControllers'
]);

flashcardsApp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider
            .when('/flashcards', {
                templateUrl: 'partials/manage_flashcards.html',
                controller: 'CardsAdminController'
            })
            .otherwise({
                templateUrl: 'partials/not_found.html',
                controller: 'NotFoundController'
            });
    }]);
