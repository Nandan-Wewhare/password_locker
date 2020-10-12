import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:password_locker/constants.dart';
import 'package:password_locker/widgets/slidable_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selected = kSocial.first;

  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dialogFormKey = GlobalKey<FormState>();
  final _pswdController = TextEditingController();
  final _cnfPswdController = TextEditingController();
  final _otherController = TextEditingController();
  final storage = FlutterSecureStorage();

  List<SlidableCard> cards = [];

  String normalValidator(String value) {
    if (value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String dropdownValidator(String value) {
    if (value == kSocial.first) {
      return 'Invalid Social account';
    }
    return null;
  }

  Widget drawCard(String title, String password, Widget icon) {
    return SlidableCard(icon: icon, password: password, title: title);
  }

  void showCards() async {
    // function to populate the list of cards from DB
    Map<String, String> x;
    x = await storage.readAll();
    x.forEach((key, value) {
      if (key.startsWith('k')) {
        if (kSocial.indexWhere((element) => element == key) == -1) {
          setState(
              () => cards.add(drawCard(key.substring(1), value, kIcons.last)));
        } else {
          setState(() => cards.add(drawCard(key.substring(1), value,
              kIcons[kSocial.indexWhere((element) => element == key)])));
        }
      }
    });
  }

  @override
  void initState() {
    showCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.add),
              onPressed: () {
                Scaffold.of(context).showBottomSheet(
                    (context) => Container(
                          padding: const EdgeInsets.only(
                              top: 20, right: 12, left: 12, bottom: 12),
                          height: MediaQuery.of(context).size.height / 2.5,
                          width: double.infinity,
                          child: Form(
                            key: _formkey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.deepOrange),
                                    child: DropdownButtonFormField(
                                        validator: dropdownValidator,
                                        focusColor: Colors.deepOrange,
                                        iconSize: 30,
                                        value: _selected,
                                        items: kSocial.map((social) {
                                          return DropdownMenuItem<String>(
                                            child: Center(
                                              child: Text(
                                                social,
                                              ),
                                            ),
                                            value: social,
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() => _selected = value);
                                        }),
                                  ),
                                  TextFormField(
                                    controller: _pswdController,
                                    validator: normalValidator,
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0)),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _cnfPswdController,
                                    validator: normalValidator,
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 46,
                                    child: RaisedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState.validate() &&
                                            _pswdController.text ==
                                                _cnfPswdController.text) {
                                          if (_selected == kSocial.last) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  // open dialog for other account
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4,
                                                    child: Form(
                                                      key: _dialogFormKey,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    _otherController,
                                                                validator:
                                                                    normalValidator,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18),
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Social Account Name',
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          6.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            RaisedButton(
                                                              color: Colors
                                                                  .deepOrange,
                                                              onPressed:
                                                                  () async {
                                                                if (_dialogFormKey
                                                                    .currentState
                                                                    .validate()) {
                                                                  await storage.write(
                                                                      key: 'k' +
                                                                          _otherController
                                                                              .text,
                                                                      value: _pswdController
                                                                          .text);
                                                                }

                                                                _scaffoldKey
                                                                    .currentState
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    behavior:
                                                                        SnackBarBehavior
                                                                            .floating,
                                                                    content:
                                                                        Text(
                                                                      'Added',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                  ),
                                                                );
                                                                setState(() {
                                                                  cards.add(drawCard(
                                                                      _otherController
                                                                          .text,
                                                                      _pswdController
                                                                          .text,
                                                                      kIcons
                                                                          .last));
                                                                  _otherController
                                                                      .clear();
                                                                  _pswdController
                                                                      .clear();
                                                                  _cnfPswdController
                                                                      .clear();
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                                  Text('Done'),
                                                            )
                                                          ]),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            await storage.write(
                                                key: 'k' + _selected,
                                                value: _pswdController.text);

                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                  'Added',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            setState(() {
                                              cards.add(drawCard(
                                                  _selected,
                                                  _pswdController.text,
                                                  kIcons[kSocial.indexWhere(
                                                      (element) =>
                                                          element ==
                                                          _selected)]));
                                              _otherController.clear();
                                              _pswdController.clear();
                                              _cnfPswdController.clear();
                                            });
                                            Navigator.of(context).pop();
                                          }
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Text(
                                                'PIN not matching',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration: Duration(seconds: 3),
                                              backgroundColor: Colors.blue,
                                            ),
                                          );
                                        }
                                      },
                                      child: Text('Proceed'),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ));
              });
        },
      ),
      appBar: AppBar(
        title: Text('Password Locker'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: cards),
      ),
    );
  }
}
