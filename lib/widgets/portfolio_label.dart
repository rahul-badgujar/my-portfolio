import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';

class PortfolioLabel extends StatelessWidget {
  const PortfolioLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "PORTFOLIO",
      style: Theme.of(context).textTheme.headline4.copyWith(
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            color: primaryTextColorBright,
          ),
    );
  }
}
