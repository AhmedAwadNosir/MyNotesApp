import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/features/presentation/widgets/add_note_bottom_sheet.dart';
import 'package:mynotes_app/features/presentation/widgets/notes_view_body.dart';
import 'package:mynotes_app/features/states_manager/get_notes/get_notes_cubit.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
  static const id = "notesVeiw";

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<GetNotesCubit>(context).getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: const Color(0xFF2F2F2F),
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const AddNoteBottomSheet(),
                );
              },
            );
          },
          backgroundColor: const Color(0xFF252525),
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 38),
        ),
      ),
    );
  }
}
