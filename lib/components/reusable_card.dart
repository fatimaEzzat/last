import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  ReusableWidget({@required this.myColor, this.cardChild,});
  final Color myColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: cardChild,
        margin: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 35.0,
              offset: Offset(0.0, 10.0),
            ),
          ],

      ),
    );
  }
}