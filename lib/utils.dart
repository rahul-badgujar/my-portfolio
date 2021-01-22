import 'package:flutter/material.dart';

enum DeviceType { Mobile, Desktop }

DeviceType getDeviceType(MediaQueryData data) {
  double width = 0.0;
  if (data.orientation == Orientation.portrait) {
    width = data.size.width;
  } else {
    width = data.size.height;
  }
  if (width <= 500) {
    return DeviceType.Mobile;
  }
  return DeviceType.Desktop;
}
