import 'package:flutter/material.dart';
import 'package:password_locker/Keyboard/keyboard.dart';
import 'package:password_locker/screens/recovery_screen.dart';

class PinputScreen extends StatefulWidget {
  @override
  _PinputScreenState createState() => _PinputScreenState();
}

class _PinputScreenState extends State<PinputScreen> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.clear();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment.center,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Spacer(flex: 3),
          FlutterLogo(
            size: 150,
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            'Enter Pin to continue ...',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
          const Spacer(
            flex: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Recovery();
              }));
            },
            child: const Text(
              'Forgot Pin?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: SizedBox(
              width: 180,
              child: TextFormField(
                controller: controller,
                maxLength: 6,
                readOnly: true,
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          KeyBoard(controller: controller),
        ]),
      ),
    );
  }
}
