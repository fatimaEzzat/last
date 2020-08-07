import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Classroom {
  final int classroomId;
  final String accessCode;
  String classroomTitle;
  String classroomSection;
  String classroomShift;
  int enrolledTotal;

  Classroom({
    this.classroomId,
    this.accessCode,
    this.enrolledTotal,
    @required this.classroomTitle,
    @required this.classroomSection,
    @required this.classroomShift,
  });
 }