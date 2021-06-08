import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      Uri.parse('ws://192.168.43.30:8100/TobiaChat/endpoint'),
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
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
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
                              height: screen.height * .75,
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
                                          return Text(snapshot.hasData
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
                              bottom: 10,
                              child: Row(
                                children: [
                                  Container(
                                    width: screen.width * 0.6,
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 50,
                                    child: TextField(
                                      controller: _controller,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Type here..",
                                        border: OutlineInputBorder(),
                                        alignLabelWithHint: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: screen.width * 0.25,
                                      child: TextButton(
                                          onPressed: _sendMessage,
                                          child: Icon(Icons.send)))
                                ],
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

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
