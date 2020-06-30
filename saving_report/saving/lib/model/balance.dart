import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class MontlyBalance extends StatelessWidget {
  const MontlyBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: BalanceMoney(money: 2000000, monthText: "Income", textAlign: TextAlign.left, moneyColor:kHijauColor, cAlign: CrossAxisAlignment.center)),
          VerticalDivider(thickness: 1,),
          Expanded(child: BalanceMoney(money: 20000, monthText: "Outcome", textAlign: TextAlign.right, moneyColor:kMerahColor, cAlign: CrossAxisAlignment.center)),
        ],
      ),
    );
  }
}

class BalanceMoney extends StatelessWidget {
  const BalanceMoney({
    Key key,
    @required this.money, this.monthText, this.textAlign, this.moneyColor, this.cAlign
  }) : super(key: key);

  final double money;
  final String monthText;
  final TextAlign textAlign;
  final Color moneyColor;
  final CrossAxisAlignment cAlign;

  @override
  Widget build(BuildContext context) {
    var symbolOnLeft = FlutterMoneyFormatter(amount: money).copyWith(symbol: "Rp", symbolAndNumberSeparator: " ").output.symbolOnLeft;
    var result = symbolOnLeft.substring(0, symbolOnLeft.length-3);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: cAlign,
      children: <Widget>[
        Text(
          "$result",
          textAlign: textAlign,
          style: GoogleFonts.breeSerif(
            color: moneyColor,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Month $monthText",
          textAlign: textAlign,
          style: TextStyle(
            color: kTextRedupColor.withOpacity(0.7),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
