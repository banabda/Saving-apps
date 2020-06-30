import 'package:bolpis/models/user.dart';
import 'package:bolpis/screen/wrapper.dart';
import 'package:bolpis/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
    ));
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.amber
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
