import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.ontap,
    @required this.icon,
  });
  final void Function() ontap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF3B3B3B),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(
          icon ?? Icons.search,
          size: 32,
        ),
      ),
    );
  }
}
