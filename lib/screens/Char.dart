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
                receivedMsg(),
                sentMsg(),
                receivedMsg(),
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
    return Container(
      decoration: new BoxDecoration(
        color: Colors.green,
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        border: new Border.all(
          color: Colors.blue,
          width: .2,
        ),
      ),
      //  color: Colors.green,
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: screen.width * .48,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        'This isf f  asfjsafasfbsa fsaofb safn aosfjbasjf    osdtg we jb',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget sentMsg() {
    var x = screen.width * 0.5;
    return Container(
      color: Colors.blue,
      width: screen.width * .98,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: x),
      child: FittedBox(
          fit: BoxFit.contain,
          child: Text('saklnfasf sd nsdbgwd gwsgtbwelrt ewqtj')),
    );
  }
}
