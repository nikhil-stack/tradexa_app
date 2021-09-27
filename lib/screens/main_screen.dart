import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradexa_app/providers/data.dart';
import 'package:tradexa_app/widgets/movie_card.dart';
import 'package:tradexa_app/widgets/search_bar.dart';

class MainScreen extends StatelessWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<Data>(context).items;
    return Scaffold(
      backgroundColor: Color(0xFF17082A),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            SearchBar(),
            response.isEmpty
                ? Text(
                    'Please search for some movies using the search bar above',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                : SingleChildScrollView(
                  
                    child: (ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) => MovieCard(
                              response[index].imdbRating,
                              response[index].imageUrl,
                              response[index].title,
                              response[index].runtime,
                            ),
                        itemCount: response.length)),
                  )
          ],
        ),
      ),
    );
  }
}
