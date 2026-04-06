import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mynotes_app/core/utils/app_constants.dart';
import 'package:mynotes_app/features/data/note_modal.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color noteColor = Colors.yellow;
  void addNotes({required NoteModal note}) {
    note.noteColor = noteColor.toARGB32();
    emit(AddNotesLoding());
    try {
      var box = Hive.box<NoteModal>(kNotesBox);
      box.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(errorMessage: e.toString()));
    }
  }
}
