import 'dart:math' as math;
import 'package:bsp/model/Hand.dart';
import 'package:flutter/material.dart';
import '../model/Hand.dart';

class HandScreen extends StatefulWidget {
  @override
  _HandScreenState createState() => _HandScreenState();
}

class _HandScreenState extends State<HandScreen> {
  HandType _playerHand;
  HandType _enemyHand;
  List<HandType> handList = [HandType.block, HandType.scissors, HandType.paper];
  
  _HandScreenState() {
    _playerHand = HandType.block;
    _enemyHand = HandType.block;
  }

  void _changeEnemyHandRandom() {
    math.Random random = new math.Random();
    int randomInt = random.nextInt(3);
    setState(() {
      _enemyHand = handList[randomInt];
    });
  }

  void _changePlayerHand(HandType newHand) {
    setState(() {
      _playerHand = newHand;
    });
  }

  String battleJanken() {
  int result = handTypeValue(_playerHand) - handTypeValue(_enemyHand);
  switch(result) {
    case 0:
      return 'あいこ';
    case -1:
    case 2:
      return '勝ち';
    case -2:
    case 1:
      return '負け';
    default:
      return '';
  }
}

String handTypeImagePath(HandType hand) {
  switch(hand) {
    case HandType.block:
      return 'images/block.png';
    case HandType.scissors:
      return 'images/scissors.png';
    case HandType.paper:
      return 'images/paper.png';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Enemy', style: TextStyle(fontSize: 26.0)),
                  ),
                  Image.asset(handTypeImagePath(_enemyHand), height: 100),
                  Text(handTypeString(_enemyHand)),
                ]
              ),
            ),
            Text(battleJanken(), style: TextStyle(color: Colors.blue, fontSize: 35.0)),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Image.asset(handTypeImagePath(_playerHand), height: 100),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Enemy', style: TextStyle(fontSize: 26.0)),
                  ),
                  Text(handTypeString(_playerHand)),
                ]
              ),
            ),
            // Text(handTypeString(_playerHand)),
            // Text('Player', style: TextStyle(fontSize: 26.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _changeEnemyHandRandom();
                      _changePlayerHand(HandType.block);
                    },
                    child: Text(handTypeString(HandType.block))
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _changeEnemyHandRandom();
                      _changePlayerHand(HandType.scissors);
                    },
                    child: Text(handTypeString(HandType.scissors))
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _changeEnemyHandRandom();
                      _changePlayerHand(HandType.paper);
                    },
                    child: Text(handTypeString(HandType.paper))
                  ),
                ),
              ]
            ),
          ]
        )
      ),
    );
  }
}
