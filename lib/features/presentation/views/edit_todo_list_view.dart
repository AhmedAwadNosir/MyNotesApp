import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/core/utils/app_colors.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';
import 'package:mynotes_app/features/presentation/widgets/edit_todo_list_veiw_body.dart';
import 'package:mynotes_app/features/states_manager/edit_todo_list/edit_todo_list_cubit.dart';

class EditTodoListView extends StatelessWidget {
  const EditTodoListView({super.key, required this.toDoModal});
  final ToDoModal toDoModal;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop)
          return; // this is so imporatant solve app crach black view when i navpop in realase edtion
        BlocProvider.of<EditTodoListCubit>(
          context,
        ).editToDoList(todoList: toDoModal, context: context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text("Edit ToDoList"),
          elevation: 2,
        ),
        body: EditToDoListViewBody(toDoModal: toDoModal),
      ),
    );
  }
}
