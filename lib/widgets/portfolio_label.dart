import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constants.dart';
import '../utils.dart';

class PortfolioLabel extends StatelessWidget {
  const PortfolioLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Portfolio",
      textScaleFactor:
          DeviceDetails(context).deviceType == DeviceType.Desktop ? 1.5 : 1.1,
      style: GoogleFonts.amita(
        textStyle: Theme.of(context).textTheme.headline4.copyWith(
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
              color: primaryTextColorBright,
            ),
      ),
    );
  }
}
