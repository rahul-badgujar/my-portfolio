import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:my_portfolio/widgets/about_section.dart';
import 'package:my_portfolio/widgets/resume_section.dart';
import 'package:provider/provider.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          width: DeviceDetails(context).width * 0.92,
          height: DeviceDetails(context).deviceType == DeviceType.Desktop
              ? DeviceDetails(context).height * 0.82
              : DeviceDetails(context).height * 0.84,
          child: Consumer<NavBarModel>(
            builder: (context, model, child) {
              if (model.selectedItemIndex == RESUME_SECTION_INDEX) {
                return ResumeSection();
              }
              return AboutSection();
            },
          ),
        ),
      ),
    );
  }
}
