import 'package:flutter/material.dart';

class BgGradient extends StatelessWidget {
  const BgGradient({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF000C2B),Color(0xFF082032)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.3, 0.8]
        )
      ),
    );
  }
}

LinearGradient myGradient =  LinearGradient(
  colors: [Color(0xFF000C2B),Color(0xFF082032)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  stops: [0.3, 0.8]
);