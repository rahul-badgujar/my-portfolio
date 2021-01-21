import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/main_page/providers/bnb_model.dart';
import 'package:provider/provider.dart';

class BnbMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BnbModel>(
      builder: (context, model, child) {
        return BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (int index) {
            model.currentSelectedItemIndex = index;
          },
          currentIndex: model.currentSelectedItemIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: "About",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mobile_screen_share_rounded,
              ),
              label: "Projects",
            ),
          ],
        );
      },
    );
  }
}
