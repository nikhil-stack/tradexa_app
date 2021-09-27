import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradexa_app/providers/data.dart';
import 'package:tradexa_app/widgets/star.dart';

class DetailScreen extends StatelessWidget {
  //const DetailScreen({ Key? key }) : super(key: key);
  //final String imageUrl;
  //DetailScreen(this.imageUrl);
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final loadedMovie = Provider.of<Data>(context).items[0];
    return Scaffold(
      backgroundColor: Color(0xFF17082A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            loadedMovie.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black.withOpacity(0.2)],
                        )),
                  ),
                  Positioned(
                    left: 15,
                    top: 30,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 50,
                        child: Image.asset('assets/images/back_arrow.png'),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Text(
                      loadedMovie.title,
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    left: 15,
                    top: 350,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF210F37),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    onPressed: null,
                    //color: Colors.white,
                  ),
                ),
                SizedBox(width: 50),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF210F37),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: null,
                    //color: Colors.white,
                  ),
                ),
                SizedBox(width: 50),
                Container(
                    //height: 60,
                    width: 60,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF210F37),
                    ),
                    child: Image.asset(
                        'assets/images/Path.png',
                        width: 30,
                    
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                margin: EdgeInsets.all(20),
                color: Color(0xFF210F37),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StarRating(
                              rating:
                                  double.parse(loadedMovie.imdbRating) / 2.0),
                          Text(
                            loadedMovie.imdbRating,
                            style: TextStyle(
                                color: Colors.yellow.shade900, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              loadedMovie.ratings[0]['Source'],
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 20),
                            ),
                          ),
                          Text(
                            loadedMovie.ratings[0]['Value'],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    if(loadedMovie.ratings.length == 2)
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              loadedMovie.ratings[1]['Source'],
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 20),
                            ),
                          ),
                          Text(
                            loadedMovie.ratings[1]['Value'],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    if(loadedMovie.ratings.length == 2)
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              loadedMovie.ratings[2]['Source'],
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 20),
                            ),
                          ),
                          Text(
                            loadedMovie.ratings[2]['Value'],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                margin: EdgeInsets.all(20),
                color: Color(0xFF210F37),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Group_357.png',
                            width: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            loadedMovie.year,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Vector.png',
                            width: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              loadedMovie.country,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Group_356.png',
                            width: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            loadedMovie.runtime,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Group_358.png',
                            width: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              loadedMovie.language,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                color: Color(0xFF210F37),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plot',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        loadedMovie.plot,
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Director',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 5),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) => Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Colors.deepPurple.shade900,
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      loadedMovie.director.split(',')[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                          itemCount: loadedMovie.director.split(',').length),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Actors',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 5),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) => Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Colors.deepPurple.shade900,
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      loadedMovie.actors.split(',')[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                          itemCount: loadedMovie.actors.split(',').length),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Writer',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 5),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) => Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Colors.deepPurple.shade900,
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      loadedMovie.writer.split(',')[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                          itemCount: loadedMovie.writer.split(',').length),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
