import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
} // to access it context.screenHeight * n

extension NavigatorHelper on BuildContext {
  void simplePush(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void pushWithReplacmentNamed(String widgetName) {
    Navigator.pushReplacementNamed(this, widgetName);
  }
} // context.simplePush(HomePage());

extension ShowSnackBarExtension on BuildContext {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }
}
