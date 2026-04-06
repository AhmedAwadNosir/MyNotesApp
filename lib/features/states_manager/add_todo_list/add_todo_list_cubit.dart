import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mynotes_app/core/utils/app_constants.dart';
import 'package:mynotes_app/features/data/to_do_modal.dart';
part 'add_todo_list_state.dart';

class AddTodoListCubit extends Cubit<AddTodoListState> {
  AddTodoListCubit() : super(AddTodoListInitial());

  void addToDoList({required ToDoModal toDoModal}) {
    emit(AddTodoListLoading());
    try {
      var box = Hive.box<ToDoModal>(kToDoListBox);
      box.add(toDoModal);
      emit(AddTodoListSuccess());
    } catch (e) {
      emit(AddTodoListFailure(errorMessage: e.toString()));
    }
  }
}
