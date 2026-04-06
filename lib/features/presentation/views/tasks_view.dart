import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/features/presentation/views/add_to_do_list_view.dart';
import 'package:mynotes_app/features/presentation/widgets/tasks_view_body.dart';
import 'package:mynotes_app/features/states_manager/get_to_do_list.dart/get_to_do_lists_dart_cubit.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});
  static const id = "TasksView";

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  void initState() {
    BlocProvider.of<GetToDoListsDartCubit>(context).getToDosLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const TasksViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddToDoListView.id);
          },
          backgroundColor: const Color(0xFF252525),
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 38),
        ),
      ),
    );
  }
}
