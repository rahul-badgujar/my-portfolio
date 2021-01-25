import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:my_portfolio/utils.dart';
import 'package:provider/provider.dart';
import 'widgets/content_canvas.dart';
import 'widgets/navbar_desktop.dart';
import 'widgets/navbar_mobile.dart';
import 'widgets/portfolio_label.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => NavBarModel(),
        child: Scaffold(
          body: Body(),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: DeviceDetails(context).height * 0.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  children: [
                    DeviceDetails(context).deviceType == DeviceType.Desktop
                        ? NavBarDesktop()
                        : NavBarMobile(),
                    PortfolioLabel(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(height: DeviceDetails(context).height * 0.14),
                  ContentCanvas(),
                  SizedBox(height: DeviceDetails(context).height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
