import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';

import '../data.dart';

class ResumeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 1500,
          ),
          child: PinchZoomImage(
            image: Image.asset(
              data["resume"],
            ),
          ),
        ),
      ),
    );
  }
}
