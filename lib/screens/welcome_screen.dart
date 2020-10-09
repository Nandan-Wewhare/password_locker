
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/ad/cf/ef/adcfef3a3120edd9e4d1a344e24fe494.jpg'))),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              primary: true,
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
                  SizedBox(height: size.height/40),
                  Text("Please setup your app.",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(height: size.height/12.3),
                  TextFormField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Enter Full Name',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        )),
                  ),
                  SizedBox(height: size.height/40),
                  TextFormField(
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Security Q. Answer',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        )),
                  ),
                  SizedBox(height: size.height/40),
                  TextFormField(
                    maxLength: 6,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Enter 6 digit Pin',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        )),
                  ),
                  SizedBox(height: size.height/40),
                  TextFormField(
                    maxLength: 6,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Confirm Pin',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0)),
                        )),
                  ),
                  SizedBox(height: size.height/5.27),
                  SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: RaisedButton(
                        onPressed: () {
                          // print(MediaQuery.of(context).size.height);
                        },
                        child: Text('Done', textScaleFactor: 1.8),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
