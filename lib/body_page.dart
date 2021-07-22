import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:winter_app/model_class.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChatPage(), child: MainPage());
  }
}

class MainPage extends StatelessWidget {
  final Color searchColor = const Color(0xFFF27D16);

  Widget _profile(String uname, bool status) {
    return Stack(alignment: const Alignment(0.50, 0.09), children: [
      Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        color: Color(0xFF0B0B0B),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: SizedBox(
              width: 120,
              height: 140,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                '${uname.substring(0, 10)}',
                style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFBC02D)),
              ))
        ]),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ChatPage>();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Clasc',
              style: GoogleFonts.lato(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Color(0xFFFBC02D)),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 12),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFF59D),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 4, 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.search_sharp,
                      color: searchColor,
                      size: 40,
                    ),
                    onPressed: () {
                      print('Search is clicked');
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        drawer: Drawer(),
        body: ListView(children: <Widget>[
          Container(
              color: Color(0xFF0B0B0B),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.loose,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return _profile(model.personNames[index],
                                    model.serial[index]);
                              },
                            ),
                          ),
                        ]),
                  ])),
          Container(
            height: (3 * (MediaQuery.of(context).size.height)) / 4,
            color: Color(0xFF0B0B0B),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: model.personNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  height: 150.0,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      '${model.personNames[index]}',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Color(0xFFFBC02D)),
                    ),
                    subtitle: Text('${model.rcdMessage[index]}'),
                    dense: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                model.showChat(model.personNames[index])),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
