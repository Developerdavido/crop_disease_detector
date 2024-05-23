



import 'package:flutter/material.dart';

loader({Color? color, double? strokeWidth}) {
  return CircularProgressIndicator(
    color: color ?? Colors.white,
    strokeWidth: strokeWidth ?? 1.5,
  );
}