import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/main_page/providers/bnb_model.dart';
import 'package:my_portfolio/pages/main_page/widgets/bnb.dart';
import 'package:my_portfolio/pages/main_page/widgets/body.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BnbModel(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Body(),
          bottomNavigationBar: BnbMainPage(),
        ),
      ),
    );
  }
}
