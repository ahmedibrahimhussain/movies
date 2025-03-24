import 'package:flutter/material.dart';

extension CustomNavigation on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
