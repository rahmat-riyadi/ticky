import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/utils/bgGradient.dart';
import 'package:ticky_app/utils/color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          BgGradient(),
          Align(
            alignment: Alignment(0, -0.6),
            child: Text(
              "Tikcy",
              style: TextStyle(color: MyColor.secondaryColor, fontSize: 42, fontWeight: FontWeight.w500 )
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              // color: Colors.red.withOpacity(0.2),
              height: height * 0.6,
              width: width * 0.8,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.16))),
                      hintText: "nama pengguna",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.16)),
                      prefixIcon: Icon(Icons.person, color: Colors.white.withOpacity(0.16),)
                    ),
                  ),
                  SizedBox(height: 60,),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.16))),
                      hintText: "kata sandi",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.16)),
                      prefixIcon: Icon(Icons.lock, color: Colors.white.withOpacity(0.16),)
                    ),
                  ),
                  SizedBox(height: 55),
                  Row(
                    children: [
                      FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        ),
                        textColor: MyColor.textColor,
                        color: MyColor.secondaryColor,
                        onPressed: () => {
                          Navigator.pushNamed(context, '/index')
                        }, 
                        child: Center(
                          child: Text("masuk", style: TextStyle(fontSize: 17))
                        )
                      ),
                      FlatButton(
                        textColor: MyColor.secondaryColor,
                        onPressed: () =>{},
                        child: Center(
                          child: Text("daftar", style: TextStyle(fontSize: 17))
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 55),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.35,
                        height: 2,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle
                        ),
                      ),
                      Container(
                        width: width * 0.35,
                        height: 2,
                        color: Colors.white.withOpacity(0.3),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => print('google clicked'),
                        icon: FaIcon(FontAwesomeIcons.google, color: Colors.blue, size: 30),
                      ),
                      SizedBox(width: 30),
                      IconButton(
                        onPressed: () => print('facebook clicked'),
                        icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 30),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}