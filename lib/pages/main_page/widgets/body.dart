import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/main_page/providers/bnb_model.dart';
import 'package:my_portfolio/pages/main_page/tabs/about_tab.dart';
import 'package:my_portfolio/pages/main_page/tabs/projects_tab.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  static final List tabsContent = [
    AboutTab(),
    ProjectsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BnbModel>(
      builder: (context, model, child) {
        return tabsContent[model.currentSelectedItemIndex];
      },
    );
  }
}
