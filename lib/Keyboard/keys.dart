import 'package:flutter/material.dart';

class KeyBoardKey extends StatelessWidget {
  final String value;
  final TextEditingController controller;
  KeyBoardKey({Key key, @required this.value, @required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: Colors.transparent,
        child: InkWell(
      onTap: () {
        if(controller.text.length!=6)
        controller.text += value;
        print('Key Pressed : $value');
      },
      child: Ink(
        color: Colors.transparent,
        child: Center(
          child: Text(
            value,
            textScaleFactor: 2,
            style: TextStyle(
              //color: Colors.purple,
            ),
          ),
        ),
      ),
    ));
  }
}

class KeyBoardAction extends StatelessWidget {
  final void Function() onTap;
  final TextEditingController controller;
  final Widget child;
  const KeyBoardAction(
      {Key key, @required this.controller, @required this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      
      shape: CircleBorder(),
      color: Colors.transparent,
        child: InkWell(
      onTap: onTap,
      child: Ink( child: child),
    ));
  }
}
