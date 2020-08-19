import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:loginregister/models/classroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';
import 'package:convert/convert.dart';

import '../general.dart';
class Classrooms with ChangeNotifier {
  /*
  ** @classrooms : a getter that returns the copied
  ** data from the list annotated as _classrooms from API
   */
  List<Classroom> _classrooms = [

  ];
  List<Classroom> get classrooms {
    // Copy and sort by descending
    final baseClasses = [..._classrooms];

    baseClasses.sort((b, a) => a.classroomId.compareTo(b.classroomId));
    return baseClasses;
  }

  Classroom findById(String id) {
    return _classrooms.firstWhere((classroom) => classroom.classroomId == id);
  }

  Future<void> fetchAndSetClassroom() async {
    var url = 'https://attendance-3561f.firebaseio.com/classes.json';
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
print(extractedData);

      List<Classroom> loadedProducts = [];
      extractedData.forEach((classId, classData) {
        loadedProducts.add(Classroom(
            classroomId: classId,
        accessCode: classData['accessCode'],
        enrolledTotal: classData['enrolledTotal'],
        classroomShift:classData['classroomShift'],
        classroomSection:classData['classroomSection'],
        classroomTitle:classData['classroomTitle'],
          lec_num: classData['lectures'],
        ));
      });
      _classrooms = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }

    notifyListeners();
  }
Future<void> addUserToClass(classId) async{
  var url = 'https://attendance-3561f.firebaseio.com/$classId.json';
  try{
    var response = await http.post(url,body:{
   'name': user.userFullName,
   'userEmail' :user.userEmail,
   'userPassword' :user.userPassword,
    'title':user.Type,
    });
  }catch(e){

  }
}
  Future<void> addClassroom(Map filteredClassroom) async{
   var url = 'https://attendance-3561f.firebaseio.com//classes.json';
    try {
      final indexToSet = _classrooms.length;
      final accessCodeToSet = randomAlphaNumeric(6);
      final enrolledStudentToSet = 0;
      var response = await http.post(url,body: json.encode({
        'classroomId': indexToSet,
        'accessCode': accessCodeToSet,
        'enrolledTotal': enrolledStudentToSet,
        'classroomShift': filteredClassroom['shift'],
        'classroomSection': filteredClassroom['section'],
        'classroomTitle': filteredClassroom['title'],
        'lectures':filteredClassroom['lec_num'],
      })).then((response){

        _classrooms.add(
        Classroom(
        classroomId: json.decode(response.body)["name"],
        accessCode: accessCodeToSet,
        enrolledTotal: enrolledStudentToSet,
        classroomShift: filteredClassroom['shift'],
        classroomSection: filteredClassroom['section'],
        classroomTitle: filteredClassroom['title'],
          lec_num: filteredClassroom['lec_num'],
        )
        );
      });

      notifyListeners();
    } catch (errorValue) {
      print(errorValue);
    }
  }

  Future<void> updateClassroom(Classroom newClass,id) async{
    final prodIndex = _classrooms.indexWhere((prod) => prod.classroomId == id);
    if (prodIndex >= 0) {
      final url =
          "https://attendance-3561f.firebaseio.com//products/$id.json";
      await http.patch(url,
          body: json.encode({
            "classroomTitle": newClass.classroomTitle,
            "enrolledTotal": newClass.enrolledTotal,
            "classroomSection": newClass.classroomSection,
            "classroomShift":newClass.classroomShift,
          }));

      _classrooms[prodIndex] = newClass;
      notifyListeners();
    } else {
      print("Failure !!!");
    }

  }

  String removeClassroom(String classroomId) {
    var message = "Class deleted successfully";
    try {
      _classrooms.removeWhere((c) => c.classroomId == classroomId);
    } catch (exception) {
      message = "Deletion unsuccessful";
    }
    notifyListeners();
    return message;
  }


}
