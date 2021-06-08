import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Online extends StatefulWidget {
  @override
  _OnlineState createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return list();
        });
  }

  Widget list() {
    return ListTile(
      leading: CircleAvatar(
        child: Text("A"),
      ),
      title: Text("Abebe"),
      trailing: Text(
        '.',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
