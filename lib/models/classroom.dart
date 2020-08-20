import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Classroom extends ChangeNotifier{
  final String classroomId;
  final String accessCode;
  String classroomTitle;
  String classroomSection;
  String classroomYear;
  int enrolledTotal;
  String qr_text;
  String classroomShift;
  String lec_num;

  Classroom({
    this.classroomId,
    this.accessCode,
    this.enrolledTotal,
    this.qr_text,
    @required this.classroomShift,
    @required this.classroomTitle,
    @required this.classroomSection,
    @required this.classroomYear,
    @required this.lec_num,

  });
  String getTitle(){
    return classroomTitle;
  }

}