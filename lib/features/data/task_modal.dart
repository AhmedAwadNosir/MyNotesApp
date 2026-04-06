import 'package:hive_flutter/adapters.dart';

part 'task_modal.g.dart';

@HiveType(typeId: 2)
class TaskModal extends HiveObject {
  @HiveField(0)
  String taskDescreption;
  @HiveField(1)
  bool isCompleted;

  TaskModal({
    required this.taskDescreption,
    required this.isCompleted,
  });
}
