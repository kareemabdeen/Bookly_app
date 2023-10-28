import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class StylingTextWidget extends StatelessWidget {
  const StylingTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
        gradient: const LinearGradient(
          colors: [
            Colors.white70,
            Colors.black87,
            Colors.black12,
          ],
        ),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Newest',
              style: StylesManager.titleMedium.copyWith(
                // fontFamily: "Arial",
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: ' Books',
              style: StylesManager.titleMediumWithCustomColor,
            ),
          ],
        ),
      ),
    );
  }
}
