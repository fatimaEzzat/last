import 'package:flutter/material.dart';
import 'package:loginregister/providers/UserAccounts.dart';
import 'package:provider/provider.dart';
class Profile extends StatefulWidget {
  static const routeName = '/profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserAccounts>(context, listen: false)
        .findById('0');
    String name=user.userFullName;
    String type=user.Type;

    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                color: Colors.blue.withOpacity(0.7),
              ),
              clipper: getClipper(),
            ),
            Positioned(
                width: 450.0,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ])),
                    SizedBox(height:120.0),
                    Text(
                      type=='Doctor'?
                      'Dr:$name':
                      name,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 15.0),
//                    Text(
//                      'Subscribe guys',
//                      style: TextStyle(
//                          fontSize: 17.0,
//                          fontStyle: FontStyle.italic,
//                          fontFamily: 'Montserrat'),
//                    ),
                    SizedBox(height: 25.0),
                    Container(
                        height: 50.0,
                        width: 220.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.blue,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Edit Name',
                                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat',fontSize:24.0),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 25.0),
                    Container(
                        height: 50.0,
                        width: 220.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.redAccent,
                          color: Colors.red,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Log out',
                                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat',fontSize:24.0),
                              ),
                            ),
                          ),
                        ))
                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height /2.5);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  }

