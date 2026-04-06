import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/core/utils/app_colors.dart';
import 'package:mynotes_app/features/presentation/widgets/color_picker.dart';
import 'package:mynotes_app/features/states_manager/add_notes/add_notes_cubit.dart';

class ColorPickerListView extends StatefulWidget {
  ColorPickerListView({super.key});

  @override
  State<ColorPickerListView> createState() => _ColorPickerListViewState();
}

class _ColorPickerListViewState extends State<ColorPickerListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppColors.kcolors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNotesCubit>(context).noteColor =
                  AppColors.kcolors[index];
              setState(() {});
            },
            child: ColorPiker(
              bacgroundColor: AppColors.kcolors[index],
              isSelected: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
