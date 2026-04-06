import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mynotes_app/core/utils/app_constants.dart';
import 'package:mynotes_app/features/data/note_modal.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());
  void getNotes() {
    try {
      var box = Hive.box<NoteModal>(kNotesBox);
      List<NoteModal> notes = box.values.toList();
      print(notes.length);
      emit(GetNotesSuccess(notes: notes));
    } catch (e) {
      emit(GetNotesFailure(errorMessage: e.toString()));
    }
  }
}
