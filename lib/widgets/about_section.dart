import 'package:flutter/material.dart';
import 'package:my_portfolio/data.dart';
import 'package:my_portfolio/utils.dart';

import 'contact_item.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
              style: Theme.of(context).textTheme.headline5,
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
            SizedBox(height: 30),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 800,
                maxHeight: 400,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      DeviceDetails(context).deviceType == DeviceType.Desktop
                          ? 3
                          : 2,
                  childAspectRatio: 3,
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
          ],
        ),
      ),
    );
  }
}
