import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/features/data/note_modal.dart';
import 'package:mynotes_app/features/presentation/widgets/edit_note_view_body.dart';
import 'package:mynotes_app/features/states_manager/edit_confrmation/edit_confirmation_cubit.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModal});
  static const id = "editNoteView";
  final NoteModal noteModal;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        BlocProvider.of<EditConfirmationCubit>(context).editNoteConfrmation(
          note: noteModal,
          isboobConfarmation: true,
          context: context,
        ); // this is so imporatant solve app crach black view when i navpop in realase edtion
      },
      child: SafeArea(
        child: Scaffold(body: EditNoteViewBody(noteModal: noteModal)),
      ),
    );
  }
}
