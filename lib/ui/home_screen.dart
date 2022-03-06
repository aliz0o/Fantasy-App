import 'package:fantasy/ui/tab/home_screen_tab.dart';
import 'package:fantasy/ui/tab/all_players_tap.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

List playersID = new List(11);
List playersName = new List(11);
List playersImage = new List(11);
User user = FirebaseAuth.instance.currentUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreenTab(userID: user.uid),
    AllPlayersTap(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Players',
          ),
        ],
      ),
    );
  }
}
