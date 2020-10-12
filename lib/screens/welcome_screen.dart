import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_locker/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:password_locker/pref.dart';
import 'package:password_locker/screens/pinput_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var _selected = kQuestions[0];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _securityAnsController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _cnfPinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Status status = Status();

  String pinValidator(String value) {
    String pattern = r'^[0-9]{1,6}$';
    RegExp reg = RegExp(pattern);
    if (value.length == 0) {
      return 'PIN required';
    } else if (!reg.hasMatch(value)) {
      return 'Not a 6 digit PIN';
    }
    return null;
  }

  String textValidator(String value) {
    String pattern = r'^[a-zA-Z ]*$';
    RegExp reg = RegExp(pattern);
    if (value.length == 0) {
      return 'Required field';
    } else if (!reg.hasMatch(value)) {
      return 'Enter a valid text';
    }
    return null;
  }

  String dropdownValidator(String value) {
    if (value == kQuestions.first) {
      return 'Security Question Required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/welcomebg.jpg'),
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            primary: true,
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: size.height / 40),
                    Text(
                      "Please setup your app.",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: size.height / 12.3),
                    TextFormField(
                      validator: textValidator,
                      controller: _nameController,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Enter Full Name',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                            color: Colors.deepOrange,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Center(
                        child: DropdownButtonFormField(
                          validator: dropdownValidator,
                          iconEnabledColor: Colors.deepOrange,
                          focusColor: Colors.deepOrange,
                          iconSize: 30,
                          value: _selected,
                          items: kQuestions.map((ques) {
                            return DropdownMenuItem<String>(
                              child: Center(
                                child: Text(
                                  ques,
                                ),
                              ),
                              value: ques,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() => _selected = value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 40),
                    TextFormField(
                      validator: textValidator,
                      controller: _securityAnsController,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Security Q. Answer',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 40),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _pinController,
                      validator: pinValidator,
                      maxLength: 6,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Enter 6 digit Pin',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 40),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _cnfPinController,
                      validator: pinValidator,
                      maxLength: 6,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Confirm Pin',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 7.27),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (_pinController.text == _cnfPinController.text) {
                              final storage = FlutterSecureStorage();
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Please Wait...',
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ));
                              await storage.write(
                                  key: 'name', value: _nameController.text);
                              await storage.write(
                                  key: 'question', value: _selected);
                              await storage.write(
                                  key: 'answer',
                                  value: _securityAnsController.text);
                              await storage.write(
                                  key: 'pin', value: _pinController.text);
                              status.setRegistered();
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => PinputScreen()));
                            } else {
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'PIN not matching',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          }
                        },
                        child: Text('Next', textScaleFactor: 1.8),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
