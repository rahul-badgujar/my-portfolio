import 'package:flutter/material.dart';

enum DeviceType { Mobile, Tablet, Desktop }

DeviceType getDeviceType(MediaQueryData data) {
  double width = 0.0;
  if (data.orientation == Orientation.portrait) {
    width = data.size.width;
  } else {
    width = data.size.height;
  }
  if (width > 900) {
    return DeviceType.Desktop;
  } else if (width > 600) {
    return DeviceType.Tablet;
  }
  return DeviceType.Mobile;
}
