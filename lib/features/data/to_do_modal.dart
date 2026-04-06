import 'package:hive/hive.dart';
import 'package:mynotes_app/features/data/task_modal.dart';
part 'to_do_modal.g.dart';

@HiveType(typeId: 1)
class ToDoModal extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  List<TaskModal> tasks;
  @HiveField(2)
  int numOfCompletedTasks;
  @HiveField(3)
  bool tasksListIsChrinked;

  ToDoModal({
    required this.title,
    required this.tasks,
    required this.numOfCompletedTasks,
    required this.tasksListIsChrinked,
  });
}
