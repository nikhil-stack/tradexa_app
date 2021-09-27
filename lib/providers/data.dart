import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:tradexa_app/models/details.dart';

class Data with ChangeNotifier {
  List<Details> _items = [];
  List<Details> get items {
    return [..._items];
  }

  void getProducts(String title) async {
    final url = Uri.parse('https://www.omdbapi.com/?apikey=685b6445&t=$title');
    final response = await http.post(url);
    final responseData = json.decode(response.body);
    _items.insert(
      0,
      Details(
        imageUrl: responseData['Poster'],
        actors: responseData['Actors'],
        country: responseData['Country'],
        director: responseData['Director'],
        genre: responseData['Genre'],
        imdbRating: responseData['imdbRating'],
        language: responseData['Language'],
        plot: responseData['Plot'],
        ratings: responseData['Ratings'],
        runtime: responseData['Runtime'],
        title: responseData['Title'],
        year: responseData['Year'],
        writer: responseData['Writer'],
      ),
    );
    notifyListeners();
  }
}
