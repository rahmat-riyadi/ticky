import 'package:flutter/material.dart';
import 'package:ticky_app/utils/bgGradient.dart';
import 'package:ticky_app/utils/color.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: myGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          centerTitle: true,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.history, size: 20, color: Color(0xFF288187)),
              ),
              Text(
                'Riwayat Pembelian', style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF288187)
                ),
              )
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (ctx, i) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              margin: EdgeInsets.only(bottom: 20),
              width: width,
              height: height * 0.17,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset('assets/images/poster1.jpg'),
                  ),
                  Container(
                    width: width * 0.55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avengers: Infinty Wars', style: TextStyle(
                            color: MyColor.secondaryColor
                          )
                        ),
                        Text(
                          'Jumlah tiket : 2 tiket', style: TextStyle(
                            color: MyColor.textColor, fontSize: 11
                          )
                        ),
                        Text(
                          'Transaksi : Rp 60,000 (BNI)', style: TextStyle(
                            color: MyColor.textColor, fontSize: 11
                          )
                        ),
                        Text(
                          'Pembelian pada tanggal 09 - 10 - 2021', style: TextStyle(
                            color: MyColor.textColor, fontSize: 11
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}