import 'package:flutter/material.dart';
import 'package:mynotes_app/features/data/task_modal.dart';

class CustomTaskWidget extends StatefulWidget {
  CustomTaskWidget({
    required this.taskModal,
    super.key,
    required this.onChanged,
    this.textwidth,
  });
  TaskModal taskModal;
  final void Function(bool?)? onChanged;
  final double? textwidth;
  @override
  State<CustomTaskWidget> createState() => _CustomTaskWidgetState();
}

class _CustomTaskWidgetState extends State<CustomTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Checkbox(
            value: widget.taskModal.isCompleted,
            activeColor: Colors.yellow,
            onChanged: widget.onChanged,
          ),
          SizedBox(
            width: widget.textwidth ?? MediaQuery.of(context).size.width * 0.62,
            child: Text(
              widget.taskModal.taskDescreption,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: widget.taskModal.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: widget.taskModal.isCompleted
                    ? Colors.grey
                    : Colors.white,
                decorationColor: Colors.yellow,
                decorationThickness: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
