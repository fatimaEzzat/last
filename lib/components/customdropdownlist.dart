

import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

class CustomDropList extends StatelessWidget {
  CustomDropList({@required this.controller,this.hint,this.accountTypes,this.onChange});
   final hint;
   final controller;
   final List<String> accountTypes;
   final Function onChange;

  @override
  Widget build(BuildContext context) {
    return DropDownField(
      controller:controller ,
      hintText: hint,hintStyle: TextStyle(
    ),

      enabled: true,
      itemsVisibleInDropdown: 2,
      items:accountTypes ,
      onValueChanged: onChange,

    );
  }
}
