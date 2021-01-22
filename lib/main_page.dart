import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:my_portfolio/utils.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'widgets/navbar_desktop.dart';
import 'widgets/navbar_mobile.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => NavBarModel(),
        child: Scaffold(
          body: Body(),
          drawer: Drawer(
            child: NavBarListMobile(),
          ),
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
    final mediaQueryData = MediaQuery.of(context);
    final deviceType = getDeviceType(mediaQueryData);
    final size = mediaQueryData.size;
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            height: size.height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              children: [
                deviceType == DeviceType.Desktop
                    ? NavBarDesktop(size)
                    : NavBarMobile(size),
                SizedBox(height: 10),
                Text(
                  "PORTFOLIO",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: deviceType == DeviceType.Desktop
                        ? size.width * 0.036
                        : size.height * 0.04,
                    letterSpacing: 5,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  data["name"],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: deviceType == DeviceType.Desktop
                        ? size.width * 0.018
                        : size.height * 0.022,
                    letterSpacing: 3,
                  ),
                ),
              ],
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            elevation: 100,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.75,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
