import 'package:flutter/material.dart';
import 'package:mynotes_app/features/data/task_modal.dart';

class CustomTaskPoint extends StatefulWidget {
  CustomTaskPoint({required this.taskModal, super.key, this.textwidth});
  TaskModal taskModal;
  final double? textwidth;
  @override
  State<CustomTaskPoint> createState() => _CustomTaskPointState();
}

class _CustomTaskPointState extends State<CustomTaskPoint> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Checkbox(
            value: false,
            activeColor: Colors.yellow,
            onChanged: (value) {},
          ),
          SizedBox(
            width: widget.textwidth ?? MediaQuery.of(context).size.width * 0.62,
            child: Text(
              widget.taskModal.taskDescreption,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
