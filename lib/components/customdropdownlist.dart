

import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class CustomDropList extends StatelessWidget {
 CustomDropList({@required this.hint});
  // CustomDropList({@required this.controller,this.hint,this.accountTypes,this.onSelectad,this.itemBuilder});
   final hint;
   var _obSecure;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obSecure,
      decoration: InputDecoration(
          hintText: hint,
          ),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please, Enter $hint ';
        } else {
          return null;
        }
      },
    );
  }
}
