import 'package:flutter/material.dart';

import 'package:my_portfolio/theme.dart';

import 'main_page.dart';

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
