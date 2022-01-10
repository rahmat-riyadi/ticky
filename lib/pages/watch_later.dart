import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ticky_app/utils/bgGradient.dart';
import 'package:ticky_app/utils/color.dart';

class WatchLaterPage extends StatelessWidget {
  const WatchLaterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: myGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios_new_rounded),
           title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.health_and_safety, size: 20, color: Color(0xFFB20B70)),
              ),
              Text(
                'Tonton Nanti', style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFB20B70)
                ),
              )
            ],
          ),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (ctx, i) => Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height * 0.1,
              margin: EdgeInsets.only(bottom: 20),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  'assets/images/poster1.jpg',
                ),
                title: Text(
                  'Avengers: Infinity Wars', style: TextStyle(
                    fontSize: 14, color: MyColor.textColor
                  ),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColor.textColor, width: 1),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(
                        'animasi', style: TextStyle(
                          color: MyColor.textColor, fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}