import 'package:flutter/material.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_task_widget.dart';
import 'package:mynotes_app/features/presentation/widgets/to_do_subtaskslist_option.dart';

class ToDoCard extends StatefulWidget {
  const ToDoCard({super.key, required this.toDoModal});
  final ToDoModal toDoModal;
  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
        height: widget.toDoModal.tasksListIsChrinked
            ? 100
            : (widget.toDoModal.tasks.length * 50) +
                  100, //try to solve this problem of make it take size of childern no fixed size
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToDoSubtaskslistOption(
              toDoModal: widget.toDoModal,
              numOfTasksCompleted: widget.toDoModal.numOfCompletedTasks,
              onChanged: (value) {
                setState(() {
                  for (var task in widget.toDoModal.tasks) {
                    task.isCompleted = value!;
                  }
                  if (value! == true) {
                    widget.toDoModal.numOfCompletedTasks =
                        widget.toDoModal.tasks.length;
                  } else {
                    widget.toDoModal.numOfCompletedTasks = 0;
                  }
                  widget.toDoModal.save();
                });
              },
              shrinkIconOnTap: () {
                setState(() {
                  widget.toDoModal.tasksListIsChrinked =
                      !widget.toDoModal.tasksListIsChrinked;
                });
                widget.toDoModal.save();
              },
              tasksListIsCompleted:
                  widget.toDoModal.numOfCompletedTasks ==
                  widget.toDoModal.tasks.length,
              taksListIsShrinked: widget.toDoModal.tasksListIsChrinked,
            ),
            widget.toDoModal.tasksListIsChrinked
                ? const SizedBox()
                : Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: ListView.builder(
                        itemCount: widget.toDoModal.tasks.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 50,
                            child: CustomTaskWidget(
                              taskModal: widget.toDoModal.tasks[index],
                              onChanged: (value) {
                                widget.toDoModal.tasks[index].isCompleted =
                                    value!;
                                widget.toDoModal.save();
                                setState(() {});
                                if (value == true) {
                                  widget.toDoModal.numOfCompletedTasks++;
                                } else {
                                  widget.toDoModal.numOfCompletedTasks--;
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
