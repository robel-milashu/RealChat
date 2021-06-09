import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobiachat/screens/Settings.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'Online.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  var _channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.43.30:8100/TobiaChat/endpoint'),
  );

  @override
  void initState() {
    super.initState();
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://192.168.1.12:8100/TobiaChat/endpoint'),
    );
  }

  Size screen;
  bool online = false;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            "Tobia Chat",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }),
          // IconButton(
          //     icon: Icon(
          //       Icons.notifications,
          //       color: Colors.grey,
          //     ),
          //     onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.message,
                color: Colors.grey,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              }),
        ],
      ),

      body: online
          ? Online()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: screen.height * .85,
                        child: Stack(
                          children: [
                            Container(
                              height: screen.height * .78,
                              width: screen.width * .95,
                              child: SingleChildScrollView(
                                child: StreamBuilder(
                                  stream: _channel.stream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(child: Text("Error"));
                                    } else {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.active:
                                          return sentMsg(snapshot.hasData
                                              ? '${snapshot.data}'
                                              : '');
                                        case ConnectionState.waiting:
                                          return Center();

                                        default:
                                          return Center();
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Row(
                                children: [typeWidget(), sendBtn()],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[50],
          onPressed: () {
            print("er");
            setState(() {
              online = !online;
            });
          },
          tooltip: 'Send message',
          child: Icon(
            Icons.online_prediction,
            color: Colors.grey,
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget sendBtn() {
    return Container(
        width: screen.width * 0.25,
        child: TextButton(onPressed: _sendMessage, child: Icon(Icons.send)));
  }

  Widget typeWidget() {
    return Container(
      width: screen.width * 0.6,
      height: 80,
      //   color: Colors.yellow,
      margin: const EdgeInsets.only(left: 10),
      child: TextField(
        controller: _controller,
        autocorrect: true,
        expands: true,
        maxLines: null,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "Type here..",
          border: OutlineInputBorder(gapPadding: 1),
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
      _controller.text = '';
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  Widget sentMsg(msg) {
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
          msg,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: 'Courier new'),
        ),
      ),
    );
  }

  Widget receivedMsg(msg) {
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
        msg,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontFamily: 'Courier new'),
      ),
    );
  }
}
