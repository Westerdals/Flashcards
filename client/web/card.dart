class Card {
  final String keyword;
  final String description;

  Card(this.keyword, this.description);

  String toString() {
    return 'Card[keyword=' + keyword + ',description=' + description + ']';
  }
}
