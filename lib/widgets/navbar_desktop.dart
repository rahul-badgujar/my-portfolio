import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class NavBarDesktop extends StatelessWidget {
  final Size screenDimens;
  const NavBarDesktop(
    this.screenDimens, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        navBarItems.length,
        (index) =>
            NavBarDesktopButton(index: index, screenDimens: screenDimens),
      ),
    );
  }
}

class NavBarDesktopButton extends StatelessWidget {
  final int index;
  const NavBarDesktopButton({
    Key key,
    @required this.index,
    @required this.screenDimens,
  }) : super(key: key);

  final Size screenDimens;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarModel>(
      builder: (context, model, child) {
        return Container(
          child: InkWell(
            onTap: () {
              model.selectedItemIndex = index;
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                navBarItems[index],
                style: TextStyle(
                  color: model.selectedItemIndex == index
                      ? Colors.white
                      : Colors.white70,
                  fontSize: screenDimens.width * 0.013,
                  fontWeight: model.selectedItemIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
