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
      child: Tooltip(
        message: title,
        child: SvgPicture.asset(
          assetPath,
          color: primaryTextColor,
        ),
      ),
    );
  }
}
