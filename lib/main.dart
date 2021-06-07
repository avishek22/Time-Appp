

import 'package:flutter/material.dart';
import 'package:time/pages/home.dart';
import 'package:time/pages/loading.dart';
import 'package:time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
    routes: {
        '/':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/location':(context)=>ChooseLocation()

    },
  ));
}

