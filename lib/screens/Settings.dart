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
              accountName: Text('Nmae'),
              accountEmail: Text('saasd@dfndsf.cnwf')),
          tile()
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
