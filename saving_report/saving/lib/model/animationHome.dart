import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saving/model/balance.dart';
import 'package:saving/model/transactionList.dart';

import '../constants.dart';
import 'monthchart.dart';

class AnimationHome extends StatefulWidget {
  final String title;

  const AnimationHome({Key key, this.title}) : super(key: key);

  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> {

  final List<double> yValues = [
    2000000,
    2100000,
    2400000,
    2300000,
    1900000,
    1500000,
    1800000,
    2500000,
    2200000,
    2000000
  ];
  final List<String> transac = [
    'Investasi',
    'nabung',
    'jajan',
    'gajian',
    'belanja',
    'makan',
    'gajian',
    'belanja',
    'makan'
  ];
  final List<double> nominals = [
    200000,
    500000,
    123000,
    500000,
    325100,
    25000,
    500000,
    325100,
    25000
  ];

  bool sidebarOpen = false;

  double yOffset = 0;
  double xOffset = 0;
  double pageScale = 1;

  String profilename = "Bagas Nabil";

  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? (MediaQuery.of(context).size.width).toDouble()/1.8 : 0;
      yOffset = sidebarOpen ? 70 : 0;
      pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 500),
      transform: Matrix4.translationValues(xOffset, yOffset, 1.0)..scale(pageScale),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: sidebarOpen ? BorderRadius.circular(20) : BorderRadius.circular(0),
      ),
      child: sidebarOpen ? ClipRRect(
        child: GestureDetector(child: bodySection(),onTap: (){
          sidebarOpen = false;
          setSidebarState();
        },),
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        ) : bodySection(),
    );
  }

  Container bodySection() {
    return Container(
      child: sidebarOpen ? bodyElement() : SafeArea(
        child: bodyElement(),
      ),
    );
  }

  Column bodyElement() {
    return Column(
        children: <Widget>[
          Container(
            color: kBiruMudaColor,
            child: Row( 
              children: <Widget>[
                IconButton(
                  icon: sidebarOpen ? SvgPicture.asset("assets/icons/closeIcon.svg", color: kBiruColor,) : SvgPicture.asset("assets/icons/menuIcon.svg", color: kBiruColor,), 
                  iconSize: 36,
                  onPressed: (){
                  sidebarOpen = !sidebarOpen;
                  setSidebarState();
                }),
                SizedBox(width: 8),
                Text(
                  widget.title,
                  style: GoogleFonts.dancingScript(
                      color: kBiruColor,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                      fontSize: 24),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 16))
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: kBiruMudaColor,
            ),
            child: groupHeader(),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            // aspectRatio: 0.5,
            child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MonthChart(yValues: yValues),
                    Divider(),
                    TransactionList(transac: transac, nominals: nominals)
                  ],
                )),
          ),
        ],
      );
  }

  Wrap groupHeader() {
    return Wrap(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              titleAndMonth(month: "July"),
              SizedBox(
                height: 24,
              ),
              MontlyBalance(),
            ],
          ),
        )
      ],
    );
  }

  Row titleAndMonth({String month}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Monthly Saving",
          style: TextStyle(
              color: kBiruColor,
              letterSpacing: 1,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kMerahColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                month,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
      ],
    );
  }
}