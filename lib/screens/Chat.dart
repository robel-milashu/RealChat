import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Size screen;
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
            height: screen.height * .98,
            child: Column(
              children: [
                Container(
                  height: screen.height * .77,
                  child: SingleChildScrollView(
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
                Container(
                  height: screen.height * .1,
                  //color: Colors.white,
                  width: screen.width,
                  child: Row(
                    children: [typeWidget(), sendBtn()],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget sentMsg() {
    return Container(
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
    );
  }

  Widget receivedMsg() {
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

  Widget sendBtn() {
    return Container(
        width: screen.width * 0.2,
        child: TextButton(onPressed: () {}, child: Icon(Icons.send)));
  }

  Widget typeWidget() {
    return Container(
      width: screen.width * 0.7,
      height: 70,
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
}
