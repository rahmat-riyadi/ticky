import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticky_app/utils/color.dart';

List<Color> categoryColor = [
  Color(0xFF288187),
  Color(0xFFB20B70),
  Color(0xFFC08C06),
  Color(0xFFAF1F0B),
  Color(0xFF2F930C),
];

List<String> categoryList = ['adventure', 'aksi', 'komedi', 'horor', 'keluarga'];

class Categori extends StatelessWidget {

  Categori(this.index);

  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
      decoration: BoxDecoration(
        color: MyColor.primaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ]
      ),
      child: Center(
        child: Text(
          categoryList[this.index % 5],
          style: TextStyle(
            color: categoryColor[this.index % 5]
          ),
        ),
      ),
    );
  }

}
