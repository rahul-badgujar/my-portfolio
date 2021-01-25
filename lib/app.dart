import 'package:flutter/material.dart';

import 'package:my_portfolio/theme.dart';

import 'main_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio-Rahul Badgujar",
      debugShowCheckedModeBanner: false,
      theme: AppTheme(base: Theme.of(context)).getTheme(),
      home: MainPage(),
    );
  }
}
