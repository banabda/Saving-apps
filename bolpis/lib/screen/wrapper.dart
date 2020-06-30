import 'package:bolpis/models/user.dart';
import 'package:bolpis/screen/authenticate/authenticate.dart';
import 'package:bolpis/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
