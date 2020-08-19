import 'package:flutter/material.dart';
import 'package:loginregister/components/reusable_card.dart';
import 'package:loginregister/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginregister/providers/classrooms.dart';
import 'package:provider/provider.dart';

class Attendance extends StatefulWidget {
  static const routeName = '/attendance';

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
//    final classId =
//    ModalRoute.of(context).settings.arguments as String; // is the id!
//    final loadedClass =
//    Provider.of<Classrooms>(context, ).findByIdSt(classId);
//    print('0000000000000000000000000000000$classId');

//    return Scaffold(
//      /*appBar: AppBar(
//          title: Text(loadedProduct\.title),
//        ),*/
//      body: CustomScrollView(
//        slivers: <Widget>[
//          SliverAppBar(
//            expandedHeight: 300,
//            pinned: true,
//            flexibleSpace: FlexibleSpaceBar(
//              title: Text(loadedClass.classroomTitle),
//              background: Hero(
//                tag: loadedClass.classroomId,
//                child: Image.asset('images/gbb.jpg'),
//              ),
//            ),
//          ),
//          SliverList(
//            delegate: SliverChildListDelegate([
//              SizedBox(
//                height: 10.0,
//              ),
//              Text(
//                loadedClass.classroomTitle==null ? 'not found': loadedClass.classroomTitle,
//                textAlign: TextAlign.center,
//                style: TextStyle(color: Colors.grey, fontSize: 20.0),
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              Container(
//                padding: EdgeInsets.symmetric(horizontal: 10.0),
//                width: double.infinity,
//                child: Text(
//                  loadedClass.classroomId.toString(),
//                  textAlign: TextAlign.center,
//                  softWrap: true,
//                ),
//              ),
//              SizedBox(
//                height: 1000.0,
//              ),
//            ]),
//          ),
//        ],
//      ),
//    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Expanded(
              child: ReusableWidget(
                cardChild: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Class Information',
                        style: TextStyle(
                            letterSpacing: 10,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.title,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Title:Linear Algebra :(Math)',
                            style: KTextStyle,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.people,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Section:(10)',
                            style: KTextStyle,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.brightness_high,
                            size: 40,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            'Morning',
                            style: KTextStyle,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.check_circle,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Attendance Times: 2',
                            style: KTextStyle,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.book,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Lecuture Number: 10',
                            style: KTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                myColor: Colors.blue,
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ReusableWidget(
                cardChild: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.solidLightbulb,
                            size: 40,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Tip  Of The Day',
                            style: TextStyle(
                              letterSpacing: 3,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            ' Focus on developing you practical Computer Science skills',
                            style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            ' What do you learn during Computer Science degrees? Most IT courses are not all theory compared to courses from other types of degrees, like Sociology or Economics. Even if Computer Science and Information Technology degrees include theoretical classes, their approach is far more practical.',
                            style: TextStyle(
                              fontFamily: 'Sans',
                              fontSize: 20,

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                myColor: Colors.blue,
              ),
            ),
          ),
//          Container(
//            child: Expanded(
//              child: ReusableWidget(
//                cardChild: Text(
//                 'Section',
//                  style: TextStyle(color: Colors.blue),
//                ),
//                myColor: Colors.blue,
//              ),
//            ),
//          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                child: Center(
                    child: Text(
                  'Take Atendance',
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                )),
                color: Colors.blue,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
