import 'package:flutter/material.dart';
import 'package:loginregister/RegisterPage.dart';
import 'lettercontainer.dart';
import 'constants.dart';
import 'constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _obSecure = true;

  void onHideSecure() {
    if (_obSecure == true) {
      setState(() {
        _obSecure = false;
      });
    } else {
      setState(() {
        _obSecure = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/gb.png'), fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: KcolumPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Hello,',
                              style: KBigTitleStyle,
                            ),
                            Text(
                              'Welcome in My Apps,',
                              style:KTitleDescriptionStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70, left: 105),
                        child: Row(
                          children: <Widget>[
                            LetterContainer(
                              letter:'L' ,),
                            LetterContainer(
                              letter:'O' ,),
                            LetterContainer(
                              letter:'G' ,),
                            LetterContainer(
                              letter:'I' ,),
                            LetterContainer(
                              letter:'N' ,),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, top: 40),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    style: TextStyle(color: Colors.blue),
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          color: Colors.blue,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    obscureText: _obSecure,
                                    style: TextStyle(color: Colors.blue),
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle:KhintStyle,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obSecure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 35,
                                          ),
                                          onPressed: () {
                                            onHideSecure();
                                          },
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 160),
                                    child: FlatButton(
                                      child: Text('Forgot Password?', style: TextStyle(color: Colors.blue),),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 320,
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                  ),
                                  Text(
                                    'Or',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()));
                                    },
                                    color: Colors.blue,
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 45, top: 300),
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('W', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('E', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('L', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('C', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('O', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('M', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('E', style: TextStyle(fontSize: 30),),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 120, right: 5, top: 20),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('I', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 20),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('N', style: TextStyle(fontSize: 30),),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 80, right: 5, top: 20),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('A', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 20),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('P', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 20),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('P', style: TextStyle(fontSize: 30),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 20),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      color: Colors.blue,
                      child: Text('S', style: TextStyle(fontSize: 30),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

