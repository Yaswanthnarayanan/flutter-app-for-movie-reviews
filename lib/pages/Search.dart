import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:testapptwo/pages/Home.dart' as IMDB_app;


// ignore: must_be_immutable
class Search extends StatefulWidget {
  final String flick;
  const Search({Key key, @required this.flick}): super(key: key);
  @override
  _SearchState createState() => _SearchState(flick: this.flick);
}

class _SearchState extends State<Search> {
  String flick;

  _SearchState({this.flick});

  List key1 = new List();
  List value = new List();
  String address = 'http://www.omdbapi.com/?t=';
  String apikey = '&apikey=f285a809';
  int len = 0;

  getData(String movie) async {
    String movietitle = address + movie + apikey;
    print(movietitle);
    Response response = await get(movietitle);

    Map data = jsonDecode(response.body);
    setState(() {
      data.keys.forEach((k) => key1.add("$k"));
      data.values.forEach((v) => value.add("$v"));
      len = data.length;
    });
  }


  @override
  void initState() {
    super.initState();
    getData(flick);

  }

  @override
  Widget build(BuildContext context) {
    return Container(

        child: ListView.builder(

            itemCount: len,
            itemBuilder: (context, position) {
              return ListTile(

                title: Text(
                  '${key1[position]}' + ': ' + '${value[position]}',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),

                ),

              );
            }


        )

    );
  }
}
