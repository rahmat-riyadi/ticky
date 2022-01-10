import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/bloc/card_bloc/card_bloc.dart';
import 'package:ticky_app/controllers/cardC.dart';
import 'package:ticky_app/utils/card.dart';
import 'package:ticky_app/utils/color.dart';

class AddCard extends StatelessWidget {
  const AddCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController cardNum = TextEditingController();
    TextEditingController cardType = TextEditingController();
    TextEditingController deleteCard = TextEditingController();
    var c = ModalRoute.of(context)!.settings.arguments as CardController;
    CarouselController s = CarouselController();

    return BlocProvider(
      create: (context) => CardBloc(),
      child: BlocBuilder<CardBloc, CardState>(
        builder: (context ,state) {

          state.setData(c.cardLength);

          return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(250),
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
              child: AppBar(
                backgroundColor: MyColor.primaryColor,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
                title: Text(
                  'TICKY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                centerTitle: true,
                flexibleSpace: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Icon(Icons.credit_card_rounded, color: MyColor.textColor, size: 30),
                        ),
                        Text(
                          'tambah kartu debit', style: TextStyle(
                            color: MyColor.textColor,
                            fontSize: 20
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20,) + EdgeInsets.only(top: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kartu Debit Saat Ini', style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Transform.rotate(
                          angle: pi / -1,
                          child: Icon(Icons.double_arrow_rounded, color: MyColor.primaryColor)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: width * 0.4, 
                          child: CarouselSlider(
                            options: CarouselOptions(
                              initialPage: 0,
                               enableInfiniteScroll: false,
                              viewportFraction: 0.8,
                              enlargeCenterPage: true,
                              height: 200,
                            ),
                            items: c.buildCard(),
                          ),
                        ),
                        Icon(Icons.double_arrow_rounded, color: MyColor.primaryColor),
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'nama', style: TextStyle(
                          fontSize: 12,
                          color: MyColor.secondaryTextColor
                        ),
                      ),
                      subtitle: Text(
                        'Rahmat Riyadi Syam', style: TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'jumlah Kartu', style: TextStyle(
                          fontSize: 12,
                          color: MyColor.secondaryTextColor
                        ),
                      ),
                      subtitle: Text(
                        state.data.toString() + ' kartu', style: TextStyle(
                          fontSize: 14,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(1, 0.95),
                  child: FlatButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text( 
                          'masukan nomor kartu kredit', style: TextStyle(fontSize: 13),
                        ),
                        content: TextField(
                          controller: cardNum,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            isCollapsed: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColor.secondaryColor
                              )
                            )
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'cancel', style: TextStyle(
                                color: Colors.black
                              ),
                            )
                          ),
                          FlatButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text( 
                                  'Nama Bank', style: TextStyle(fontSize: 13),
                                ),
                                content: TextField(
                                  controller: cardType,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: 'BNI/BCA/Danamon/ect',
                                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                                    isCollapsed: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColor.secondaryColor
                                      )
                                    )
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text(
                                      'cancel', style: TextStyle(
                                        color: Colors.black
                                      ),
                                    )
                                  ),
                                  FlatButton(
                                    child: Text(
                                      'selanjutnya', style: TextStyle(
                                        color: MyColor.textColor
                                      ),
                                    ),
                                    color: MyColor.secondaryColor,
                                    onPressed: () {
                                      context.read<CardBloc>().add(AddCardPressed());
                                      c.addCard(height, width, cardNum, cardType.value);

                                      Navigator.of(context)..pop()..pop();

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: MyColor.primaryColor,
                                          content: Text(
                                            'kartu berhasil ditambah', style: TextStyle(
                                              color: MyColor.textColor
                                            ),
                                          )
                                        )
                                      );
                                    },
                                  )
                                ],
                              )
                            ),
                            child: Text(
                              'selanjutnya', style: TextStyle(
                                color: MyColor.textColor
                              ),
                            ),
                            color: MyColor.secondaryColor,
                          )
                        ],
                      )
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: MyColor.secondaryColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                            child: FaIcon(FontAwesomeIcons.creditCard, color: MyColor.textColor),
                          ),
                        Text(
                          'tambah', style: TextStyle(fontWeight: FontWeight.bold, color: MyColor.textColor),
                        )
                      ],
                    )
                  ),
                )
              ],
            ),
          ),
        );
        }
      ),
    );
  }
}