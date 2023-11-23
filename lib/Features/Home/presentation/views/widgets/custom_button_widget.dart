import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    this.leftborder = false,
    this.color = Colors.white,
    this.textColor = Colors.white,
    required this.text,
    this.onTap,
  });

  final bool leftborder;
  final Color color;
  final String text;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: context.screenWidth * .427,
        decoration: BoxDecoration(
          color: color,
          borderRadius: leftborder
              ? const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
        ),
        child: Center(
          child: Text(
            text,
            style: StylesManager.textStyle18.copyWith(
              fontWeight: FontWeight.w700,
              color: textColor,
              fontFamily: FontWeight.normal.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
