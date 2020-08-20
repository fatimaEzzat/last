import 'package:loginregister/Screens/doctor_home_page.dart';
import 'package:loginregister/Screens/modify_classes.dart';
import 'package:flutter/material.dart';
import 'package:loginregister/Screens/doctor_home_page.dart';
import 'package:loginregister/Screens/profile.dart';

class DrawerWidget extends StatelessWidget {
  Widget buildListTile({
    String title,
    IconData icon,
    BuildContext context,
    Function tapHandler,
    Color iconColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Sans',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 180.0,
            width: double.infinity,
            padding: EdgeInsets.only(top: 25.0, left: 15.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Collage App',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: 'Righteous',
              ),
            ),
          ),
          buildListTile(
            title: 'Classrooms',
            icon: Icons.assignment_ind,
            tapHandler: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomePage.routeName);
            },
            context: context,
            iconColor: Colors.green,
          ),
          buildListTile(
            title: 'Add new',
            icon: Icons.add_comment,
            tapHandler: () {
              Navigator.of(context)
                  .pushReplacementNamed(ModifyClassroomScreen.routeName);
            },
            context: context,
            iconColor: Colors.orange,
          ),
          buildListTile(
            title: 'My profile',
            icon: Icons.face,
            tapHandler: () {
              Navigator.of(context).pushNamed(Profile.routeName);

            },
            context: context,
            iconColor: Colors.green,
          ),
          buildListTile(
            title: 'Send Feedback',
            icon: Icons.feedback,
            tapHandler: () {
            },
            context: context,
            iconColor: Colors.grey[800],
          ),
        ],
      ),
    );
  }
}
