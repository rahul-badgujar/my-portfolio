import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/main_page/main_page.dart';
import 'package:my_portfolio/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      home: MainPage(),
    );
  }
}
