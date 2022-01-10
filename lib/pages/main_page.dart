import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/controllers/buyerC.dart';
import 'package:ticky_app/controllers/movie_controller.dart';
import 'package:ticky_app/pages/detail_page.dart';
import 'package:ticky_app/utils/color.dart';
import 'package:ticky_app/utils/movie_list.dart';

 class MainPage extends StatelessWidget {

  BuyerController buyer;

  MainPage(this.buyer);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var m = MovieController();

    List<Image> imgList = [
      Image.asset('assets/images/carousel.jfif', fit: BoxFit.cover,),
      Image.asset('assets/images/carousel2.jfif', fit: BoxFit.cover,),
      Image.asset('assets/images/carousel3.jfif', fit: BoxFit.cover,),
      Image.asset('assets/images/carousel4.jfif', fit: BoxFit.cover,),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,),
      child: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'hi, Rahmat Riyadi Syam', 
              style: TextStyle(color: MyColor.textColor, fontWeight: FontWeight.w100, fontSize: 14)
            ),
            subtitle: Text(
              'ayo cari kesenanganmu di TICKY!',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColor.textColor),
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: MyColor.thirdColor,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Transform.rotate(
                angle: 0.5,
                child: FaIcon(
                  FontAwesomeIcons.bell,
                  color: MyColor.textColor,
                  size: 18
                ),
              ),
            ),
          ),
          Container(
            width: width,
            height: height * 0.23,
            decoration: BoxDecoration(
              color: MyColor.textColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: Duration(milliseconds: 2500),
                  autoPlayCurve: Curves.fastOutSlowIn
                ),
                items: imgList,
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: height * 0.5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: m.listMovie.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailPage(),
                  settings: RouteSettings(
                    arguments: {
                      'buyer': buyer,
                      'movie': m.listMovie[i]
                    }
                  )
                )),
                child: MovieList(height, width, m.listMovie[i], i)
              )
            ),
          )
        ],
      )
    );
  }
}