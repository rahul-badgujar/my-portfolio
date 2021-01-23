import 'package:flutter/material.dart';
import 'package:my_portfolio/data.dart';
import 'package:my_portfolio/utils.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: DeviceDetails(context).height * 0.05),
        CircleAvatar(
          maxRadius: DeviceDetails(context).deviceType == DeviceType.Desktop
              ? DeviceDetails(context).height * 0.2
              : DeviceDetails(context).width * 0.2,
          minRadius: DeviceDetails(context).deviceType == DeviceType.Desktop
              ? DeviceDetails(context).height * 0.1
              : DeviceDetails(context).width * 0.1,
          backgroundImage: AssetImage(
            data["photo"],
          ),
        ),
        SizedBox(height: 15),
        Text(
          data["name"],
          textScaleFactor:
              DeviceDetails(context).deviceType == DeviceType.Desktop
                  ? 1.5
                  : 1.2,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 10),
        Text(
          data["title"],
          textScaleFactor:
              DeviceDetails(context).deviceType == DeviceType.Desktop
                  ? 1.4
                  : 0.9,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
