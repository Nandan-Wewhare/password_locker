import 'package:flutter/material.dart';
import 'package:password_locker/widgets/slidable_card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.deepOrange),
                                  child: DropdownButton(items: [
                                    DropdownMenuItem(child: Container()),
                                    DropdownMenuItem(child: Container()),
                                    DropdownMenuItem(child: Container()),
                                    DropdownMenuItem(child: Container()),
                                  ], onChanged: (value) {}),
                                ),
                                TextFormField(
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0)),
                                      )),
                                ),
                                TextFormField(
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0)),
                                      )),
                                ),
                                SizedBox(
                                  height: 46,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))));
              });
        },
      ),
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SlidableCard(
              icon: null,
              password: '1223111141435468',
              title: 'Instagram',
            ),
          ],
        ),
      ),
    );
  }
}
