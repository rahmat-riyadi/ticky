import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticky_app/controllers/movie_controller.dart';
import 'package:ticky_app/utils/color.dart';

List<Color> listColor = [
  Color(0xFF288187),
  Color(0xFFB20B70),
  Color(0xFFC08C06),
  Color(0xFFAF1F0B),
  Color(0xFF2F930C),
];

class MovieList extends StatelessWidget {

  MovieList(this.height, this.width, this.data, this.index);

  var movieList = MovieController();
  var height, index, width, data; 
  String? title, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: height * 0.23,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0.9,0),
            child: Container(
              padding: EdgeInsets.all(10),
              width: width * 0.54,
              height: height * 0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColor.primaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 23,
                    color: listColor[this.index % 5].withOpacity(0.5)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        this.data.title,
                        style: TextStyle(
                          color: MyColor.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Divider(height: 10),
                      Text(
                        '2 jam 23 menit',
                        style: TextStyle(
                          fontSize: 12,
                          color: MyColor.textColor.withOpacity(0.30)
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'aksi',
                            style: TextStyle(
                            fontSize: 12,
                            color: MyColor.secondaryColor
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'sci-fi',
                            style: TextStyle(
                            fontSize: 12,
                            color: MyColor.secondaryColor
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  '4.0',
                                  style: TextStyle(
                                  fontSize: 12,
                                  color: MyColor.secondaryColor
                                  ),
                                ),
                              ),
                              Icon(Icons.star, size: 20, color: MyColor.secondaryColor)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: FaIcon(FontAwesomeIcons.heart, color: MyColor.secondaryColor, size: 22),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              this.data.image.toString(),
            ),
          ),
        ],
      ),
    );
  }
}