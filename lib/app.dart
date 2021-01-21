import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/main_page/main_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainPage(),
    );
  }
}
