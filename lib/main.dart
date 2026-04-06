import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mynotes_app/core/utils/app_constants.dart';
import 'package:mynotes_app/core/utils/app_routes.dart';
import 'package:mynotes_app/features/data/note_modal.dart';
import 'package:mynotes_app/features/data/task_modal.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';
import 'package:mynotes_app/features/presentation/views/home_view.dart';
import 'package:mynotes_app/features/states_manager/add_todo_list/add_todo_list_cubit.dart';
import 'package:mynotes_app/features/states_manager/edit_confrmation/edit_confirmation_cubit.dart';
import 'package:mynotes_app/features/states_manager/edit_todo_list/edit_todo_list_cubit.dart';
import 'package:mynotes_app/features/states_manager/get_notes/get_notes_cubit.dart';
import 'package:mynotes_app/features/states_manager/get_to_do_list.dart/get_to_do_lists_dart_cubit.dart';

import 'core/utils/app_colors.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModalAdapter());
  Hive.registerAdapter(TaskModalAdapter());
  Hive.registerAdapter(ToDoModalAdapter());
  await Hive.openBox<NoteModal>(kNotesBox);
  await Hive.openBox<ToDoModal>(kToDoListBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetNotesCubit()),
        BlocProvider(create: (context) => EditConfirmationCubit()),
        BlocProvider(create: (context) => GetToDoListsDartCubit()),
        BlocProvider(create: (context) => AddTodoListCubit()),
        BlocProvider(create: (context) => EditTodoListCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryColor,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        initialRoute: HomeView.id,
        routes: AppRoutes.routes,
      ),
    );
  }
}
