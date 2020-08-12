import 'dart:io';

import 'package:loginregister/models/classroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';
import 'package:provider/provider.dart';
import 'package:loginregister/providers/classrooms.dart';

class StudentEnrollment with ChangeNotifier {
  /*
  ** @classrooms : a getter that returns the copied
  ** data from the list annotated as _classrooms from API
   */
  List<Classroom> get classrooms {
    // Copy and sort by descending
    final baseClasses = [..._studentClasses];

    baseClasses.sort((b, a) => a.classroomId.compareTo(b.classroomId));
    return baseClasses;
  }

  Classroom findById(int id) {
    return _studentClasses.firstWhere((classroom) => classroom.classroomId == id);
  }

  Future<void> fetchAndSetClassroom() async {
    var classes = [..._studentClasses];
    notifyListeners();
  }

  void addToStudentClasses(Map filteredClassroom) {
    try {
      final indexToSet = _studentClasses.length;
      final accessCodeToSet = randomAlphaNumeric(6);
      final enrolledStudentToSet = 0;

      final classroom = Classroom(
        classroomId: indexToSet,
        accessCode: accessCodeToSet,
        enrolledTotal: enrolledStudentToSet,
        qr_text: filteredClassroom['qr'],
        classroomGrade: filteredClassroom['grade'],
        classroomSection: filteredClassroom['section'],
        classroomTitle: filteredClassroom['title'],

      );

      _studentClasses.add(classroom);
      notifyListeners();
    } catch (errorValue) {
      print(errorValue);
    }
  }

  void updateClassroom(Map filteredClassroom) {
    try {
      final classroomId = _studentClasses
          .firstWhere((c) => c.classroomId == filteredClassroom['id']).classroomId;

      final updatedClassroom = Classroom(
        classroomId: classroomId,
        classroomTitle: filteredClassroom['title'],
        classroomSection: filteredClassroom['section'],
        classroomGrade: filteredClassroom['grade'],
        enrolledTotal: filteredClassroom['enrolled'],
        accessCode: filteredClassroom['code'],
      );

      _studentClasses[classroomId] = updatedClassroom;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }


  String removeClassroom(int classroomId) {
    var message = "Class deleted successfully";
    try {
      _studentClasses.removeWhere((c) => c.classroomId == classroomId);
    } catch (exception) {
      message = "Deletion unsuccessful";
    }
    notifyListeners();
    return message;
  }

  List<Classroom> _studentClasses = [
    Classroom(
      classroomId: 0,
      classroomTitle: 'Dhaka College (HSC): Physics-I',
      classroomSection: 'A',
      classroomGrade: 'Morning',
      accessCode: 'neqy71',
      enrolledTotal: 21,
    ),
    Classroom(
      classroomId: 1,
      classroomTitle: 'Govt. Science College: Physics-II',
      classroomSection: 'B',
      classroomGrade: 'Day',
      accessCode: '9xmHaq',
      enrolledTotal: 29,
    ),
    Classroom(
      classroomId: 2,
      classroomTitle: 'Dhaka Residential: Physics-II',
      classroomSection: 'F',
      classroomGrade: 'Day',
      accessCode: 'S5f1f5',
      enrolledTotal: 33,
    ),
    Classroom(
      classroomId: 3,
      classroomTitle: 'City College: Physics-I',
      classroomSection: 'B',
      classroomGrade: 'Day',
      accessCode: 'Dxd54d',
      enrolledTotal: 70,
    ),
    Classroom(
      classroomId: 4,
      classroomTitle: 'Holy Cross College: Physics-I',
      classroomSection: 'A',
      classroomGrade: 'Morning',
      accessCode: 'es4Q8s',
      enrolledTotal: 65,
    ),
    Classroom(
      classroomId: 5,
      classroomTitle: 'Scholastica: Physics-I',
      classroomSection: 'C',
      classroomGrade: 'Morning',
      accessCode: '45d56x',
      enrolledTotal: 65,
    ),
    Classroom(
      classroomId: 6,
      classroomTitle: 'Scholasticadvd: Physicscsc-I',
      classroomSection: 'C',
      classroomGrade: 'Mocscrning',
      accessCode: '45d56x',
      enrolledTotal: 65,
    ),
  ];
}
