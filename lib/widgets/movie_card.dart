import 'package:flutter/material.dart';
import 'package:tradexa_app/screens/detail_screen.dart';

class MovieCard extends StatelessWidget {
  //const MovieCard({ Key? key }) : super(key: key);
  final String imdbRating;
  final String imageUrl;
  final String title;
  final String runtime;
  MovieCard(
    this.imdbRating,
    this.imageUrl,
    this.title,
    this.runtime,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: title);
      },
      child: Card(

        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  color: Color(0xFF17082A),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: Container(
                    width: 120,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          imdbRating + '/10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              color: Color(0xFF17082A),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    runtime,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
