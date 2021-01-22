import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:my_portfolio/utils.dart';
import 'package:provider/provider.dart';

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
          backgroundColor: primaryColor,
          body: Body(),
          drawer: Drawer(
            child: NavBarListMobile(),
          ),
        ),
      ),
    );
  }
}

class NavBarListMobile extends StatelessWidget {
  const NavBarListMobile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        navBarItems.length,
        (index) => NavBarTileMobile(
          index: index,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            deviceType == DeviceType.Desktop
                ? NavBarDesktop(size)
                : NavBarMobile(size),
          ],
        ),
      ),
    );
  }
}
