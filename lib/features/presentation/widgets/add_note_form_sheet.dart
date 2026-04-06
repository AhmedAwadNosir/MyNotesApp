import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/features/data/note_modal.dart';
import 'package:mynotes_app/features/presentation/widgets/color_picker_list_view.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_button.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_text_form_filled.dart';
import 'package:mynotes_app/features/states_manager/add_notes/add_notes_cubit.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? noteTitle;
  String? noteDescription;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormFilled(
            hint: "Title",
            onSaved: (value) {
              noteTitle = value;
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormFilled(
            hint: "Content",
            maxLines: 5,
            onSaved: (value) {
              noteDescription = value;
            },
          ),
          const SizedBox(height: 15),
          ColorPickerListView(),
          const SizedBox(height: 60),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    BlocProvider.of<AddNotesCubit>(context).addNotes(
                      note: NoteModal(
                        title: noteTitle!,
                        description: noteDescription!,
                        date:
                            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        noteColor: Colors.orange.value,
                      ),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                isLoading: state is AddNotesLoding,
              );
            },
          ),
        ],
      ),
    );
  }
}
