import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/utils/color.dart';

class GeneralSetting extends StatelessWidget {
  const GeneralSetting({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: FaIcon(FontAwesomeIcons.slidersH, color: MyColor.textColor, size: 30),
                    ),
                    Text(
                      'pengaturan umum', style: TextStyle(
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
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Notifikasi', style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              ),
              trailing: Switch(
                value: true,
                onChanged: (value){}
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                'peringatan pembelian', style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              ),  
              trailing: Text(
                '2x sebulan', style: TextStyle(
                  fontSize: 11
                ),
              ),
              subtitle: Text(
                'menghindari pembelian yang berlebihan', style: TextStyle(
                  fontSize: 10.5
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Hapus Riwayat Pembelian',style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}