import 'package:flutter/material.dart';
import 'package:mynotes_app/core/utils/app_colors.dart';

showConfermaTionDailog(
  BuildContext context, {
  required String dailogTitle,
  Widget? icon,
  required String cancelButtonName,
  required String confirmButtonName,
  required Function()? confirmOnPressed,
  @required Function()? cancelOnPressed,
  @required Color? confirmationButtonColor,
  @required Color? cancelButtonColor,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ??
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                    size: 40,
                  ),
              const SizedBox(height: 12),
              Text(
                dailogTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  CustomConfarmationButton(
                    onPressed:
                        cancelOnPressed ??
                        () {
                          Navigator.pop(context);
                        },
                    buttonName: cancelButtonName,
                    buttonColor: cancelButtonColor ?? Colors.green,
                  ),
                  const Spacer(),
                  CustomConfarmationButton(
                    onPressed: confirmOnPressed,
                    buttonName: confirmButtonName,
                    buttonColor: confirmationButtonColor ?? Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class CustomConfarmationButton extends StatelessWidget {
  const CustomConfarmationButton({
    super.key,
    this.onPressed,
    required this.buttonName,
    required this.buttonColor,
  });
  final void Function()? onPressed;
  final String buttonName;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: buttonColor,
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
