import 'package:flutter/material.dart';
import 'package:mynotes_app/features/data/note_modal.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_note_card.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key, required this.notes, this.deletOptionDisabled});
  final List<NoteModal> notes;
  bool? deletOptionDisabled;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomNoteCard(
            noteModal: notes[index],
            deletOptionDisapled: deletOptionDisabled,
          ),
        );
      },
    );
  }
}
