import 'package:flutter/material.dart';
import 'package:my_portfolio/utils.dart';

import '../data.dart';

class ResumeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 1500,
        ),
        child: Image.asset(
          data["resume"],
        ),
      ),
    );
  }
}
