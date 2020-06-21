import 'package:flutter/material.dart';
import 'package:testapptwo/pages/Search.dart' show Search;
import 'package:http/http.dart';


          class IMDB_app extends StatelessWidget {

            @override
            Widget build(BuildContext context) {
              return Scaffold(

                appBar: AppBar(
                  title: Text("IMDB"),
                  centerTitle: true,
                  backgroundColor: Colors.grey[800],
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                          showSearch(context: context, delegate: CustomSearchDelegate(),);
                      },
                    )
                  ],
                ),
                body: Column(
                    children: <Widget>[
                      Image(image: AssetImage('assets/collage.jpg'),
                      colorBlendMode: BlendMode.screen,
                        fit: BoxFit.cover,
                        height: 690,
                        //width: 500,
                        alignment: Alignment.center,

                      )
                    ],
                  ),
              );
            }
          }

//          class Data{
//            String data='';
//            Data({this.data});
//          }

class CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },

      ),

    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IMDB_app()));
//      close(context, null);
      },
    );

  }

  @override
  Widget buildResults(BuildContext context) {
//            onTapped(){
//          Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Search(flick: query,),
//
//          ));

     //};
    return Search(flick: query,);


  }


  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}