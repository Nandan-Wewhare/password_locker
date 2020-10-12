import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:password_locker/Keyboard/keys.dart';
import 'package:password_locker/screens/home_screen.dart';

class KeyBoard extends StatelessWidget {
  final TextEditingController controller;
  KeyBoard({
    Key key,
    @required this.controller,
  }) : super(key: key);
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    List keys = <Widget>[
      KeyBoardKey(value: '0', controller: controller),
      KeyBoardKey(value: '1', controller: controller),
      KeyBoardKey(value: '2', controller: controller),
      KeyBoardKey(value: '3', controller: controller),
      KeyBoardKey(value: '4', controller: controller),
      KeyBoardKey(value: '5', controller: controller),
      KeyBoardKey(value: '6', controller: controller),
      KeyBoardKey(value: '7', controller: controller),
      KeyBoardKey(value: '8', controller: controller),
      KeyBoardKey(value: '9', controller: controller),
      KeyBoardAction(
        controller: controller,
        onTap: () => controller.clear(),
        child: Center(child: Icon(Icons.cancel)),
      ),
      KeyBoardAction(
        controller: controller,
        onTap: () async {
          if (controller.text.length == 6) {
            var pin = await storage.read(key: 'pin');
            if (controller.text == pin) {
              Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(builder: (context) => Home()));
              controller.clear();
            } else {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    'Incorrect PIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        child: Center(child: Icon(Icons.send)),
      )
    ];
    keys.shuffle();
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: 2.3,
      children: keys,
    );
  }
}
