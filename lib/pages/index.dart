import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/controllers/buyerC.dart';
import 'package:ticky_app/controllers/cardC.dart';
import 'package:ticky_app/pages/main_page.dart';
import 'package:ticky_app/pages/ticket.dart';
import 'package:ticky_app/pages/user.dart';
import 'package:ticky_app/utils/bgGradient.dart';
import 'package:ticky_app/utils/color.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var buyerController = BuyerController();
    var buyerCardController = CardController();
    buyerCardController.generateCardInfo(height, width);
    var data;

    if(ModalRoute.of(context)!.settings.arguments == null)
      data = {'judulFilm': 'tidak ada film', 'jumlah': 0};
    else 
      data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: myGradient,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: TabBarView(
            children: [
              MainPage(buyerController),
              TicketPage(data),
              UserPage(buyerCardController)
            ],
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            height: MediaQuery.of(context).size.height * 0.09,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                color: MyColor.bottomBarColor,
                borderRadius: BorderRadius.circular(20)),
            child: TabBar(
              tabs: [
                Tab(
                  icon: FaIcon(FontAwesomeIcons.home),
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      bottom: 15,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColor.secondaryColor,
                        ),
                        child: Tab(
                          icon: FaIcon(FontAwesomeIcons.ticketAlt),
                        ),
                      ),
                    ),
                  ],
                ),
                Tab(
                  icon: FaIcon(FontAwesomeIcons.userAlt),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
