import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import '../constants.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key key,
    @required this.transac,
    @required this.nominals,
  }) : super(key: key);

  final List<String> transac;
  final List<double> nominals;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: transac.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                color: kBiruMudaColor,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: kHijauColor.withOpacity(0.2),
                        child:
                            Text(transac[index].substring(0, 1).toUpperCase()),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        // transaction
                        children: <Widget>[
                          Text(
                            "${transac[index][0].toUpperCase()}${transac[index].substring(1)}",
                            textAlign: TextAlign.left,
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ],
                  ),

                  // line chart
                  Column(
                    // nominal
                    children: <Widget>[
                      Text(
                          "${FlutterMoneyFormatter(amount: nominals[index]).copyWith(symbol: "IDR", symbolAndNumberSeparator: " ").output.symbolOnLeft}")
                    ],
                  ),
                ],
              )
              );
        },
      ),
    );
  }
}
