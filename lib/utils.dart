import 'package:flutter/material.dart';

enum DeviceType { Mobile, Desktop }

class DeviceDetails {
  double width;
  double height;
  DeviceType deviceType;
  double aspectRatio;
  DeviceDetails(BuildContext context) {
    final details = MediaQuery.of(context);
    this.width = details.size.width;
    this.height = details.size.height;
    this.deviceType = getDeviceType(details);
  }
  static DeviceType getDeviceType(MediaQueryData data) {
    double width = 0.0;
    if (data.orientation == Orientation.portrait) {
      width = data.size.width;
    } else {
      width = data.size.height;
    }
    if (width <= 540) {
      return DeviceType.Mobile;
    }
    return DeviceType.Desktop;
  }
}
