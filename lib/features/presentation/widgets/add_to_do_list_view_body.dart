import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/core/utils/app_images.dart';
import 'package:mynotes_app/features/data/task_modal.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';
import 'package:mynotes_app/features/functions/show_confirmation_dialog.dart';
import 'package:mynotes_app/features/presentation/widgets/add_task_button.dart';
import 'package:mynotes_app/features/presentation/widgets/create_to_dolist_button.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_task_point.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_text_form_filled.dart';
import 'package:mynotes_app/features/presentation/widgets/edit_note_custom_text_form_field.dart';
import 'package:mynotes_app/features/presentation/widgets/no_notes_found.dart';
import 'package:mynotes_app/features/states_manager/add_todo_list/add_todo_list_cubit.dart';

class AddToDoListViewBody extends StatefulWidget {
  const AddToDoListViewBody({super.key});

  @override
  State<AddToDoListViewBody> createState() => _AddToDoListViewBodyState();
}

class _AddToDoListViewBodyState extends State<AddToDoListViewBody> {
  GlobalKey<FormState> tasksformKey = GlobalKey();
  GlobalKey<FormState> titleformKey = GlobalKey();
  AutovalidateMode tasksAutovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode titleAutovalidateMode = AutovalidateMode.disabled;
  String? taskListTitle;
  String? task;
  late TextEditingController textEditingController;
  ToDoModal toDoModal = ToDoModal(
    title: "",
    tasks: [],
    numOfCompletedTasks: 0,
    tasksListIsChrinked: false,
  );
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: titleformKey,
              autovalidateMode: titleAutovalidateMode,
              child: EditNoteCustomTextFormFilled(
                hint: "To Do Title",
                fontWeight: FontWeight.w600,
                maxLines: 1,
                maxLength: 18,
                hintFontSize: 24,
                onSaved: (value) {
                  toDoModal.title = value!;
                },
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text("Tasks", style: TextStyle(fontSize: 24)),
          ),
          toDoModal.tasks.isEmpty
              ? Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: const NoDataFound(
                      title: "Add Task!",
                      dataImage: AppImages.noFilesFound,
                    ),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 16),
                    child: ListView.builder(
                      itemCount: toDoModal.tasks.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onLongPress: () {
                            showConfermaTionDailog(
                              context,
                              dailogTitle:
                                  "Are you sure you want to dellete this task",
                              confirmButtonName: "Dellete",
                              cancelButtonName: "Cancel",
                              confirmOnPressed: () {
                                toDoModal.tasks.removeAt(index);
                                setState(() {});
                                Navigator.pop(context);
                              },
                              cancelOnPressed: () {
                                Navigator.pop(context);
                              },
                              confirmationButtonColor: Colors.red,
                              cancelButtonColor: Colors.green,
                            );
                          },
                          child: CustomTaskPoint(
                            taskModal: toDoModal.tasks[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.77,
                  child: Form(
                    key: tasksformKey,
                    autovalidateMode: tasksAutovalidateMode,
                    child: CustomTextFormFilled(
                      controller: textEditingController,
                      hint: "Add Task",
                      maxLines: 1,
                      fontSize: 18,
                      onSaved: (value) {
                        task = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 68,
                  height: 68,
                  child: AddTaskButton(
                    onPressed: () {
                      if (tasksformKey.currentState!.validate()) {
                        tasksformKey.currentState!.save();
                        toDoModal.tasks.add(
                          TaskModal(taskDescreption: task!, isCompleted: false),
                        );
                        textEditingController.clear();
                        setState(() {});
                      } else {
                        tasksAutovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 120,
              height: 48,
              child: CreateToDolistButton(
                onPressed: () {
                  if (titleformKey.currentState!.validate()) {
                    titleformKey.currentState!.save();
                    BlocProvider.of<AddTodoListCubit>(
                      context,
                    ).addToDoList(toDoModal: toDoModal);
                  } else {
                    titleAutovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
