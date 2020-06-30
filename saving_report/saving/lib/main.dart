import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saving/constants.dart';
import 'package:saving/view/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
    ]);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saving Apps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: MyHomePage(title: 'Dashboard', profilename: 'Bagas Nabil', lastOnline: '27/06/2020 - 19:55',),
    );
  }
}


