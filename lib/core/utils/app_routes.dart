import 'package:flutter/material.dart';
import 'package:mynotes_app/features/presentation/views/add_to_do_list_view.dart';
import 'package:mynotes_app/features/presentation/views/home_view.dart';
import 'package:mynotes_app/features/presentation/views/notes_veiw.dart';
import 'package:mynotes_app/features/presentation/views/search_view.dart';
import 'package:mynotes_app/features/presentation/views/tasks_view.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        NotesView.id: (context) => const NotesView(),
        SearchView.id: (context) => const SearchView(),
        HomeView.id: (context) => const HomeView(),
        TasksView.id: (context) => const TasksView(),
        AddToDoListView.id: (context) => const AddToDoListView(),
      };
}
