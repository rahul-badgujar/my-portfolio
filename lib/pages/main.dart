import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: "About"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mobile_screen_share_rounded,
              ),
              label: "Projects"),
        ],
      ),
    );
  }
}
