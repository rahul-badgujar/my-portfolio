import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class NavBarMobile extends StatelessWidget {
  final size;
  NavBarMobile(
    this.size,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        color: Colors.white,
      ),
    );
  }
}

class NavBarTileMobile extends StatelessWidget {
  final index;
  const NavBarTileMobile({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarModel>(builder: (context, model, child) {
      return InkWell(
        onTap: () {
          model.selectedItemIndex = index;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            title: Text(
              navBarItems[index],
              style: TextStyle(
                fontWeight: model.selectedItemIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    });
  }
}
