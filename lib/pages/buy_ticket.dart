import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ticky_app/bloc/date_bloc/datebl_bloc.dart';
import 'package:ticky_app/bloc/radio_bloc/timeradio_bloc.dart';
import 'package:ticky_app/bloc/seat_bloc/seatbloc_bloc.dart';
import 'package:ticky_app/models/movie.dart';
import 'package:ticky_app/pages/payment_page.dart';
import 'package:ticky_app/utils/bgGradient.dart';
import 'package:ticky_app/utils/color.dart';
import 'package:ticky_app/utils/curves_line.dart';
import 'package:ticky_app/utils/seat.dart';

class BuyTicket extends StatelessWidget {
  const BuyTicket({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var price = NumberFormat.currency(locale: 'idr').format(12);
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var buyerC = args['buyer'];
    var movie = args['movie'];
    String? time, date;
    List<int> seatList = [];
    List<String> days = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];

    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: myGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            movie.title.toString(),
            style: TextStyle(fontSize: 14)
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded)
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: height * 0.45,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      // color: Colors.red.withOpacity(0.4),
                    ),
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 10),
                      painter: CurvesLine(),
                    ),
                  ),
                  BlocBuilder<SeatblocBloc, SeatblocState>(
                    builder: (context, state) => Container(
                      width: width * 0.7,
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          crossAxisSpacing: 9,
                          mainAxisSpacing: 9,
                        ),
                        children: List.generate(36, (index) => (index == 0 || index == 5 || index == 35 || index == 30) ? Container() : GestureDetector(
                          onTap: () {

                            if(seatList.contains(index)){
                              seatList.remove(index);
                            } else {
                              seatList.add(index);
                            }

                            seatList.forEach((e) => print('element ' + e.toString()));
                            return context.read<SeatblocBloc>().add(IsSelect(index, !state.value));
                          },
                          child: Seat(seatList.contains(index) ? true : false)
                        )),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                          ),
                          SizedBox(width: 15,),
                          Text(
                            'terisi', style: TextStyle(
                              color: MyColor.textColor
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.44),
                              border: Border.all(color: MyColor.textColor, width: 0.3)
                            ),
                          ),
                          SizedBox(width: 15,),
                          Text(
                            'tersedia', style: TextStyle(
                              color: MyColor.textColor
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.secondaryColor,
                              border: Border.all(color: MyColor.textColor, width: 0.3)
                            ),
                          ),
                          SizedBox(width: 15,),
                          Text(
                            'dipilih', style: TextStyle(
                              color: MyColor.textColor
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ]
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0,20, 0, 20),
              width: width,
              height: height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: MyColor.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 20,
                    offset: Offset(0, -10),
                    spreadRadius: 2
                  )
                ]
              ),
              child: BlocBuilder<TimeradioBloc, TimeradioState>(
                builder: (context, state) { 

                  time = state.date;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                (state.value == 1) ? BoxShadow(blurRadius: 15, color: MyColor.secondaryColor.withOpacity(0.3), offset: Offset(0, 0))
                                : BoxShadow(color: Colors.transparent)
                              ]
                            ),
                            child: OutlinedButton(
                              onPressed: () => context.read<TimeradioBloc>().add(FirstEvent()),
                              child: Text(
                                '13.00',
                                style: TextStyle(
                                  color: (state.value == 1) ? MyColor.secondaryColor : MyColor.textColor
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: MyColor.primaryColor,
                                splashFactory: NoSplash.splashFactory,
                                side: BorderSide(
                                  color: (state.value == 1) ? MyColor.secondaryColor : MyColor.textColor
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                (state.value == 2) ? BoxShadow(blurRadius: 15, color: MyColor.secondaryColor.withOpacity(0.3), offset: Offset(0, 0))
                                : BoxShadow(color: Colors.transparent)
                              ]
                            ),
                            child: OutlinedButton(
                              onPressed: () => context.read<TimeradioBloc>().add(SecondEvent()),
                              child: Text(
                                '15.00',
                                style: TextStyle(
                                  color: (state.value == 2) ? MyColor.secondaryColor : MyColor.textColor
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: MyColor.primaryColor,
                                splashFactory: NoSplash.splashFactory,
                                side: BorderSide(
                                  color: (state.value == 2) ? MyColor.secondaryColor : MyColor.textColor
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                (state.value == 3) ? BoxShadow(blurRadius: 15, color: MyColor.secondaryColor.withOpacity(0.3), offset: Offset(0, 0))
                                : BoxShadow(color: Colors.transparent)
                              ]
                            ),
                            child: OutlinedButton(
                              onPressed: () => context.read<TimeradioBloc>().add(ThirdEvent()),
                              child: Text(
                                '17.00',
                                style: TextStyle(
                                  color: (state.value == 3) ? MyColor.secondaryColor : MyColor.textColor
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: MyColor.primaryColor,
                                splashFactory: NoSplash.splashFactory,
                                side: BorderSide(
                                  color: (state.value == 3) ? MyColor.secondaryColor : MyColor.textColor
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 30,
                          itemBuilder: (ctx, i) => BlocBuilder<DateblBloc, DateblState>(
                            builder: (context, state) {

                                date = (state.value+1).toString();

                                return GestureDetector(
                                onTap: () => context.read<DateblBloc>().add(IsPressed(i)),
                                child: Container(
                                  margin: (i == 0) ? EdgeInsets.fromLTRB(40, 3, 20, 3) : EdgeInsets.fromLTRB(0, 3, 20, 3),
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: MyColor.primaryColor,
                                    boxShadow: [
                                      (state.value == i ) ? BoxShadow(color: MyColor.secondaryColor, blurRadius: 5)
                                      : BoxShadow(color: Colors.white.withOpacity(0.44), blurRadius: 4 )
                                    ],
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '${i+1}', style: TextStyle(
                                          color: (state.value == i) ? MyColor.secondaryColor : MyColor.textColor,
                                          fontSize: 28
                                        ),
                                      ),
                                      Text(
                                        days[i%7], style: TextStyle(
                                          color: (state.value == i) ? MyColor.secondaryColor : MyColor.textColor
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Rp. ' + movie.price.toString() , style: TextStyle(
                              fontSize: 21, color: MyColor.secondaryColor
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PaymentPage(),
                                settings: RouteSettings(
                                  arguments: {
                                    'movie' : {
                                      'nama' : 'Rahmat Riyadi Syam',
                                      'jumlah' : seatList.length,
                                      'judulFilm': movie.title,
                                      'jam': time,
                                      'tanggal': date,
                                      'harga': seatList.length * movie.price!.toInt()
                                    },
                                    'buyer': buyerC,
                                  }
                                )
                              ));
                            },
                            child: Text('beli tiket'),
                            color: MyColor.secondaryColor,
                            textColor: MyColor.textColor,
                            padding: EdgeInsets.symmetric(horizontal: 30),
                          )
                        ]
                      )
                    ],
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}