import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradexa_app/providers/data.dart';

class SearchBar extends StatefulWidget {
  //const SearchBar({ Key? key }) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();
  void searchMovies(BuildContext context) async{
    Provider.of<Data>(
      context,
      listen: false,
    ).getProducts(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.search),
        color: Colors.grey,
        onPressed: () => searchMovies(context),
      ),
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter movie name to search',
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
      ),
      tileColor: Color(0xFF210F37),
      trailing: InkWell(child: Image.asset('assets/images/cancel.png', width: 40,),onTap: () {
      setState(() {
              controller.clear();
            },);},),);
      
  }
}
