import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginregister/models/UserAccount.dart';
import 'package:loginregister/models/classroom.dart';
import 'package:random_string/random_string.dart';

class UserAccounts with ChangeNotifier {
  /*
  ** @classrooms : a getter that returns the copied
  ** data from the list annotated as _classrooms from API
   */
  List<UserAccount> get users {
    // Copy and sort by descending
    final baseUsers = [..._users];

    baseUsers.sort((b, a) => a.user_id.compareTo(b.user_id));
    return baseUsers;
  }

  UserAccount findById(String id) {
    return _users.firstWhere((user) => user.user_id == id);
  }

  Future<void> fetchAndSetUser() async {
    var url = 'https://attendance-3561f.firebaseio.com/users.json';
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print(extractedData);

      List<UserAccount> loadedUsers = [];
      extractedData.forEach((classId, classData) {
        loadedUsers.add(UserAccount(
          user_id: classId,
          userFullName: classData['name'],
          userEmail:classData['email'],
          userPassword: classData['password'],
          userConfirmPassword: classData['confimation'],
          Type: classData['type'],
        ));
      });
      _users = loadedUsers;
      notifyListeners();
    } catch (errorValue) {
      print(errorValue);
    }
    notifyListeners();
  }

  Future<void> addUser(Map filteredUser) async{
    var url = 'https://attendance-3561f.firebaseio.com/users.json';
    try {
      final indexToSet = _users.length;
      var response = await http.post(url,body: json.encode({
        'uesrId':indexToSet,
        'name':filteredUser['name'],
        'email':filteredUser['email'],
        'password':filteredUser['password'],
        'confirmation':filteredUser['confimation'],
        'type':filteredUser['type'],
      })).then((response){

        _users.add(
           UserAccount(
             user_id: json.decode(response.body)["name"],
             userFullName: filteredUser['name'],
             userEmail: filteredUser['email'],
             userPassword:filteredUser['password'],
             userConfirmPassword: filteredUser['confirmation'],
             Type: filteredUser['type']
           )
        );
      });

      notifyListeners();
    } catch (errorValue) {
      print(errorValue);
    }
  }


  List<UserAccount> _users = [
    UserAccount(
        user_id: '0',
        userFullName: 'fatma ezzat tohamy',
        userEmail: 'fezzateng@gmail.com',
        userPassword: '1234',
        Type: 'student'),
  ];
}
