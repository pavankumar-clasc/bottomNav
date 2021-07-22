import 'package:flutter/material.dart';
import 'package:winter_app/multi_player.dart';

import 'body_page.dart';

class DivisionsPage extends StatefulWidget {
  const DivisionsPage({Key? key}) : super(key: key);

  @override
  _DivisionsPageState createState() => _DivisionsPageState();
}

class _DivisionsPageState extends State<DivisionsPage> {
  int _selectedIndex = 0;
  Color searchColor = const Color(0xFFF27D16);
  static List _widgetOptions = [
    Messages(),
    Messages(),
    VideoPlayablePlayer(),
    Text(
      'This is Me page',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'This is Me page',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => VideoPlayablePlayer()));
    }
  }

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
    var backColor = Colors.grey;
    double iconSize = 35.0;
    return Scaffold(
      body: Material(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF0B0B0B),
        backgroundColor: Color(0xFFFBC02D),
        iconSize: iconSize + 5,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            backgroundColor: backColor,
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_movies_outlined,
                color: Colors.black,
              ),
              backgroundColor: backColor,
              label: 'Movies',
              tooltip: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline_sharp,
                color: Colors.black,
              ),
              backgroundColor: backColor,
              label: 'Favourite',
              tooltip: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_add_check_rounded,
                color: Colors.black,
              ),
              backgroundColor: backColor,
              label: 'PlayList',
              tooltip: 'PlayList'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              backgroundColor: backColor,
              label: 'My Account',
              tooltip: 'My Account'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
