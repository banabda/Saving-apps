import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saving/constants.dart';
import 'package:saving/model/animationHome.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.profilename, this.lastOnline}) : super(key: key);

  final String title, profilename, lastOnline;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        SideBarPart(profilename: widget.profilename, lastOnline: widget.lastOnline,),
        AnimationHome(title: widget.title)
      ]),
    );
  }
}
class SideBarPart extends StatelessWidget {
  final String profilename, lastOnline;

  const SideBarPart({Key key, this.profilename, this.lastOnline}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> menus1 = ["Dashboard", "Transactions", "Balance", "Income", "Outcome"];
    List<String> menus2 = ["Settings", "Help", "Log Out"];
    return Container(
      width: double.infinity,
      color: kBiruColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ProfilePart(profilename: profilename, lastOnline: lastOnline),
                  Container(
                    height: 20.0,
                    color: Colors.red,
                  ),
                  ListView.builder(
                    itemCount: menus1.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SvgPicture.asset("assets/icons/${menus1[index].replaceAll(" ", "").toLowerCase()}.svg", color: kBiruColor),
                                Text(menus1[index])
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePart extends StatelessWidget {
  const ProfilePart({
    Key key,
    @required this.profilename,
    @required this.lastOnline,
  }) : super(key: key);

  final String profilename;
  final String lastOnline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 36.0,
          backgroundImage: AssetImage("assets/images/profile.png"),
        ),
        SizedBox(height: 20,),
        Text(
          profilename,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 20,),
        Text(
          "Last Online\n$lastOnline",
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}