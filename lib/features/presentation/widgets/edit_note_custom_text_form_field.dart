import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EditNoteCustomTextFormFilled extends StatelessWidget {
  const EditNoteCustomTextFormFilled(
      {super.key,
      this.onSaved,
      required this.hint,
      @required this.maxLines,
      @required this.intialValue,
      @required this.fontSize,
      @required this.fontWeight,
      @required this.hintFontSize,
      @required this.maxLength,
      this.onChanged});
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String hint;
  final int? maxLines;
  final String? intialValue;
  final double? fontSize;
  final double? hintFontSize;
  final FontWeight? fontWeight;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      maxLength: maxLength,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Filed is required";
        }
      },
      maxLines: maxLines,
      initialValue: intialValue,
      style: TextStyle(
          fontSize: fontSize ?? 20,
          color: Colors.white,
          fontWeight: fontWeight),
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: hintFontSize ?? fontSize ?? 22,
            fontWeight: FontWeight.w300),
      ),
      enableSuggestions: true,
    );
  }
}
