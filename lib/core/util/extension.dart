import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Space on int {
  Widget verticalSpace() {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget horizontalSpace() {
    return SizedBox(
      width: toDouble(),
    );
  }
}

extension ConvertSize on int {
  String getImageSize() {
    if (this < 1024) {
      return '${this}B';
    } else if (this < 1024 * 1024) {
      double kb = this / 1024;
      return '${kb.toStringAsFixed(2)}KB';
    } else {
      double mb = this / (1024 * 1024);
      return '${mb.toStringAsFixed(2)}MB';
    }
  }
}
