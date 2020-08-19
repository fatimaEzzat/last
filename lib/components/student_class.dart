import 'dart:async';
import 'dart:math';
import 'package:loginregister/providers/classrooms.dart';
import 'package:loginregister/Screens/modify_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:loginregister/constants.dart';
import 'package:loginregister/Screens/attendance.dart';
import 'package:loginregister/models/classroom.dart';

class Student_Class extends StatefulWidget {
  final String id;
  final String title;
  final String accessCode;


  Student_Class({
    @required this.id,
    @required this.title,
    @required this.accessCode,
  });

  @override
  _Student_ClassState createState() => _Student_ClassState();
}

class _Student_ClassState extends State<Student_Class> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animationController.repeat();
  }

  stopRotation(){
    animationController.stop();
  }

  startRotation(){
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final st_class = Provider.of<Classroom>(context, listen: false);
    stopRotation();

    return Dismissible(
      key: ValueKey(widget.id),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to remove from the classes?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                ),
              ],
            ));
      },
      onDismissed: (direction) {
        final message =
        Provider.of<Classrooms>(context, listen: false).removeClassroom(widget.id);

        Scaffold.of(context).showSnackBar(
          new SnackBar(
            backgroundColor: Colors.black54,
            content: Row(
              children: <Widget>[
                Icon(Icons.delete_outline, color: Colors.deepOrangeAccent,),
                SizedBox(width: 10.0,),
                Text(
                  message,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        );
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 4.0,
        ),
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushReplacementNamed(ModifyClassroomScreen.routeName);

        },
        child: Container(
          height: 100.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 10.0,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: 184.0,
                margin: EdgeInsets.only(left:20.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Color(0xFF333366)
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 35.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  onPressed: () {

                  },
                  color: Colors.white,
                  splashColor: Theme.of(context).accentColor,
                  onLongPress: () {
                    startRotation();
                    Timer timer = new Timer(new Duration(seconds: 1, milliseconds: 300,), () {
                      Navigator.of(context).pushNamed(Attendance.routeName,);
                      print('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn$widget.id');
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 16.0),
                    constraints: BoxConstraints.expand(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.title}",
                          style: TextStyle(
                            fontFamily: 'Sans',
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0,),






                    ]
                    ),
                  ),
                ),
              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 5.0),
//                alignment: FractionalOffset.centerLeft,
//                child: AnimatedBuilder(
//                  animation: animationController,
//                  builder: (BuildContext context, Widget _widget) {
//                    return Transform.rotate(
//                      angle: animationController.value * 50.3,
//                      child: _widget,
//                    );
//                  },
////                child: Container(
////                  child: Image(
////                    image: AssetImage(
////                        "assets/images/planet${new Random().nextInt(5)}.png"),
////                    height: 108.0,
////                    width: 108.0,
////                  ),
////                ),
//                ),
//              ),

            ],
          ),
        ),
      ),
    );
  }
}
