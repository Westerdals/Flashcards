var flashcardsControllers = angular.module('flashcardsControllers', []);

flashcardsControllers.controller('CardsAdminController', function ($scope, $http) {
    $http.get('/api/flashcards')
        .success(function (cards) {
            $scope.cards = cards;
        })
        .error(function (err) {
            console.log(err);
        });

    $scope.deleteCard = function (card) {
        var certain = confirm('Are you sure?');

        if (!certain) return;

        $http.delete('/api/flashcards/' + card._id)
            .success(function (data, status) {
                // no content; remove card from scope
                if (status === 204) $scope.cards.splice($scope.cards.indexOf(card), 1);
            })
            .error(function (data, status) {
                if (status === 404) console.log('no element with id = ' + card.id);
            });
    };

    $scope.createFlashcard = function (key, value) {
        var flashcard = {key: key, value: value};

        $http.post('/api/flashcards', flashcard)
            .success(function (card) {
                $scope.cards.push(card);
                $scope.key = $scope.value = '';
            });
    }
});

flashcardsControllers.controller('NotFoundController', function($scope) {
    $scope.message = 'Nothing to be found here.';
});
