import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mynotes_app/core/utils/app_constants.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';

part 'get_to_do_lists_dart_state.dart';

class GetToDoListsDartCubit extends Cubit<GetToDoListsDartState> {
  GetToDoListsDartCubit() : super(GetToDoListsDartInitial());
  void getToDosLists() {
    emit(GetToDoListsDartLoading());
    try {
      var box = Hive.box<ToDoModal>(kToDoListBox);
      List<ToDoModal> todosLists = box.values.toList();
      emit(GetToDoListsDartSuccess(todoList: todosLists));
    } catch (e) {
      emit(GetToDoListsDartFilure(errorMessage: e.toString()));
    }
  }
}
