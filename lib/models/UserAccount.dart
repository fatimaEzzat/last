import 'package:flutter/material.dart';

class UserAccount{
  final String user_id;
  final String userFullName;
  final String userEmail;
  final String userPassword;
  final String userConfirmPassword;
  final String Type;

  UserAccount({
    @required this.user_id,
    @required this.userEmail,
    @required this.userPassword,
    @required this.userFullName,
    @required this.userConfirmPassword,
    @required this.Type,
  });
}
