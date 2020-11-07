import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

// Justin Bashara
// This project allows a user to press a button 
// and a random card for a deck is displayed.

final title = 'Card Hand';

enum Suits { hearts, diamonds, clubs, spades }
enum Values {
  Ace,
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Eight,
  Nine,
  Ten,
  Jack,
  Queen,
  King
}

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotifyingHand>(
            create: (context) => NotifyingHand()),
        Provider<Deck>(create: (context) => Deck()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Card Hand'),
          ),
          body: Center(
              child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Consumer<NotifyingHand>(
                    builder: (context, notifyingHand, child) {
                  var deck = Provider.of<Deck>(context);
                  var hand = Provider.of<NotifyingHand>(context);
                  return RaisedButton(
                    child: Text('Draw a card.'),
                    onPressed: () {
                      PlayingCard card = deck.drawCard();
                      if (card != null) hand.add(card);
                    },
                  );
                }),
              ),
              Expanded(
                flex: 3,
                child: PlayingCardList(),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class PlayingCard {
  String suit, value;
  PlayingCard({this.suit, this.value});
}

// ignore: must_be_immutable
class Deck {
  final List<PlayingCard> deck = new List<PlayingCard>();
  final List<Suits> suitList = Suits.values;
  final List<Values> valueList = Values.values;
  PlayingCard card;

  Deck() {
    for (var suit in Suits.values) {
      for (var value in Values.values) {
        deck.add(PlayingCard(suit: suit.toString(), value: value.toString()));
      }
    }
  }

  PlayingCard drawCard() {
    if (deck.length != 0) {
      deck.shuffle();
      card = deck.first;
      deck.remove(deck.first);
    }
    return card;
  }
}

class NotifyingHand with ChangeNotifier {
  List<PlayingCard> _cards = new List<PlayingCard>();

  NotifyingHand() {
    _cards = List<PlayingCard>();
  }

  void add(PlayingCard card) {
    _cards.add(card);
    notifyListeners();
  }

  List<PlayingCard> get cards => _cards;
}

// ignore: must_be_immutable
class PlayingCardCard extends StatelessWidget {
  PlayingCard card;
  String cardValue;

  PlayingCardCard(PlayingCard card) {
    this.card = card;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 88,
      width: 62,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                child: Image.asset(
                    "assets/${card.suit.toString().split(".").last}.png")),
            Text(card.value.toString().split(".").last),
          ],
        ),
      ),
    ));
  }
}

// ignore: must_be_immutable
class PlayingCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotifyingHand>(
      builder: (context, hand, child) {
        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            for (var card in hand.cards) PlayingCardCard(card),
          ],
        );
      },
    );
  }
}
