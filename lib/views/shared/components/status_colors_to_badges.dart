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

Color getWorkOrderStatusColorToText(String status) {
  switch (status) {
    case 'completed':
      return R.colors.greenSuccess;
    case 'in progress':
      return R.colors.yellowAlert;
    default:
      return Colors.black;
  }
}

Color getWorkOrderStatusColorToBackground(String status) {
  switch (status) {
    case 'completed':
      return R.colors.greenSuccessBackground;
    case 'in progress':
      return R.colors.yellowAlertBackground;
    default:
      return Colors.black;
  }
}
