import 'package:flutter/material.dart';
class LetterContainer extends StatelessWidget {
  LetterContainer({@required this.letter});
  final letter;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      alignment: Alignment.center,
      height: 35,
      width: 35,
      color: Colors.blue,
      child: Text(letter, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }
}
