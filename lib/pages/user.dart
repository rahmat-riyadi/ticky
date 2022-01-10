import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/pages/add_card.dart';
import 'package:ticky_app/pages/history_page.dart';
import 'package:ticky_app/pages/user_profil.dart';
import 'package:ticky_app/pages/watch_later.dart';
import 'package:ticky_app/utils/color.dart';
import 'package:ticky_app/utils/user_menu.dart';

import 'general_setting.dart';

class UserPage extends StatelessWidget {

  var userCard;

  UserPage(this.userCard);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Ticky'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 30),
              width: width,
              height: height * 0.15,
              decoration: BoxDecoration(
                color: MyColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0,0),
                    color: Colors.black.withOpacity(0.5),
                  )
                ]
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/photo.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Rahmat Riyadi Syam',
                              style: TextStyle(
                                color: MyColor.textColor
                              ),
                            ),
                          ),
                          Text(
                            'rahmatriyadi1711@gmail.com',
                            style: TextStyle(
                              color: MyColor.textColor.withOpacity(0.4),
                              fontSize: 10,
                              fontWeight: FontWeight.w100
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColor.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0,0),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]
                    ),
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilePage())),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      tileColor: MyColor.primaryColor,
                      leading: FaIcon(FontAwesomeIcons.slidersH, color: MyColor.textColor, size: 25),
                      title: Text(
                        'Profil Umum', style: TextStyle(
                          color: MyColor.textColor
                        ),
                      ),
                      subtitle: Text(
                        'Informasi pengguna', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: MyColor.textColor.withOpacity(0.8)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColor.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0,0),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]
                    ),
                    child: ListTile(
                      onTap: () => Navigator.push(context,MaterialPageRoute(
                          builder: (context) => AddCard(),
                          settings: RouteSettings(
                            arguments: userCard
                          )
                        ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      tileColor: MyColor.primaryColor,
                      leading: Icon(Icons.credit_card_rounded, size: 30, color: MyColor.textColor,),
                      title: Text(
                        'Tambah Kartu Debit', style: TextStyle(
                          color: MyColor.textColor
                        ),
                      ),
                      subtitle: Text(
                        'tambah kartu agar memudahkan transaksi', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: MyColor.textColor.withOpacity(0.8)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColor.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0,0),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      tileColor: MyColor.primaryColor,
                      leading: Icon(Icons.info_outline_rounded, size: 30, color: MyColor.textColor,),
                      title: Text(
                        'Pengaturan Umum', style: TextStyle(
                          color: MyColor.textColor
                        ),
                      ),
                      subtitle: Text(
                        'Notifikasi & menajemen pembelian', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: MyColor.textColor.withOpacity(0.8)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}