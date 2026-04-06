import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.isLoading});
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF53EED8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : const Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
      ),
    );
  }
}
