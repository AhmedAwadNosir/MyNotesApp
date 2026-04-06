import 'package:hive/hive.dart';
part 'note_modal.g.dart';

@HiveType(typeId: 0)
class NoteModal extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int noteColor;

  NoteModal(
      {required this.title,
      required this.description,
      required this.date,
      required this.noteColor});
}
