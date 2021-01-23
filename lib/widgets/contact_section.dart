import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/utils.dart';
import 'dart:js' as js;
import '../data.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: DeviceDetails(context).height * 0.03),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 700,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      DeviceDetails(context).deviceType == DeviceType.Desktop
                          ? 3
                          : 2,
                  childAspectRatio: 2.4,
                ),
                itemBuilder: (context, index) {
                  return ContactItem(
                    title: data["contact"][index]["domain"].toString(),
                    url: data["contact"][index]["url"].toString(),
                    assetPath: data["contact"][index]["logo"].toString(),
                  );
                },
                itemCount: data["contact"].length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    return TextButton.icon(
      onPressed: () {
        js.context.callMethod("open", [url]);
      },
      icon: SvgPicture.asset(
        assetPath,
        color: primaryTextColor,
        width:
            DeviceDetails(context).deviceType == DeviceType.Desktop ? 40 : 25,
        height:
            DeviceDetails(context).deviceType == DeviceType.Desktop ? 40 : 25,
      ),
      label: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: DeviceDetails(context).deviceType == DeviceType.Desktop
                ? 36
                : 4,
          ),
        ),
      ),
    );
  }
}
