import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/helpers/resources.dart';

Color getStatusColorToText(String status) {
  switch (status) {
    case 'inOperation':
      return R.colors.greenSuccess;
    case 'inAlert':
      return R.colors.yellowAlert;
    case 'inDowntime':
      return R.colors.redError;
    default:
      return Colors.black;
  }
}

Color getStatusColorToBackground(String status) {
  switch (status) {
    case 'inOperation':
      return R.colors.greenSuccessBackground;
    case 'inAlert':
      return R.colors.yellowAlertBackground;
    case 'inDowntime':
      return R.colors.redErrorBackground;
    default:
      return Colors.black;
  }
}
