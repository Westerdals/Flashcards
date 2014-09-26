import 'dart:html';
import 'dart:convert';
import 'dart:async';

import 'card.dart';

void main() {
  new Main();
}

class Main {
  static final List<Card> _cards = [];

  static final String keywordInstructions = "Try to remember what the keyword means. Turn it around by tapping it.";
  static final String descriptionInstructions = "Tap again to go to the next card.";

  final DivElement flashcardDiv = querySelector('.flashcard');
  final ElementList frontDivs = querySelectorAll('.front');
  final ElementList backDivs = querySelectorAll('.back');
  final ParagraphElement keywordParagraph = querySelector('.keyword');
  final ParagraphElement descriptionParagraph = querySelector('.description');
  final ParagraphElement instructionsParagraph = querySelector('.instructions p');
  final ParagraphElement pointsParagraph = querySelector('.points');
  final ParagraphElement cardNumberParagraph = querySelector('.cardNumber');
  final ParagraphElement timeParagraph = querySelector('.time');
  final ButtonElement noButton = querySelector('.no');
  final ButtonElement yesButton = querySelector('.yes');

  // Will be incremented automatically.
  int _currentCardNumber = -1;
  bool _showingKeyword;

  int points = 0;
  int secondsPassed = 0;

  Main() {
    HttpRequest.getString('http://cadence.singles:28080/server-1.0-SNAPSHOT/cards').then(_decodeAndStart);
  }

  void _decodeAndStart(final String json) {
    JSON.decode(json).forEach((c) {
      final Card card = new Card(c['keyword'], c['description']);
      _cards.add(card);
    });

    showMainMenu();
  }

  void showMainMenu() {
    _start(_cards);
  }

  void _start(final List<Card> cards) {
    new Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsPassed++;
      _renderTime();
    });

    _loadUI();
  }

  void _loadUI() {
    _nextCard();
    _renderTime();

    flashcardDiv.onClick.listen(_onFlashcardClicked);
    noButton.onClick.listen((event) => _nextCard());
    yesButton.onClick.listen((event) {
      points++;
      _nextCard();
    });
  }

  void _onFlashcardClicked(final MouseEvent event) {
    // Only accept clicks when the card is showing the keyword.
    if (backDivs.style.display == "none") {
      _showDescription();
    }
  }

  void _nextCard() {
    _renderPoints();

    _currentCardNumber++;
    _currentCardNumber %= _cards.length;

    _renderCardNumber();

    final Card card = _cards[_currentCardNumber];

    frontDivs.style.display = "inline";
    backDivs.style.display = "none";

    keywordParagraph.text = card.keyword;
    descriptionParagraph.text = card.description;
    instructionsParagraph.text = keywordInstructions;
  }

  void _showDescription() {
    frontDivs.style.display = "none";
    backDivs.style.display = "inline";

    instructionsParagraph.text = descriptionInstructions;
  }

  void _renderPoints() {
    pointsParagraph.text = "$points / ${_cards.length} points";
  }

  void _renderCardNumber() {
    cardNumberParagraph.text = "Card ${_currentCardNumber + 1} / ${_cards.length}";
  }

  void _renderTime() {
    final int secondsInMinute = 60;
    final int currentMinutes = secondsPassed ~/ Duration.SECONDS_PER_MINUTE;
    final int currentSeconds = secondsPassed % Duration.SECONDS_PER_MINUTE;

    final String minutesText = "${(currentMinutes < 10) ? "0" : ""}$currentMinutes";
    final String secondsText = "${(currentSeconds < 10) ? "0" : ""}$currentSeconds";

    timeParagraph.text = "Time: $minutesText:$secondsText";
  }
}
