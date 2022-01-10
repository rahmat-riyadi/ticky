import 'package:flutter/material.dart';
import 'package:ticky_app/utils/color.dart';

Widget userMenu(IconData i, Color c){
  return Container(
    margin: EdgeInsets.only(right: 12),
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      color: MyColor.primaryColor,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          spreadRadius: 1,
          offset: Offset(0,0),
          color: Colors.black.withOpacity(0.4)
        )
      ]
    ),
    child: Center(
      child: Icon(i, color: c),
    ),
  );
}