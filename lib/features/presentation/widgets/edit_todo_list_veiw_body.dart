import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/core/utils/app_images.dart';
import 'package:mynotes_app/features/data/task_modal.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';
import 'package:mynotes_app/features/functions/show_confirmation_dialog.dart';
import 'package:mynotes_app/features/presentation/widgets/add_task_button.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_task_point.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_text_form_filled.dart';
import 'package:mynotes_app/features/presentation/widgets/edit_note_custom_text_form_field.dart';
import 'package:mynotes_app/features/presentation/widgets/no_notes_found.dart';
import 'package:mynotes_app/features/states_manager/edit_todo_list/edit_todo_list_cubit.dart';

class EditToDoListViewBody extends StatefulWidget {
  EditToDoListViewBody({super.key, required this.toDoModal});
  ToDoModal toDoModal;
  @override
  State<EditToDoListViewBody> createState() => _EditToDoListViewBodyState();
}

class _EditToDoListViewBodyState extends State<EditToDoListViewBody> {
  GlobalKey<FormState> tasksformKey = GlobalKey();
  GlobalKey<FormState> titleformKey = GlobalKey();
  AutovalidateMode tasksAutovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode titleAutovalidateMode = AutovalidateMode.disabled;
  String? taskListTitle;
  String? task;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    BlocProvider.of<EditTodoListCubit>(context).toDoListTitle =
        widget.toDoModal.title;
    BlocProvider.of<EditTodoListCubit>(context).tasks = widget.toDoModal.tasks;
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
                intialValue: widget.toDoModal.title,
                maxLines: 1,
                maxLength: 18,
                hintFontSize: 24,
                onChanged: (value) {
                  BlocProvider.of<EditTodoListCubit>(context).toDoListTitle =
                      value!;
                  setState(() {});
                },
                onSaved: (value) {
                  BlocProvider.of<EditTodoListCubit>(context).toDoListTitle =
                      value!;
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
          BlocProvider.of<EditTodoListCubit>(context).tasks!.isEmpty
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
                  height: MediaQuery.of(context).size.height * 0.58,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 16),
                    child: ListView.builder(
                      itemCount: BlocProvider.of<EditTodoListCubit>(
                        context,
                      ).tasks!.length,
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
                                BlocProvider.of<EditTodoListCubit>(
                                  context,
                                ).tasks!.removeAt(index);
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
                            taskModal: BlocProvider.of<EditTodoListCubit>(
                              context,
                            ).tasks![index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        BlocProvider.of<EditTodoListCubit>(context).tasks!.add(
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
        ],
      ),
    );
  }
}
