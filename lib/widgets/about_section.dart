import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/data.dart';
import 'package:my_portfolio/utils.dart';

import 'contact_item.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

// TODO: Add bio, skillset, and job
// TODO: scroll bar
class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              maxRadius: DeviceDetails(context).deviceType == DeviceType.Desktop
                  ? DeviceDetails(context).height * 0.18
                  : DeviceDetails(context).width * 0.18,
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
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: primaryTextColorBright,
                  ),
            ),
            SizedBox(height: 10),
            Text(
              data["title"],
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textScaleFactor:
                  DeviceDetails(context).deviceType == DeviceType.Desktop
                      ? 1.3
                      : 0.9,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 40),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    DeviceDetails(context).deviceType == DeviceType.Desktop
                        ? 280
                        : 180,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  data["contact"].length,
                  (index) => ContactItem(
                    title: data["contact"][index]["domain"].toString(),
                    url: data["contact"][index]["url"].toString(),
                    assetPath: data["contact"][index]["logo"].toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
