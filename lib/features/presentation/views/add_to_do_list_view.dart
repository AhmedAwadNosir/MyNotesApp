import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/core/utils/app_colors.dart';
import 'package:mynotes_app/features/presentation/widgets/add_to_do_list_view_body.dart';
import 'package:mynotes_app/features/presentation/widgets/notes_list_view_bloc_builder.dart';
import 'package:mynotes_app/features/states_manager/add_todo_list/add_todo_list_cubit.dart';
import 'package:mynotes_app/features/states_manager/get_to_do_list.dart/get_to_do_lists_dart_cubit.dart';

class AddToDoListView extends StatelessWidget {
  const AddToDoListView({super.key});
  static const id = "AddToDoListView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Add ToDoList"),
        elevation: 2,
      ),
      body: const AddToDoListViewBodyBlocConsumer(),
    );
  }
}

class AddToDoListViewBodyBlocConsumer extends StatelessWidget {
  const AddToDoListViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTodoListCubit, AddTodoListState>(
      listener: (context, state) {
        if (state is AddTodoListFailure) {}
        if (state is AddTodoListSuccess) {
          BlocProvider.of<GetToDoListsDartCubit>(context).getToDosLists();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is AddTodoListFailure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else {
          return AbsorbPointer(
            absorbing: state is AddTodoListLoading,
            child: const AddToDoListViewBody(),
          );
        }
      },
    );
  }
}
