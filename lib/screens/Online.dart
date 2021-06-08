import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Online extends StatefulWidget {
  @override
  _OnlineState createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  Size screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: screen.height * 0.9,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Container(
              height: screen.height * 0.8,
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return list();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        border: new Border.all(
          color: Colors.grey,
          width: .2,
        ),
      ),
      child: ListTile(
          onTap: () {},
          leading: Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              border: new Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey[50],
              child: Text(
                "A",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          title: Container(child: Text("Abebe")),
          trailing: Icon(Icons.notifications_active)),
    );
  }
}
