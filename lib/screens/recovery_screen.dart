import 'package:flutter/material.dart';

class Recovery extends StatefulWidget {
  @override
  _RecoveryState createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  final _controller = PageController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Pin'),
      ),
      resizeToAvoidBottomPadding: false,
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            height: double.infinity,
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          labelText: 'Enter Full Name',
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0)),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                    ),
                    Container(
                      height: 56,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(6),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.deepOrange),
                      ),
                      child: Text(
                        'Demo Question?',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          labelText: "What's your Answer!",
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0)),
                          )),
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () {
                        _controller.animateToPage(1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.bounceIn);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Next', textScaleFactor: 1.8),
                      ),
                    )
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            height: double.infinity,
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          labelText: 'Enter New Pin',
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0)),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          labelText: "Confirm Pin",
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.0)),
                          )),
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Done', textScaleFactor: 1.8),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
