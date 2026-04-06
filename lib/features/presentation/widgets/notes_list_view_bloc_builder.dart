import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/core/utils/app_images.dart';
import 'package:mynotes_app/features/presentation/widgets/no_notes_found.dart';
import 'package:mynotes_app/features/presentation/widgets/notes_list_view.dart';
import 'package:mynotes_app/features/states_manager/get_notes/get_notes_cubit.dart';

class NotesListViewBlocBuilder extends StatelessWidget {
  const NotesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesFailure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else if (state is GetNotesSuccess) {
          return state.notes.isNotEmpty
              ? Expanded(child: NotesListView(notes: state.notes))
              : const NoDataFound(
                  title: 'Create your first note !',
                  dataImage: AppImages.letsCreateNote,
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
