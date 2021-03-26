import 'dart:math' as math;

enum HandType {
  block,
  scissors,
  paper,
}

int handTypeValue(HandType hand) {
  // グーは0, チョキは1, パーは2を返す
  switch(hand) {
    case HandType.block:
      return 0;
      break;
    case HandType.scissors:
      return 1;
      break;
    case HandType.paper:
      return 2;
      break;
  }
  return 10;
}

// String handType

class Hand {
  HandType hand = HandType.block;



  int getHandValue() {
    return handTypeValue(hand);
  }

  void changeHand(HandType newHand) {
    this.hand = newHand;
  }

  void changeHandRandom() {
    var random = new math.Random();
    int randomHand = random.nextInt(3);
    var handList = [HandType.block, HandType.scissors, HandType.paper];
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
