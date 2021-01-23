import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class NavBarMobile extends StatelessWidget {
  NavBarMobile();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Consumer<NavBarModel>(
        builder: (context, model, child) {
          return PopupMenuButton<int>(
            color: Theme.of(context).cardTheme.color,
            icon: Icon(
              Icons.menu,
            ),
            onSelected: (index) {
              model.selectedItemIndex = index;
            },
            itemBuilder: (index) {
              return List.generate(
                navBarItems.length,
                (index) => PopupMenuItem<int>(
                  value: index,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    child: Text(
                      navBarItems[index],
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            fontWeight: model.selectedItemIndex == index
                                ? FontWeight.bold
                                : null,
                            color: model.selectedItemIndex == index
                                ? primaryTextColorBright
                                : null,
                          ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
