import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import '../utils.dart';

class PortfolioLabel extends StatelessWidget {
  const PortfolioLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "PORTFOLIO",
      textScaleFactor:
          DeviceDetails(context).deviceType == DeviceType.Desktop ? 1.4 : 0.9,
      style: Theme.of(context).textTheme.headline4.copyWith(
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            color: primaryTextColorBright,
          ),
    );
  }
}
