import 'package:flutter/material.dart';
import 'package:mynotes_app/core/utils/app_colors.dart';
import 'package:mynotes_app/features/functions/get_app_info.dart';

showAppInfoDialog(BuildContext context) async {
  final String appVersion = await getAppVersion();
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text("About Us", style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: 12),
              const Text("AppName : NotesApp", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text(
                "App version :$appVersion",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                "Designed by : Ahmed Awad",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                "Developed by : Ahmed Awad",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );
    },
  );
}
