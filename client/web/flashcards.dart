import 'dart:html';
import 'dart:convert';

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

  Main() {
    HttpRequest.getString('http://cadence.singles:28080/server-1.0-SNAPSHOT/cards').then(_decodeAndStart);
  }

  void _decodeAndStart(final String json) {
    JSON.decode(json).forEach((c) => _cards.add(new Card(c['keyword'], c['description'])));
    showMainMenu();
  }

  void showMainMenu() {
    _start(_cards);
  }

  void _start(final List<Card> cards) {
    _loadUI();
  }

  void _loadUI() {
    _nextCard();

    flashcardDiv.onClick.listen(onFlashcardClicked);
    noButton.onClick.listen((event) => _nextCard());
    yesButton.onClick.listen((event) {
      points++;
      _nextCard();
    });
  }

  void onFlashcardClicked(final MouseEvent event) {
    // Only accept clicks when the card is showing the keyword.
    if (backDivs.style.display == "none") {
      _showDescription();
    }
  }

  void _nextCard() {
    renderPoints();

    _currentCardNumber++;
    _currentCardNumber %= _cards.length;

    renderCardNumber();

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

  void renderPoints() {
    pointsParagraph.text = "$points / ${_cards.length} points";
  }

  void renderCardNumber() {
    cardNumberParagraph.text = "Card $_currentCardNumber / ${_cards.length}";
  }
}
