import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../utils.dart';

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
                style: TextStyle(
                  color: model.selectedItemIndex == index
                      ? Colors.white
                      : Colors.white70,
                  fontSize: DeviceDetails(context).width * 0.013,
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
