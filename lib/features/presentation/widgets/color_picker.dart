import 'package:flutter/material.dart';

class ColorPiker extends StatelessWidget {
  ColorPiker({
    super.key,
    required this.bacgroundColor,
    required this.isSelected,
  });

  final Color bacgroundColor;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: isSelected ? Colors.white : bacgroundColor,
        child: CircleAvatar(
          radius: 31,
          backgroundColor: bacgroundColor,
        ),
      ),
    );
  }
}
