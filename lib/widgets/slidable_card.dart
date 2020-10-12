import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class SlidableCard extends StatefulWidget {
  final String title;
  final Widget icon;
  final String password;
  SlidableCard(
      {Key key,
      @required this.icon,
      @required this.password,
      @required this.title,
      })
      : super(key: key);

  @override
  _SlidableCardState createState() => _SlidableCardState();
}

class _SlidableCardState extends State<SlidableCard> {
  bool isShowPass = false;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.deepOrange,
              offset: Offset(8, 8),
              blurRadius: 12,
              spreadRadius: -8),
        ], color: Colors.grey[850], borderRadius: BorderRadius.circular(16)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterLogo(
                    size: 26,
                  ),
                  SizedBox(width: 20),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Password :',
                  style: TextStyle(fontSize: 22, letterSpacing: 1.2),
                ),
                Spacer(),
                Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SelectableText(
                        isShowPass ? widget.password : '***********',
                        style: TextStyle(fontSize: 22, letterSpacing: 1.2),
                      ),
                    )),
                Spacer(),
                Icon(isShowPass ? Icons.visibility : Icons.visibility_off)
              ])
            ]),
      ),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.2,
      actions: [
        IconButton(
            tooltip: 'Show Password',
            icon: Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                isShowPass = !isShowPass;
              });
            })
      ],
      secondaryActions: [
        IconButton(
            tooltip: 'Delete Item',
            icon: Icon(Icons.delete_forever_outlined),
            onPressed: () {
              setState(() {});
            })
      ],
    );
  }
}
