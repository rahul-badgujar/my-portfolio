import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import '../data.dart';

class ResumeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              js.context.callMethod(
                "open",
                [data["resume-download-url"]],
              );
            },
            icon: Icon(Icons.file_download),
            label: Text("Download"),
          ),
          SizedBox(height: 10),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 1500,
            ),
            child: PinchZoomImage(
              image: Image.asset(
                data["resume"],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
