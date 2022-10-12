import 'package:flutter/material.dart';
import 'package:pidgeon_app/src/core/utils/tools.dart';

class TextDivider extends StatelessWidget {
  final String label;
  final Color? color;
  const TextDivider({
    Key? key,
    required this.label,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            label,
            style: styles.mediumStyle(
              context,
              bold: true,
              color: color ?? colors.black,
            ),
          )),
    );
  }
}

class TextDividerLarge extends StatelessWidget {
  final String label;
  final Color? color;
  const TextDividerLarge({
    Key? key,
    required this.label,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            label,
            style: styles.extraLargeStyle(
              context,
              bold: true,
              color: color ?? colors.black,
            ),
          )),
    );
  }
}
