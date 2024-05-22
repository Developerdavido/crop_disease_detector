



import 'package:flutter/material.dart';

loader({Color? color}) {
  return CircularProgressIndicator(
    color: color ?? Colors.white,
    strokeWidth: 1.5,
  );
}