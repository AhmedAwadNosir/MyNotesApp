import 'package:flutter/material.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';

class ToDoSubtaskslistOption extends StatelessWidget {
  ToDoSubtaskslistOption({
    super.key,
    required this.toDoModal,
    required this.tasksListIsCompleted,
    required this.taksListIsShrinked,
    this.onChanged,
    this.shrinkIconOnTap,
    required this.numOfTasksCompleted,
  });
  final ToDoModal toDoModal;
  bool tasksListIsCompleted;
  bool taksListIsShrinked;
  int numOfTasksCompleted;
  final void Function(bool?)? onChanged;
  final void Function()? shrinkIconOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: tasksListIsCompleted,
          activeColor: Colors.yellow,
          onChanged: onChanged,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Text(
            "${toDoModal.title}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          "${numOfTasksCompleted}/${toDoModal.tasks.length}",
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: shrinkIconOnTap,
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              taksListIsShrinked ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
