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
            Text(handTypeString(_playerHand)),
            Text(battleJanken()),
            Text(handTypeString(_enemyHand)),
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
