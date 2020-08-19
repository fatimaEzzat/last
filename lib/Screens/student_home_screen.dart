import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:loginregister/components/student_class.dart';
import 'package:loginregister/constants.dart';
import 'package:loginregister/models/UserAccount.dart';
import 'package:provider/provider.dart';
import 'package:loginregister/providers/classrooms.dart';
import 'package:loginregister/models/classroom.dart';
import 'package:loginregister/components/Classroom_Items.dart';
import 'dart:async';
import 'package:loginregister/components/appbar.dart';
import 'package:loginregister/components/header.dart';
import 'package:loginregister/providers/UserAccounts.dart';

enum AppBarAction {
  Refresh,
  Feedback,
}

class StudentHomePage extends StatefulWidget {
  static const routeName = '/student';

  @override
  _StudentHomePage createState() => _StudentHomePage();
}

class _StudentHomePage extends State<StudentHomePage> {
  var _isInit = true;
  var _isLoading = false;

  Future<void> _refreshClasses(BuildContext context) async {
    await Provider.of<Classrooms>(context, listen: false)
        .fetchAndSetClassroom();
  }

  void triggerProgressIndicator() {
    setState(() {
      _isLoading = true;
    });

    Timer timer = new Timer(
        new Duration(seconds: kMaxContentFetchingTime, milliseconds: 200), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      triggerProgressIndicator();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  TextEditingController _textFieldController = TextEditingController();

  creatDialog(BuildContext context) {
    final classes = Provider.of<Classrooms>(context).classrooms_student;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text('Join to the class'),
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(hintText: "Enter Code"),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('OK'),
          onPressed: () {
            if (check(_textFieldController.text)) {
//              Provider.of<Classrooms>(
//                context,
//                listen: false,
//              ).addClassroom(_selectedClassroomMap);
              Navigator.of(context).pop();
            } else {
              print('incorrect code');
            }
          },
        )
      ],
    );
  }

  bool check(String code) {
    final classes = Provider.of<Classrooms>(context, listen: false).classrooms;
    for (var item = 0; item < classes.length; item++) {
      if (code == classes[item].accessCode) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final classes = Provider.of<Classrooms>(context).classrooms_student;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => creatDialog(context),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Header(),
          expandedHeight: 200.0,
          pinned: true,
//          title: Text(
//            'Collage App',
//            style: TextStyle(fontFamily: 'Sans', fontSize: 40.0),
//          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Hello,",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 28.0)),
                      SizedBox(
                        width: 10,
                      ),
                      Text('fatma',
////                          Provider.of<UserAccounts>(context, listen: false)
//                              .findById(1)
//                              .userFullName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 28.0)),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Have a nice day !')
                ],
              ),
            ),
            background: Image.asset(
              'images/gbb.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                  ),
                )
              : RefreshIndicator(
                  backgroundColor: Colors.grey[800],
                  color: Colors.orangeAccent,
                  onRefresh: () => _refreshClasses(context),
                  child: ListView.builder(
                    itemCount: classes.length,
                    itemBuilder: (ctx, index) =>
                    Student_Class(
                      title: classes[index].classroomTitle,
                    ),
                  ),
                ),
        )
      ]),
    );

//      appBar: AppBar(
//        backgroundColor: Colors.blue,
//        title: Text(
//          'College App',
//          style: kAppBarTitleTextStyle,
//          textAlign: TextAlign.center,
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.add,
//              color: Colors.white,
//            ),
//            onPressed: () {
//              creatDialog(context);
//            },
//          ),
//          PopupMenuButton(
//            icon: Icon(Icons.more_vert),
//            itemBuilder: (ctx) => [
//              PopupMenuItem(
//                child: Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.refresh,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                    SizedBox(
//                      width: 10.0,
//                    ),
//                    Text('Refresh'),
//                  ],
//                ),
//                value: AppBarAction.Refresh,
//              ),
//              PopupMenuItem(
//                child: Row(
//                  children: <Widget>[
//                    Icon(
//                      Icons.all_inclusive,
//                      color: Colors.teal,
//                    ),
//                    SizedBox(
//                      width: 10.0,
//                    ),
//                    Text('Send Feedback'),
//                  ],
//                ),
//                value: AppBarAction.Feedback,
//              ),
//            ],
//            onSelected: (value) {
//              if (value == AppBarAction.Refresh) {
//                triggerProgressIndicator();
//              }
//            },
//          ),
//        ],
//        flexibleSpace: Container(
//          child: Column(
//            children: <Widget>[Text('name')],
//          ),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          showDialog(
//            context: context,
//            builder: (context) => creatDialog(context),
//          );
//        },
//        child: Icon(
//          Icons.add,
//          color: Colors.white,
//        ),
//        backgroundColor: Colors.blue,
//      ),
//      body: _isLoading
//          ? Center(
//              child: CircularProgressIndicator(
//                strokeWidth: 5.0,
//              ),
//            )
//          : RefreshIndicator(
//              backgroundColor: Colors.grey[800],
//              color: Colors.orangeAccent,
//              onRefresh: () => _refreshClasses(context),
//              child: ListView.builder(
//                itemCount: classes.length,
//                itemBuilder: (ctx, index) => Student_Class(
//                  title: classes[index].classroomTitle,
//                ),
//              ),
//            ),
//    );
  }
}
