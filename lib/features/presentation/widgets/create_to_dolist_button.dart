import 'package:flutter/material.dart';

class CreateToDolistButton extends StatelessWidget {
  const CreateToDolistButton({super.key, this.onPressed, this.buttonName});
  final void Function()? onPressed;
  final String? buttonName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            backgroundColor: Colors.orange,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          buttonName ?? 'Create',
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ));
  }
}
