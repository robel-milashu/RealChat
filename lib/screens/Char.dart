import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abebe Sisay"),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text("Msg"),
            )
          ],
        ),
      ),
    );
  }
}
