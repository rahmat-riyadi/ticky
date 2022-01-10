import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticky_app/utils/color.dart';

class TicketPage extends StatefulWidget {

  var data;

  TicketPage(this.data);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    
    return Container(
        margin: EdgeInsets.only(top: height * 0.1),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Ticky',
                  style: TextStyle(
                    fontSize: 18,
                    color: MyColor.textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                widget.data['judulFilm'].toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: MyColor.textColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 60),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 26,
                        spreadRadius: 5,
                        color: MyColor.textColor.withOpacity(0.58),
                        offset: Offset(0,0)
                      )
                    ]
                  ),
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: GestureDetector(
                    onDoubleTap: (){
                      print('refresh');
                      setState(() {
                        
                      });
                    },
                    child: QrImage(
                      data: 'testing',
                      version: QrVersions.auto,
                      size: height * 0.2,
                      backgroundColor: Colors.white,
                      foregroundColor: MyColor.primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Transform.rotate(
                  angle: pi / 2,
                  child: FaIcon(
                    FontAwesomeIcons.ticketAlt,
                    color: MyColor.secondaryColor,
                    size: 100,
                  ),
                ),
              ),
              Text(
                widget.data['jumlah'].toString() + ' tiket',
                style: TextStyle(
                  fontSize: 50,
                  color: MyColor.secondaryColor
                ),
              )
            ],
          )
    );
  }
}