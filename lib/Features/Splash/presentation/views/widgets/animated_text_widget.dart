import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        buildColorizeAnimatedText(),
      ],
      totalRepeatCount: 1,
      pause: const Duration(seconds: 1),
      displayFullTextOnTap: true, // Display full text when user taps on it
      stopPauseOnTap: true, // Pause animation when user taps on it
    );
  }

  ColorizeAnimatedText buildColorizeAnimatedText() {
    return ColorizeAnimatedText(
      'Read Free Books',
      colors: [
        Colors.red,
        Colors.blueAccent,
      ],
      textStyle: const TextStyle(
        fontSize: 16.0,
      ),
      textAlign: TextAlign.center,
      // speed: const Duration(milliseconds: 50),
    );
  }
}
