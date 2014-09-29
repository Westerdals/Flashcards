import 'dart:html' show HttpRequest;
import 'dart:convert' show JSON;
import 'dart:async' show Future;

import 'card.dart';

class CardRepository {
  static final CardRepository _instance = new CardRepository._internal();

  final List<Card> _cards = [];

  factory CardRepository() {
    return _instance;
  }

  CardRepository._internal() {
  }

  Future loadCards() {
    return HttpRequest.getString('http://cadence.singles:28080/server-1.0-SNAPSHOT/cards').then(_decode);
  }

  void _decode(final String json) {
    JSON.decode(json).forEach((c) {
      final Card card = new Card(c['keyword'], c['description']);
      _cards.add(card);
    });
  }

  List<Card> get cards => _cards;
}
