import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

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
    return Tooltip(
      message: title,
      child: IconButton(
        icon: Image.asset(assetPath),
        onPressed: () => js.context.callMethod(
          "open",
          [url],
        ),
      ),
    );
  }
}
