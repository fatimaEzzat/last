import 'package:loginregister/providers/classrooms.dart';
import 'package:loginregister/Screens/doctor_home_page.dart';
import 'package:loginregister/Screens/LoginPage.dart';
import 'package:loginregister/Screens/modify_classes.dart';
import 'package:loginregister/Screens/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Classrooms(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eLuminous Mobile',
        theme: ThemeData(
          primaryColor: Colors.deepPurple[700],
          accentColor: Colors.deepOrangeAccent,
        ),
//        routes: {
//          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
//          LoginScreen.routeName: (ctx) => LoginScreen(),
//          ModifyClassroomScreen.routeName: (ctx) => ModifyClassroomScreen(),
//          ClassroomScreen.routeName: (ctx) => ClassroomScreen(),
//        },
        home: LoginPage(),
      ),
    );
  }
}
