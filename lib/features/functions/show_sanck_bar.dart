import 'package:flutter/material.dart';

void showSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
