import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/bloc/date_bloc/datebl_bloc.dart';
import 'package:ticky_app/bloc/radio_bloc/timeradio_bloc.dart';
import 'package:ticky_app/bloc/seat_bloc/seatbloc_bloc.dart';
import 'package:ticky_app/models/movie.dart';
import 'package:ticky_app/pages/buy_ticket.dart';
import 'package:ticky_app/utils/bgGradient.dart';
import 'package:ticky_app/utils/color.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var buyerC = args['buyer'];
    var movie = args['movie'];

    return Container(
      decoration: BoxDecoration(
          gradient: myGradient,
      ), 
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            movie.title.toString(), style: TextStyle(
              fontSize: 16
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: width * 0.5,
                      height: height * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(movie.image.toString()),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(1.8, 1.2),
                            child: RaisedButton(
                              padding: EdgeInsets.all(8),
                              onPressed: (){},
                              child: Icon(Icons.play_arrow, color: MyColor.textColor, size: 30),
                              shape: CircleBorder(),
                              color: MyColor.secondaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(bottom: 10),
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white.withOpacity(0.16),
                            width: 1
                          )
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.star, color: MyColor.secondaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('4.5/5', style: TextStyle(color: MyColor.textColor),),
                              )
                            ]
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_time_rounded, color: MyColor.secondaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('161 menit', style: TextStyle(color: MyColor.textColor),),
                              )
                            ]
                          )
                        ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Sinopsis', style: TextStyle(
                        color: MyColor.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '                           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar lacus, sed morbi tincidunt sagittis volutpat tortor elementum. In laoreet ligula eget amet bibendum varius eu et congue. Donec pharetra tincidunt orci, quis odio. Viverra vulputate condimentum orci, neque. Diam cursus arcu sit nisi.', style: TextStyle(
                        color: MyColor.textColor,
                        fontSize: 12,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment(0,0.9),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (context) => TimeradioBloc()),
                          BlocProvider(create: (context) => DateblBloc()),
                          BlocProvider(create: (context) => SeatblocBloc()),
                        ],
                        child: BuyTicket()
                      ),
                      settings: RouteSettings(
                        arguments: {
                          'buyer': buyerC,
                          'movie': movie
                        }
                      )
                    )
                  ),
                  child: Text(
                    'pesan tiket', style: TextStyle(
                      fontSize: 18,
                      color: MyColor.textColor
                    )
                  ),
                  color: MyColor.secondaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}