import 'package:flutter/material.dart';
import 'package:loginregister/LoginPage.dart';
import 'customdropdownlist.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedAccount="";
  List<String> types=['Doctor','Student'];
  final select=TextEditingController();
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
                          image: AssetImage('images/gbb.jpg'), fit: BoxFit.cover
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 40),
                  child: Text('REGISTER', style: TextStyle(letterSpacing: 10,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
                ),
                Column(
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'First Name',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Full Name'
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Email'
                                  ),
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
                                          _obSecure ? Icons.visibility : Icons
                                              .visibility_off, size: 25,
                                        ),
                                        onPressed: () {
                                          onHideSecure();
                                        },
                                      )
                                  ),
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
                                          _obSecure ? Icons.visibility : Icons
                                              .visibility_off, size: 25,
                                        ),
                                        onPressed: () {
                                          onHideSecure();
                                        },
                                      )
                                  ),
                                ),
                              CustomDropList(
                                controller: select,
                                hint: 'Select Account Type',

                                accountTypes: types,
                                onChange: (value){
                                  setState(() {
                                    selectedAccount=value;
                                  });

                                },


                              ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                ),

                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                                  },
                                  color: Colors.blue,
                                  child: Text('Sign Up', style: TextStyle(
                                      color: Colors.white, fontSize: 20),),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

