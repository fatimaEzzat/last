import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginregister/Screens/profile.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Collage App',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 25.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(Profile.routeName);
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  FontAwesomeIcons.userCircle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
