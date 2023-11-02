import 'package:flutter/material.dart';

import '../../../core/helpers/resources.dart';
import '../texts/custom_text.dart';

class Readmore extends StatelessWidget {
  const Readmore(
      {Key? key,
      required this.textCollapsed,
      required this.textExpanded,
      required this.height})
      : super(key: key);

  final String textCollapsed;
  final String textExpanded;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextCustom(
        text: textCollapsed,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: R.colors.lightPrimaryColor,
            ),
      ),
    );
  }
}
