part of 'add_notes_cubit.dart';

@immutable
sealed class AddNotesState {}

final class AddNotesInitial extends AddNotesState {}

final class AddNotesLoding extends AddNotesState {}

final class AddNotesSuccess extends AddNotesState {}

final class AddNotesFailure extends AddNotesState {
  final String errorMessage;

  AddNotesFailure({required this.errorMessage});
}
