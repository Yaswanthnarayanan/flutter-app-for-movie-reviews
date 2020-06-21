import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:testapptwo/pages/Home.dart';
import 'package:testapptwo/pages/Search.dart';

void main() =>  runApp(MaterialApp(
  initialRoute: '/Home',
  routes: {
    //'/': (context)=> Loading(),
    '/Home': (context)=> IMDB_app(),
    '/Search': (context)=> Search(),

  },

));
