import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        navBarItems.length,
        (index) => NavBarDesktopButton(index: index),
      ),
    );
  }
}

class NavBarDesktopButton extends StatelessWidget {
  final int index;
  const NavBarDesktopButton({
    Key key,
    @required this.index,
  }) : super(key: key);

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
                textScaleFactor: model.selectedItemIndex == index ? 1.2 : null,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: model.selectedItemIndex == index
                          ? primaryTextColorBright
                          : null,
                      fontWeight: model.selectedItemIndex == index
                          ? FontWeight.w600
                          : null,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
