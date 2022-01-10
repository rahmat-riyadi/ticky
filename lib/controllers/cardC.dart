import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ticky_app/utils/card.dart';

class CardController {

  var width, height;

  CardController({this.width, this.height});

  int cardLength = 3;

  List<int> card = List.generate(
    5, (index) => Random().nextInt(11111111) + 12382737
  );

  List<DebitCard> tmp = [
  ];

  addCard(var height, var width, var cardNum, var type){
    cardLength++;
    tmp.add(DebitCard(height: height, width: width, cardNumber: cardNum, type: type));
  }

  generateCardInfo(var height, var width){
    for(int i = 0; i < cardLength; i++){
      tmp.add(DebitCard(height: height, width: width, cardNumber: i, type: 'BNI'));
    }
  }

  List<Widget> buildCard() {

    List<Widget> c = [];

    tmp.forEach((e) {
      c.add(e.card());
    });

    return  c;
  }

}