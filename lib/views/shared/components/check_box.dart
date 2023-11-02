import 'package:flutter/material.dart';

import '../../../core/helpers/resources.dart';
import '../../../core/helpers/utils/theme_util.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function()? onTap;
  final bool check;
  final String? title;
  final double paddingLeft;
  const CustomCheckBox({
    Key? key,
    this.title,
    this.onTap,
    this.paddingLeft = 12,
    this.check = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: R.colors.lightBorderColor,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: check
                      ? ThemeUtil.theme(context).colorScheme.background
                      : null,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            if (title != null) ...[
              const SizedBox(width: 5),
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
