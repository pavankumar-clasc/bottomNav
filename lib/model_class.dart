import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends ChangeNotifier {
  var serial = <bool>[true, false, false, false, false, false, false];
  var personNames = <String>[
    'Christoper jenkenya',
    'Caroline Forbs',
    'Sue Caldwel',
    'Alacia Monria',
    'AdnanHayes',
    'Hariyan Andre',
    'Rehan Korean'
  ];
  var rcdMessage = List<String>.generate(7, (index) => 'Blahh Blahh');
  DateTime now = new DateTime.now();

  Widget _messagePage(String name) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () => null,
          ),
          titleSpacing: 1.0,
          backgroundColor: Colors.brown[50],
          title: ListTile(
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, -5),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              maxRadius: 25.0,
            ),
            title: Text(
              '$name',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.videocam_outlined,
                size: 38,
                color: Colors.grey[700],
              ),
              onPressed: () => null,
            ),
            IconButton(
                icon: Icon(
                  Icons.call_outlined,
                  size: 35,
                  color: Colors.grey[700],
                ),
                onPressed: () => null)
          ],
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 10,
              ),
              Expanded(
                  child: Text(
                'Your Chats are here',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              )),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[350],
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send_outlined,
                              color: Colors.red,
                              size: 28.0,
                            ),
                            onPressed: () => null,
                          ),
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.red,
                              size: 28.0,
                            ),
                            onPressed: () => null,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(35)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(35)),
                          hintStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                          hintText: 'Type your message here'),
                    ),
                  )),
              Divider(
                height: 5,
              )
            ],
          ),
        ));
  }

  Widget showChat(String mname) {
    return _messagePage(mname);
  }
}
