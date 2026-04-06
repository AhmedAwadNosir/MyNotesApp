import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/core/utils/app_images.dart';
import 'package:mynotes_app/features/functions/show_app_info_dialog.dart';
import 'package:mynotes_app/features/functions/show_confirmation_dialog.dart';
import 'package:mynotes_app/features/presentation/views/edit_todo_list_view.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_search_button.dart';
import 'package:mynotes_app/features/presentation/widgets/no_notes_found.dart';
import 'package:mynotes_app/features/presentation/widgets/notes_list_view_bloc_builder.dart';
import 'package:mynotes_app/features/presentation/widgets/to_do_card.dart';
import 'package:mynotes_app/features/states_manager/get_to_do_list.dart/get_to_do_lists_dart_cubit.dart';

class TasksViewBody extends StatefulWidget {
  const TasksViewBody({super.key});

  @override
  State<TasksViewBody> createState() => _TasksViewBodyState();
}

class _TasksViewBodyState extends State<TasksViewBody> {
  bool taskCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tasks",
                style: TextStyle(fontSize: 43, fontWeight: FontWeight.w300),
              ),
              const Spacer(),
              //search icon
              const SizedBox(width: 16),
              CustomIconButton(
                ontap: () {
                  showAppInfoDialog(context);
                },
                icon: Icons.info_outline,
              ),
            ],
          ),
          const SizedBox(height: 18),
          const ToDoListViewBuilderBlocConsumer(),
        ],
      ),
    );
  }
}

class ToDoListViewBuilderBlocConsumer extends StatelessWidget {
  const ToDoListViewBuilderBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetToDoListsDartCubit, GetToDoListsDartState>(
      listener: (context, state) {
        if (state is GetToDoListsDartFilure) {}
      },
      builder: (context, state) {
        if (state is GetToDoListsDartFilure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else if (state is GetToDoListsDartSuccess) {
          return state.todoList.isEmpty
              ? const NoDataFound(
                  title: "No ToDo List Add One",
                  dataImage: AppImages.noFilesFound,
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: state.todoList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTodoListView(
                                toDoModal: state.todoList[index],
                              ),
                            ),
                          );
                        },
                        onLongPress: () {
                          showConfermaTionDailog(
                            context,
                            dailogTitle:
                                "Are your sure you want dellete this toDoList ?",
                            cancelButtonName: "Cancel",
                            confirmButtonName: "Dellete",
                            confirmOnPressed: () {
                              state.todoList[index].delete();
                              BlocProvider.of<GetToDoListsDartCubit>(
                                context,
                              ).getToDosLists();
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: ToDoCard(toDoModal: state.todoList[index]),
                      );
                    },
                  ),
                );
        } else {
          return const CircularProgressIndicator(
            color: Colors.deepPurpleAccent,
          );
        }
      },
    );
  }
}
