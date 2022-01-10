import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class DebitCard  {

  DebitCard({this.width, this.height, this.cardNumber, this.colorGenerator, this.type});

  double? width, height;
  var cardNumber, colorGenerator, type;

  Widget BNI() => Container(
    padding: EdgeInsetsDirectional.all(10),
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [
          Color(0xFF242321),
          Color(0xFF69655d)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      )
    ),
    child: Column(
      children: [
        Container(
          width: 20,
          height: 25 ,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color((math.Random().nextDouble() * 0xFFFFFF).toInt()),
                Color(0xFFe3e3e3),
                Color(0xFFa1a1a1),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.5, 0.7]
            ),
            borderRadius: BorderRadius.circular(5)
          ),
        )
      ],
    ),
  );

  Widget card() => Container(
    padding: EdgeInsetsDirectional.all(10),
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [
          Color(0xFF69655d),
          Color((math.Random().nextDouble() * 0xFFFFFF).toInt()),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
      )
    ),
    child: Column(
      children: [
        Container(
          width: 20,
          height: 25 ,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFa1a1a1),
                Color(0xFFe3e3e3),
                Color(0xFFa1a1a1),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 0.5, 0.7]
            ),
            borderRadius: BorderRadius.circular(5)
          ),
        )
      ],
    ),
  );

}