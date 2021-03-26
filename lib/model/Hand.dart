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

String handTypeString(HandType hand) {
  switch(hand) {
    case HandType.block:
      return 'グー';
      break;
    case HandType.scissors:
      return 'チョキ';
      break;
    case HandType.paper:
      return 'パー';
      break;
  }
  return 'なし';
}
