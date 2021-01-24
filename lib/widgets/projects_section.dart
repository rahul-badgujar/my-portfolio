import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Projects coming soon...",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
