import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:tradexa_app/models/details.dart';

class Data with ChangeNotifier {
  List<Details> _items = [];
  List<Details> get items {
    return [..._items];
  }

  void clearProducts() {
    _items.clear();
    notifyListeners();
  }

  void getProducts(String title) async {
    final url = Uri.parse('https://www.omdbapi.com/?apikey=685b6445&s=$title');
    final response = await http.post(url);
    final responseData = await json.decode(response.body)['Search'] as List<dynamic>;
    //print(responseData);
    responseData.forEach((element) async {
      //imdbId.add(element["imdbID"]);
      final id = element['imdbID'];
      final url2 = Uri.parse('https://www.omdbapi.com/?apikey=685b6445&i=$id');
      final response2 = await http.post(url2);
      final responseData2 =
          await json.decode(response2.body) as Map<dynamic, dynamic>;
      print(responseData2);
      _items.add(
        Details(
          imageUrl: responseData2['Poster'],
          actors: responseData2['Actors'],
          country: responseData2['Country'],
          director: responseData2['Director'],
          genre: responseData2['Genre'],
          imdbRating: responseData2['imdbRating'],
          language: responseData2['Language'],
          plot: responseData2['Plot'],
          ratings: responseData2['Ratings'],
          runtime: responseData2['Runtime'],
          title: responseData2['Title'],
          year: responseData2['Year'],
          writer: responseData2['Writer'],
        ),
      );
    });
    /*imdbId.forEach(
      (element) async {
        final url2 =
            Uri.parse('https://www.omdbapi.com/?apikey=685b6445&i=$element');
        final response2 = await http.post(url2);
        final responseData2 =
            json.decode(response2.body) as Map<dynamic, dynamic>;
        print(responseData2);
        _items.insert(
          0,
          Details(
            imageUrl: responseData2['Poster'],
            actors: responseData2['Actors'],
            country: responseData2['Country'],
            director: responseData2['Director'],
            genre: responseData2['Genre'],
            imdbRating: responseData2['imdbRating'],
            language: responseData2['Language'],
            plot: responseData2['Plot'],
            ratings: responseData2['Ratings'],
            runtime: responseData2['Runtime'],
            title: responseData2['Title'],
            year: responseData2['Year'],
            writer: responseData2['Writer'],
          ),
        );
      },*/

    notifyListeners();
  }
}
