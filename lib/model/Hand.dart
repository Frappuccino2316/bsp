import 'dart:math' as math;

enum Handtype {
  block,
  scissors,
  paper,
}

int HandTypeValue(Handtype hand) {
  // グーは0, チョキは1, パーは2を返す
  switch(hand) {
    case Handtype.block:
      return 0;
    case Handtype.scissors:
      return 1;
    case Handtype.paper:
      return 2;
  }
}

class Hand {
  Handtype hand = Handtype.block;

  int getHandValue() {
    return HandTypeValue(hand);
  }

  void changeHand(Handtype newHand) {
    this.hand = newHand;
  }

  void changeHandRandom() {
    var random = new math.Random();
    int randomHand = random.nextInt(3);
    var handList = [Handtype.block, Handtype.scissors, Handtype.paper];
    this.hand = handList[randomHand];
  }
}

String buttleJanken(int handOne, int handTwo) {
  int result = handOne - handTwo;
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
