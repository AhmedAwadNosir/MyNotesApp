// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoModalAdapter extends TypeAdapter<ToDoModal> {
  @override
  final int typeId = 1;

  @override
  ToDoModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoModal(
      title: fields[0] as String,
      tasks: (fields[1] as List).cast<TaskModal>(),
      numOfCompletedTasks: fields[2] as int,
      tasksListIsChrinked: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.tasks)
      ..writeByte(2)
      ..write(obj.numOfCompletedTasks)
      ..writeByte(3)
      ..write(obj.tasksListIsChrinked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
