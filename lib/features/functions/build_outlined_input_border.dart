import 'package:flutter/material.dart';

buildOutlinedPorder({Color? color, double? radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 8),
    borderSide: BorderSide(color: color ?? Colors.white.withOpacity(0.8)),
  );
}
