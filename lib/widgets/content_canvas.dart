import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/providers/navbar_model.dart';
import 'package:my_portfolio/widgets/about_section.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
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
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 4,
      ),
      elevation: 100,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceDetails(context).width * 0.02,
          vertical: DeviceDetails(context).height * 0.02,
        ),
        width: DeviceDetails(context).width * 0.92,
        height: DeviceDetails(context).deviceType == DeviceType.Desktop
            ? DeviceDetails(context).height * 0.82
            : DeviceDetails(context).height * 0.84,
        child: Consumer<NavBarModel>(
          builder: (context, model, child) {
            if (model.selectedItemIndex == RESUME_SECTION_INDEX) {
              return ResumeSection();
            } else if (model.selectedItemIndex == PROJECTS_SECTION_INDEX) {
              return ProjectsSection();
            }
            return AboutSection();
          },
        ),
      ),
    );
  }
}
