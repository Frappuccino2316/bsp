import 'package:bsp/model/Hand.dart';
import 'package:flutter/material.dart';
import '../model/Hand.dart';

class HandScreen extends StatefulWidget {
  @override
  _HandScreenState createState() => _HandScreenState();
}

class _HandScreenState extends State<HandScreen> {
  Hand _player = Hand();
  Hand _enemy = Hand();
  // var _palyerHand = _player.hand;

  void _changeEnemyHandRandom() {
    _enemy.changeHandRandom();
  }

  void _changePlayerHand(HandType newHand) {
    _player.changeHand(newHand);
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
            Text(_player.hand.toString()),
            Text(_enemy.hand.toString()),
            TextButton(
              onPressed: () {
                _changeEnemyHandRandom();
                print(_enemy.hand.toString());
              },
              child: Text('ぽん'),
            )
          ]
        )
      ),
    );
  }
}
