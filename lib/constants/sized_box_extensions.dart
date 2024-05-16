import 'package:flutter/material.dart';

extension IntExtensions on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get kH => SizedBox(height: this?.toDouble());

  Widget get kW => SizedBox(width: this?.toDouble());

  Widget get k => SizedBox(height: this?.toDouble(), width: this?.toDouble());
}
