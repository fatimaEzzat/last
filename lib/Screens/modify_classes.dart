import 'dart:convert';
import 'dart:typed_data';

import 'package:loginregister/Screens/Qr_Generator.dart';
import 'package:loginregister/constants.dart';
import 'package:loginregister/providers/classrooms.dart';
import 'doctor_home_page.dart';
import 'package:loginregister/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';
import 'Qr_Generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ModifyClassroomScreen extends StatefulWidget {
  static const routeName = '/modify';

  @override
  _ModifyClassroomScreenState createState() => _ModifyClassroomScreenState();
}

class _ModifyClassroomScreenState extends State<ModifyClassroomScreen> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;

  @override
  initState() {
    super.initState();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();
  }

  var _isInit = true;
  final _form = GlobalKey<FormState>();
  final _sectionFocusNode = FocusNode();

  Map _selectedClassroomMap = {
    'id': -1,
    'code': '',
    'enrolled': -1,
    'title': '',
    'section': '',
    'grade': '',
    'qr': '',
    'lec_num':''
  };

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      final selectedClassroomId =
          ModalRoute.of(context).settings.arguments as String;
      if (selectedClassroomId != null) {
        final selectedClassroom =
            Provider.of<Classrooms>(context).findById(selectedClassroomId);

        _selectedClassroomMap['id'] = selectedClassroom.classroomId;
        _selectedClassroomMap['code'] = selectedClassroom.accessCode;
        _selectedClassroomMap['enrolled'] = selectedClassroom.enrolledTotal;
        _selectedClassroomMap['title'] = selectedClassroom.classroomTitle;
        _selectedClassroomMap['section'] = selectedClassroom.classroomSection;
        _selectedClassroomMap['grade'] = selectedClassroom.classroomYear;
        _selectedClassroomMap['qr'] = selectedClassroom.qr_text;
        _selectedClassroomMap['lec_num']=selectedClassroom.lec_num;
      } else {
        _selectedClassroomMap['grade'] = "Pre";
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void saveForm() {

    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();

    if (_selectedClassroomMap['id'] == -1) {
      Provider.of<Classrooms>(
        context,
        listen: false,
      ).addClassroom(_selectedClassroomMap);
    } else {
      Provider.of<Classrooms>(
        context,
        listen: false,
      ).updateClassroom(null, '');
    }
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                    size: 28.0,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Qr_Generator.routeName);
                  }),
              IconButton(
                icon: Icon(
                  Icons.save,
                ),
                onPressed: saveForm,
              ),
            ],
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: ListView(
        children: <Widget>[
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(25.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _selectedClassroomMap['id'] == -1
                                ? 'Create Classroom'
                                : 'Edit Classroom',
                            style: TextStyle(
                              fontFamily: 'Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        initialValue: _selectedClassroomMap['title'],
                        decoration: InputDecoration(
                          labelText: 'Classroom Title',
                          labelStyle: kSansLabel,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please, provide a title';
                          } else {
                            return null;
                          }
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_sectionFocusNode);
                        },
                        onSaved: (value) {
                          _selectedClassroomMap['title'] = value;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        initialValue: _selectedClassroomMap['section'],
                        focusNode: _sectionFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Section',
                          labelStyle: kSansLabel,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please, provide a section';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _selectedClassroomMap['section'] = value;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        initialValue: _selectedClassroomMap['lec_num'],
                        decoration: InputDecoration(
                          labelText: 'Classroom Lecturs',
                          labelStyle: kSansLabel,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please, provide a Lectures number';
                          } else {
                            return null;
                          }
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(_sectionFocusNode);
                        },
                        onSaved: (value) {
                          _selectedClassroomMap['lec_num'] = value;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Year',
                        style: kSansLabelTitle,
                      ),
                      RadioButtonGroup(
                        labels: <String>[
                          "Pre",
                          "1 st",
                          "2 st",
                          "3 st",
                          "4 st",
                        ],
                        picked: _selectedClassroomMap['grade'].toString(),
                        labelStyle: kSansRadio,
                        onSelected: (String selected) => setState(() {
                          _selectedClassroomMap['grade'] = selected;
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _qrCodeWidget(this.bytes, context),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                TextFormField(
//                  initialValue: _selectedClassroomMap['qr'],
                  controller: this._inputController,
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.go,
//                        onSubmitted: (value) => _generateBarCode(value),
                  onSaved: (value) {
                    _selectedClassroomMap['qr'] = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please, provide a qr text';
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.text_fields),
//                          helperText: 'Please input your code to generage qrcode image.',
                    hintText: 'Please Input Your Code',
                    hintStyle: TextStyle(fontSize: 15),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
//
                SizedBox(height: 20),
                this._buttonGroup(),
                SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qrCodeWidget(Uint8List bytes, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 6,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.verified_user, size: 18, color: Colors.green),
                  Text('  Generate Qrcode', style: TextStyle(fontSize: 15)),
                  Spacer(),
                  Icon(Icons.more_vert, size: 18, color: Colors.black54),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 190,
                    child: bytes.isEmpty
                        ? Center(
                            child: Text('Empty code ... ',
                                style: TextStyle(color: Colors.black38)),
                          )
                        : Image.memory(bytes),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7, left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            child: Text(
                              'remove',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                              textAlign: TextAlign.left,
                            ),
                            onTap: () =>
                                this.setState(() => this.bytes = Uint8List(0)),
                          ),
                        ),
                        Text('|',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black26)),
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () async {
                              final success =
                                  await ImageGallerySaver.saveImage(this.bytes);
                              SnackBar snackBar;
                              if (success) {
                                snackBar = new SnackBar(
                                    content:
                                        new Text('Successful Preservation!'));
                                Scaffold.of(context).showSnackBar(snackBar);
                              } else {
                                snackBar = new SnackBar(
                                    content: new Text('Save failed!'));
                              }
                            },
                            child: Text(
                              'save',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 2, color: Colors.black26),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.history, size: 16, color: Colors.black38),
                  Text('  Generate History',
                      style: TextStyle(fontSize: 14, color: Colors.black38)),
                  Spacer(),
                  Icon(Icons.chevron_right, size: 16, color: Colors.black38),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonGroup() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 120,
            child: InkWell(
              onTap: () => _generateBarCode(this._inputController.text),
              child: Card(
                child: Column(
                  children: <Widget>[
//                  Expanded(
//                    flex: 2,
//                    child: Image.asset('images/generate_qrcode.png'),
//                  ),
                    Divider(height: 20),
                    Expanded(flex: 1, child: Text("Generate")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

//  Future _scan() async {
//    String barcode = await scanner.scan();
//    this._outputController.text = barcode;
//  }

//Future _scanPhoto() async {
//  String barcode = await scanner.scanPhoto();
//  this._outputController.text = barcode;
//}

//  Future _scanPath(String path) async {
//    String barcode = await scanner.scanPath(path);
//    this._outputController.text = barcode;
//  }

//  Future _scanBytes() async {
//    File file = await ImagePicker.pickImage(source: ImageSource.camera);
//    Uint8List bytes = file.readAsBytesSync();
//    String barcode = await scanner.scanBytes(bytes);
//    this._outputController.text = barcode;
//  }

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }
}
