import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text('A'),
              ),
              accountName: Text('Nmae'),
              accountEmail: Text('saasd@dfndsf.cnwf')),
          tile(),
          tile(),
          tile(),
        ],
      ),
    );
  }

  Widget tile() {
    return ListTile(
      leading: Icon(Icons.access_alarm),
      title: Text('askjbnasjf'),
    );
  }
}
