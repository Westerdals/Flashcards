import 'dart:html';

final DivElement flashcardElement = querySelector('#flashcard');
final ParagraphElement flashcardTextElement = querySelector('#flashcardText');

void main() {
  querySelector('#flashcardText')
    ..text = 'Click me several times!'
    ..onClick.listen(reverseText);
}

int counter = 0;

void reverseText(MouseEvent event) {
  flashcardTextElement.text = counter++ % 2 == 0 ? "Rebecca!" : "Martin";
}
