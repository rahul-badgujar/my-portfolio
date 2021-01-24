import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import '../constants.dart';
import '../utils.dart';

class ContactItem extends StatelessWidget {
  final String title;
  final String url;
  final String assetPath;
  const ContactItem({
    Key key,
    this.title,
    this.url,
    this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => js.context.callMethod("open", [url]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Row(
          children: [
            Spacer(flex: 2),
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                assetPath,
                color: primaryTextColor,
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Text(
                title,
                textScaleFactor:
                    DeviceDetails(context).deviceType == DeviceType.Desktop
                        ? 1
                        : 0.8,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
