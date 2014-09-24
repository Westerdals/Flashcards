import 'dart:html' show querySelector, DivElement, ParagraphElement, HttpRequest, MouseEvent;
import 'dart:convert' show JSON;

import 'card.dart';

void main() {
  new Main();
}

class Main {
  static final List<Card> _cards = [];

  static final String keywordInstructions = "Try to remember what the keyword means. Turn it around by tapping it.";
  static final String descriptionInstructions = "Tap again to go to the next card.";

  final DivElement flashcardDiv = querySelector('.flashcard');
  final DivElement keywordDiv = querySelector('.front');
  final DivElement descriptionDiv = querySelector('.back');
  final ParagraphElement keywordParagraph = querySelector('#keyword');
  final ParagraphElement descriptionParagraph = querySelector('#description');
  final ParagraphElement instructionsParagraph = querySelector('.instructions');

  // Will be incremented automatically.
  int _currentCardNumber = -1;
  bool _showingKeyword;

  Main() {
    HttpRequest.getString("http://localhost:8080/server-1.0-SNAPSHOT/cards").then(_decodeAndStart);
  }

  void _decodeAndStart(final String json) {
    final Map<Map> cardMap = JSON.decode(json);
    cardMap.forEach((cardAsMap) => _cards.add(new Card(cardAsMap['keyword'], cardAsMap['description'])));

    showMainMenu();
  }

  void showMainMenu() {
    _start(_cards);
  }

  void _start(final List<Card> cards) {
    loadUI();
  }

  void loadUI() {
    nextCard();

    flashcardDiv.onClick.listen(onFlashcardClicked);
  }

  void onFlashcardClicked(final MouseEvent event) {
    if (keywordDiv.style.display == "none") {
      nextCard();
    } else {
      showDescription();
    }
  }

  void nextCard() {
    _currentCardNumber++;
    _currentCardNumber %= _cards.length;

    final Card card = _cards[_currentCardNumber];

    keywordDiv.style.display = "inline";
    descriptionDiv.style.display = "none";

    keywordParagraph.text = card.keyword;
    descriptionParagraph.text = card.description;
    instructionsParagraph.text = keywordInstructions;
  }

  void showDescription() {
    keywordDiv.style.display = "none";
    descriptionDiv.style.display = "inline";

    instructionsParagraph.text = descriptionInstructions;
  }
}
