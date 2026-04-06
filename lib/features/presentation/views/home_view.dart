import 'package:flutter/material.dart';
import 'package:mynotes_app/core/utils/app_colors.dart';
import 'package:mynotes_app/features/presentation/views/notes_veiw.dart';
import 'package:mynotes_app/features/presentation/views/tasks_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const id = "homeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  int currentIndex = 0;
  List<Widget> views = [const TasksView(), const NotesView()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: views[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outlined),
              label: '',
              activeIcon: Icon(Icons.check_box),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: '',
              activeIcon: Icon(Icons.book),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          iconSize: 30,
        ),
      ),
    );
  }
}
