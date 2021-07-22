import 'package:flutter/material.dart';
import 'package:winter_app/route_page.dart';
import 'package:winter_app/video_demoplayer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/player': (context) => PlayerPage()},
      theme: ThemeData(primaryColor: Color(0xFF0B0B0B)),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => SafeArea(
          top: true,
          left: false,
          bottom: true,
          right: true,
          child: Scaffold(body: DivisionsPage()),
        ),
      ),
    );
  }
}
