import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mynotes_app/features/data/task_modal.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';
import 'package:mynotes_app/features/states_manager/get_to_do_list.dart/get_to_do_lists_dart_cubit.dart';

part 'edit_todo_list_state.dart';

class EditTodoListCubit extends Cubit<EditTodoListState> {
  EditTodoListCubit() : super(EditTodoListInitial());
  String? toDoListTitle;
  List<TaskModal>? tasks;
  void editToDoList({
    required ToDoModal todoList,
    required BuildContext context,
  }) {
    todoList.title = toDoListTitle!;
    todoList.tasks = tasks!;
    todoList.save();
    BlocProvider.of<GetToDoListsDartCubit>(context).getToDosLists();
    Navigator.pop(context);
  }
}
