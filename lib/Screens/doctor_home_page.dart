import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginregister/Screens/modify_classes.dart';
import 'package:loginregister/constants.dart';
import 'package:provider/provider.dart';
import 'package:loginregister/providers/classrooms.dart';
import 'package:loginregister/components/Classroom_Items.dart';
import 'dart:async';
enum AppBarAction {
  Refresh,
  Feedback,
}


class HomePage extends StatefulWidget {
  static const routeName = '/classroom';
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}


class _DoctorHomePageState extends State<HomePage> {
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

    Timer timer = new Timer(new Duration(seconds: kMaxContentFetchingTime, milliseconds: 200), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Classrooms>(context).fetchAndSetClassroom().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  final classes = Provider.of<Classrooms>(context).classrooms;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: Text(
            'College App',
            style: kAppBarTitleTextStyle,
            textAlign: TextAlign.center,
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ModifyClassroomScreen()));
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) =>
            [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.refresh,
                      color: Colors.deepOrangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Refresh'),
                  ],
                ),
                  value: AppBarAction.Refresh,
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.all_inclusive,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Send Feedback'),
                  ],
                ),
                  value: AppBarAction.Feedback,
              ),
            ],
              onSelected: (value) {
                if (value == AppBarAction.Refresh) {
                  triggerProgressIndicator();
                }
              },
          ),
        ],
      ),

    body:_isLoading?
        Center(
      child: CircularProgressIndicator(

        strokeWidth: 5.0,
      ),
    ):
    RefreshIndicator(
      backgroundColor: Colors.grey[800],
      color: Colors.orangeAccent,
      onRefresh: () => _refreshClasses(context),
      child:  ListView.builder(
        itemCount: classes.length,
        itemBuilder: (ctx, index) => ClassroomItems(
          id: classes[index].classroomId,
          title: classes[index].classroomTitle,
          section: classes[index].classroomSection,
          accessCode: classes[index].accessCode,
          enrolledTotal: classes[index].enrolledTotal,
          shift: classes[index].classroomShift,
          lectures: classes[index].lec_num,
        ),
      ),
    ),

    );
  }
}
