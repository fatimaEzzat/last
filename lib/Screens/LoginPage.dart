import 'package:flutter/material.dart';
import 'package:loginregister/Screens/RegisterPage.dart';
import '../components/lettercontainer.dart';
import '../constants.dart';
import 'doctor_home_page.dart';
import 'package:loginregister/models/userlogin.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _obSecure = true;
  final _formState = GlobalKey<FormState>();
  var _userLogin = UserLogin(userEmail: '', userPassword: '');

  void authenticate() {
    final isValid = _formState.currentState.validate();
    if (!isValid) {
      return;
    }
    _formState.currentState.save();
    Navigator.of(context).pushNamed(HomePage.routeName);
//    Navigator.push(context, MaterialPageRoute(
//        builder: (context) => HomePage()));
  }
  void authenticate1() {
    final isValid = _formState.currentState.validate();
    if (!isValid) {
      return;
    }
    _formState.currentState.save();

//    Navigator.push(context, MaterialPageRoute(
//        builder: (context) => HomePage()));
  }

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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                              'Welcome in College App,',
                              style: KTitleDescriptionStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70, left: 105),
                        child: Row(
                          children: <Widget>[
                            LetterContainer(
                              letter: 'L',
                            ),
                            LetterContainer(
                              letter: 'O',
                            ),
                            LetterContainer(
                              letter: 'G',
                            ),
                            LetterContainer(
                              letter: 'I',
                            ),
                            LetterContainer(
                              letter: 'N',
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _formState,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 50, top: 40),
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
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
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please, provide an email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (emailValue) {
                                          _userLogin = UserLogin(
                                            userEmail: emailValue,
                                            userPassword:
                                            _userLogin.userPassword,
                                          );
                                        }),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      obscureText: _obSecure,
                                      style: TextStyle(color: Colors.blue),
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: KhintStyle,
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
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please, provide a password';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 160),
                                      child: FlatButton(
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 320,
                                      child: RaisedButton(
                                        onPressed:
                                          authenticate,
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                    ),
                                    Text(
                                      'Or',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                    ),
                                    FlatButton(
                                      onPressed:(){
                                        Navigator.of(context).pushNamed(RegisterPage.routeName);
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
                        ),
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
