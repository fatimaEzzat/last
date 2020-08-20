import 'package:flutter/material.dart';
import 'package:loginregister/Screens/LoginPage.dart';
import 'package:loginregister/Screens/Qr_Generator.dart';
import 'package:loginregister/Screens/RegisterPage.dart';
import 'package:loginregister/Screens/modify_classes.dart';
import 'package:loginregister/Screens/doctor_home_page.dart';
import 'package:loginregister/Screens/student_home_screen.dart';
import 'package:loginregister/Screens/attendance.dart';
import 'package:loginregister/components/student_class.dart';
//import 'package:loginregister/Screens/classRoomOverView.dart';
import 'package:loginregister/Screens/profile.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args=settings.arguments;
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) =>LoginPage(),);
      case '/register':
        return MaterialPageRoute(builder: (_) =>RegisterPage(),);
      case '/classroom':
        return MaterialPageRoute(builder: (_) =>HomePage(),);
      case '/modify':
        return MaterialPageRoute(builder: (_) =>ModifyClassroomScreen(),);
      case '/qr_generate' :
        return MaterialPageRoute(builder: (_) =>Qr_Generator(),);
      case '/student':
        return MaterialPageRoute(builder: (_) =>StudentHomePage(),);
      case '/attendance':
        return MaterialPageRoute(builder: (_) =>Attendance(),);
      case '/profile':
        return MaterialPageRoute(builder: (_) =>Profile(),);
//      case '/cart':
//        return MaterialPageRoute(builder: (_) =>ClassesOverviewScreen(),);



    }



  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

