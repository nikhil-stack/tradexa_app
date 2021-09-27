import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradexa_app/providers/data.dart';
import 'package:tradexa_app/widgets/movie_card.dart';
import 'package:tradexa_app/widgets/search_bar.dart';

class MainScreen extends StatelessWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17082A),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            SearchBar(),
            Provider.of<Data>(context).items.isEmpty
                ? Text(
                    'Please search for some movies using the search bar above',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                : MovieCard(
                    Provider.of<Data>(context).items[0].imdbRating,
                    Provider.of<Data>(context).items[0].imageUrl,
                    Provider.of<Data>(context).items[0].title,
                    Provider.of<Data>(context).items[0].runtime,
                  ),
          ],
        ),
      ),
    );
  }
}
