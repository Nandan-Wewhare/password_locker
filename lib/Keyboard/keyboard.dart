import 'package:flutter/material.dart';
import 'package:password_locker/Keyboard/keys.dart';
import 'package:password_locker/screens/home_screen.dart';

class KeyBoard extends StatelessWidget {
  final TextEditingController controller;
  KeyBoard({
    Key key,
    @required this.controller,
  }) : super(key: key);

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
        onTap: () {
          print('Current value : ${controller.text}');
          controller.clear();
        },
        child: Center(child: Icon(Icons.cancel)),
      ),
      KeyBoardAction(
        controller: controller,
        onTap: () {
          if (controller.text.length == 6)
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()));
          print(controller.text);
          controller.clear();
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
