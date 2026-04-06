import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynotes_app/core/utils/app_images.dart';
import 'package:mynotes_app/features/data/note_modal.dart';
import 'package:mynotes_app/features/presentation/widgets/custom_search_bar.dart';
import 'package:mynotes_app/features/presentation/widgets/no_notes_found.dart';
import 'package:mynotes_app/features/presentation/widgets/notes_list_view.dart';

class SearchVeiwBody extends StatefulWidget {
  const SearchVeiwBody({super.key, required this.notes});
  static const id = "SearchView";
  final List<NoteModal> notes;
  @override
  State<SearchVeiwBody> createState() => _SearchVeiwBodyState();
}

class _SearchVeiwBodyState extends State<SearchVeiwBody> {
  late TextEditingController controller;
  List<NoteModal> searchedNotes = [];
  int notesLength = 0;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHight * 0.05),
            CustomSearchBar(
              controller: controller,
              onChanged: (value) {
                searchedNotes = widget.notes
                    .where((note) => note.title.contains(value))
                    .toList();
                if (value.isEmpty) {
                  searchedNotes = [];
                }
                setState(() {});
              },
            ),
            SizedBox(
              height: searchedNotes.isNotEmpty
                  ? screenHight * 0.05
                  : screenHight * 0.09,
            ),
            searchedNotes.isNotEmpty
                ? SizedBox(
                    height: screenHight * 0.7,
                    child: NotesListView(
                      notes: searchedNotes,
                      deletOptionDisabled: true,
                    ),
                  )
                : const NoDataFound(
                    title: "File not found. Try searching again.",
                    dataImage: AppImages.noFilesFound,
                  ),
          ],
        ),
      ),
    );
  }
}
