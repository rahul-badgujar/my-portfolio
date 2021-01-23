import 'package:flutter/material.dart';

import '../utils.dart';

class ContentCanvas extends StatelessWidget {
  const ContentCanvas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 100,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: DeviceDetails(context).width * 0.92,
          height: DeviceDetails(context).deviceType == DeviceType.Desktop
              ? DeviceDetails(context).height * 0.82
              : DeviceDetails(context).height * 0.84,
        ),
      ),
    );
  }
}
