import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/models/buyer.dart';
import 'package:ticky_app/utils/card.dart';
import 'package:ticky_app/utils/color.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var buyerC = args['buyer'];
    var movie = args['movie'];
    Buyer buyer = Buyer();

    return Container(
      decoration: BoxDecoration(
        // gradient: myGradient
        color: MyColor.primaryColor
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded)
          ),
          title: Text('Ticky'),
          centerTitle: true,
        ),
        body: Container(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
                width: width * 0.8,
                height: height * 0.45,
                decoration: BoxDecoration(
                  color: MyColor.thirdColor,
                  borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20), topEnd: Radius.circular(20))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Bayar', style: TextStyle(
                            color: MyColor.textColor
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Rp. ' + movie['harga'].toString(), style: TextStyle(
                              color: MyColor.secondaryColor, fontSize: 21
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        movie['judulFilm'].toString(), style: TextStyle(
                          color: MyColor.textColor
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.clock, color: MyColor.textColor, size: 20,),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            movie['jam'].toString(), style: TextStyle(
                              color: MyColor.textColor
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.calendarAlt, color: MyColor.textColor, size: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Rabu ' + movie['tanggal'].toString() + ' - 08 - 2021', style: TextStyle(
                              color: MyColor.textColor
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.ticketAlt, color: MyColor.textColor, size: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            '${movie["jumlah"]} ticket', style: TextStyle(
                              color: MyColor.textColor
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: RaisedButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: MyColor.primaryColor,
                            title: Text(
                              'konfirmasi', style: TextStyle(
                                color: MyColor.secondaryColor
                              )
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            content: Text(
                              'ingin beli tiket ? ', style: TextStyle(
                                color: MyColor.textColor
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'cancel', style: TextStyle(
                                    color: MyColor.textColor
                                  ),
                                )
                              ),
                              FlatButton(
                                color: MyColor.secondaryColor,
                                onPressed: () {

                                    Navigator.pop(context);

                                    showDialog(
                                    context: context,
                                    builder: (context) =>  AlertDialog(
                                        backgroundColor: MyColor.primaryColor,
                                        content: Row(
                                          children: [
                                          Icon(
                                            Icons.done_rounded,
                                            color: Colors.green,
                                            size: 28,
                                            ),
                                          Text(
                                            'pembelian berhasil', style: TextStyle(
                                              color: MyColor.textColor
                                            ) 
                                          )
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              '/index',
                                              (route) => false,
                                              arguments: movie
                                            );
                                          },
                                          color: MyColor.secondaryColor,
                                          child: Text(
                                            'ok', style: TextStyle(
                                              color: MyColor.textColor, fontSize: 21
                                            ),
                                          ) 
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  'beli', style: TextStyle(
                                    color: MyColor.textColor
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        child: Text(
                          'bayar tiket', style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                        color: MyColor.secondaryColor,
                        textColor: MyColor.textColor,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Container(
                  width: width,
                  height: height * 0.35,
                  // color: Colors.red.withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Transform.rotate(
                        angle: pi * 45,
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.double_arrow_rounded, color: MyColor.textColor.withOpacity(0.5)),
                        ),
                      ),
                      Container(
                        width: width * 0.5,
                        height: height,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: height,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            autoPlay: false
                          ),
                          items: [
                            DebitCard(width: width, height: height, cardNumber: '09909').BNI(),
                            DebitCard(width: width, height: height, cardNumber: '09909').BNI(),
                            DebitCard(width: width, height: height, cardNumber: '09909').BNI(),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.double_arrow_rounded, color: MyColor.textColor.withOpacity(0.5)),
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}