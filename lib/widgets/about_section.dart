import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/data.dart';
import 'package:my_portfolio/utils.dart';

import 'contact_item.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

// TODO: scroll bar
class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: DeviceDetails(context).deviceType == DeviceType.Desktop
              ? 560
              : 400,
        ),
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
            BioItem(),
            SizedBox(height: 15),
            SizedBox(height: 15),
            ProfileLinksItem(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class ProfileLinksItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            "PROFILE LINKS",
            style: Theme.of(context).textTheme.subtitle1.copyWith(),
          ),
          Divider(
            color: primaryTextColor,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: DeviceDetails(context).deviceType == DeviceType.Desktop
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
    );
  }
}

class BioItem extends StatelessWidget {
  const BioItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            "BIO",
            style: Theme.of(context).textTheme.subtitle1.copyWith(),
          ),
          Divider(
            color: primaryTextColor,
          ),
          Text(
            data["bio"],
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyText2.copyWith(),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.work,
              ),
              SizedBox(width: 6),
              Text(
                "Working status : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data["work"],
              ),
            ],
          ),
          SizedBox(height: 12),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 30,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                data["skillset"].length,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Chip(
                    label: Text(
                      data["skillset"][i],
                      textScaleFactor: 0.8,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
