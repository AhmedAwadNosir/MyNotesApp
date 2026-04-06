import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/features/presentation/widgets/search_view_body.dart';
import 'package:mynotes_app/features/states_manager/get_notes/get_notes_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const id = "SearchView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GetNotesCubit, GetNotesState>(
          builder: (context, state) {
            return SearchVeiwBody(
              notes: state is GetNotesSuccess ? state.notes : [],
            );
          },
        ),
      ),
    );
  }
}
