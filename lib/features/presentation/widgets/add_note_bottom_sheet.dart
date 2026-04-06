import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/features/presentation/widgets/add_note_form_bloc_consumer.dart';
import 'package:mynotes_app/features/states_manager/add_notes/add_notes_cubit.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => AddNotesCubit(),
          child: const AddNoteFormBlocConsumer(),
        ),
      ),
    );
  }
}
