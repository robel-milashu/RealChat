import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Size screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text("Abebe Sisay"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screen.width * .98,
          child: Positioned(
            width: 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                receivedMsg(),
                sentMsg(),
                receivedMsg(),
                sentMsg(),
                receivedMsg(),
                receivedMsg(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget receivedMsg() {
    return Positioned(
      right: 50,
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.grey[600],
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          border: new Border.all(
            color: Colors.blue,
            width: .2,
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
        width: screen.width * .58,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          'This isf f  asfjsafasfbsa fsaofb safn aosfjbasjf    osdtg we jb',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: 'Courier new'),
        ),
      ),
    );
  }

  Widget sentMsg() {
    var x = screen.width * 0.4;
    return Container(
      decoration: new BoxDecoration(
        color: Colors.grey[100],
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        border: new Border.all(
          color: Colors.grey[100],
          width: .2,
        ),
      ),
      width: screen.width * .98,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: x, right: 10, top: 5, bottom: 5),
      child: Text(
        'saklnfasf sd nsdbgwd gwsgtbwelrt ewqtj',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontFamily: 'Courier new'),
      ),
    );
  }
}
