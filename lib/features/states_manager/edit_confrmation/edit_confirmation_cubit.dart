import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mynotes_app/features/data/note_modal.dart';
import 'package:mynotes_app/features/functions/show_confirmation_dialog.dart';
import 'package:mynotes_app/features/states_manager/get_notes/get_notes_cubit.dart';

part 'edit_confirmation_state.dart';

class EditConfirmationCubit extends Cubit<EditConfirmationState> {
  EditConfirmationCubit() : super(EditConfirmationInitial());
  String? noteTitle;
  String? noteDescription;
  void editNoteConfrmation({
    required NoteModal note,
    @required bool? isboobConfarmation,
    required BuildContext context,
  }) {
    if (isboobConfarmation == null) {
      showConfermaTionDailog(
        context,
        dailogTitle: "Save changes ?",
        cancelButtonName: "Discard",
        confirmButtonName: " Save  ",
        confirmationButtonColor: Colors.green,
        cancelButtonColor: Colors.red,
        icon: const Icon(Icons.info, size: 36),
        confirmOnPressed: () {
          note.title = noteTitle != null
              ? (noteTitle!.isNotEmpty ? noteTitle! : note.title)
              : note.title;
          note.description = noteDescription != null
              ? (noteDescription!.isNotEmpty
                    ? noteDescription!
                    : note.description)
              : note.description;
          note.save();
          BlocProvider.of<GetNotesCubit>(context).getNotes();
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    } else {
      if (noteTitle == note.title && noteDescription == note.description) {
        Navigator.pop(context);
      } else {
        showConfermaTionDailog(
          context,
          dailogTitle: "Are your sure you want discard your changes ?",
          cancelButtonName: "Discard",
          confirmButtonName: " keep  ",
          confirmationButtonColor: Colors.green,
          cancelButtonColor: Colors.red,
          icon: const Icon(Icons.info, size: 36),
          confirmOnPressed: () {
            note.title = noteTitle != null
                ? (noteTitle!.isNotEmpty ? noteTitle! : note.title)
                : note.title;
            note.description = noteDescription != null
                ? (noteDescription!.isNotEmpty
                      ? noteDescription!
                      : note.description)
                : note.description;
            note.save();
            BlocProvider.of<GetNotesCubit>(context).getNotes();
            Navigator.pop(context);
            Navigator.pop(context);
          },
          cancelOnPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      }
    }
  }
}
