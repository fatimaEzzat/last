import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/hp/AndroidStudioProjects/LoginRegisterPage/lib/Screens/LoginPage.dart';
import '../components/customdropdownlist.dart';
import 'doctor_home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedAccount = "";
  List<String> types = ['Doctor', 'Student'];
  final select = TextEditingController();
  var _obSecure = true;
  final _formState = GlobalKey<FormState>();

  //creat account functionality.
  void creatAccount() {
    final isValid = _formState.currentState.validate();
    if (!isValid) {
      return;
    }
    _formState.currentState.save();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

//check state of pass word hidden or not.
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
                          image: AssetImage('images/gbb.jpg'),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 40),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        letterSpacing: 10,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Form(
                  key: _formState,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 150, bottom: 50, left: 20, right: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 30, right: 50, bottom: 50),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'First Name',
                                    ),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please, Enter First Name';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Full Name'),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please, Enter Full Name ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Email'),
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please, Enter Email ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                  ),
                                  TextFormField(
                                    obscureText: _obSecure,
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obSecure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            onHideSecure();
                                          },
                                        )),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please, Enter Email ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                  ),
                                  TextFormField(
                                    obscureText: _obSecure,
                                    decoration: InputDecoration(
                                        hintText: 'Confirm Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obSecure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            onHideSecure();
                                          },
                                        )),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please, Enter Email ';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                  ),
                                   TextFormField(
                                    controller: select,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Account type',
                                      suffixIcon: PopupMenuButton<String>(
                                        icon: const Icon(Icons.arrow_drop_down),
                                        onSelected: (String value) {
                                          select.text = value;
                                          selectedAccount=value;
                                        },
                                        itemBuilder: (BuildContext context) {
                                          return types
                                              .map<PopupMenuItem<String>>(
                                                  (String value) {
                                            return new PopupMenuItem(
                                                child: new Text(value),
                                                value: value);
                                          }).toList();
                                        },
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please, Enter Account type';
                                      } else {
                                        return null;
                                      }
                                    },

                                 ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                  ),
                                  RaisedButton(
                                    onPressed: creatAccount,
                                    color: Colors.blue,
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
