import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/features/data/note_modal.dart';
import 'package:mynotes_app/features/functions/show_confirmation_dialog.dart';
import 'package:mynotes_app/features/presentation/views/edit_note_view.dart';
import 'package:mynotes_app/features/states_manager/get_notes/get_notes_cubit.dart';

class CustomNoteCard extends StatelessWidget {
  CustomNoteCard({
    super.key,
    required this.noteModal,
    this.deletOptionDisapled,
  });
  final NoteModal noteModal;
  bool? deletOptionDisapled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(noteModal: noteModal),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color(noteModal.noteColor),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noteModal.title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                deletOptionDisapled == null
                    ? GestureDetector(
                        onTap: () {
                          showConfermaTionDailog(
                            context,
                            dailogTitle:
                                "Are your sure you want dellete this note ?",
                            cancelButtonName: "Cancel",
                            confirmButtonName: "Dellete",
                            confirmOnPressed: () {
                              noteModal.delete();
                              BlocProvider.of<GetNotesCubit>(
                                context,
                              ).getNotes();
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 35,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              noteModal.date,
              style: TextStyle(color: const Color(0xFF3B3B3B).withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}
