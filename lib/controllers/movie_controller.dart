import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ticky_app/models/movie.dart';

class MovieController {

  List<MovieModel> listMovie = [
    MovieModel(image: 'assets/images/images2.jfif', price: 35000, title: 'Descpicable Me'),
    MovieModel(image: 'assets/images/images4.jfif', price: 45000, title: 'Fast Furious 6'),
    MovieModel(image: 'assets/images/images3.jfif', price: 55000, title: 'Dilan 1990'),
    MovieModel(image: 'assets/images/poster1.jpg', price: 60000, title: 'Pasific Rim'),
    MovieModel(image: 'assets/images/images6.jfif', price: 37000, title: 'porenjes'),
    MovieModel(image: 'assets/images/images5.jfif', price: 43000, title: 'dua centang ungu'),
  ];

  Future<List<MovieModel>> generatePopularMovie() async {
    Uri url = Uri.parse('https://api.themoviedb.org/3/trending/movie/week?api_key=cfee72c3461435c63f74981fa3d7e0b6');

    List<MovieModel> popular = [];

    await http.get(url).then((value) {
      var response = json.decode(value.body)['results'] as List<dynamic>;
      response.forEach((res) {
        print(res);
        popular.add(MovieModel(title: res['original_title'], image: res['poster_path'], subtitle: res['overview']));
      });
    });

    return popular;

  }


}