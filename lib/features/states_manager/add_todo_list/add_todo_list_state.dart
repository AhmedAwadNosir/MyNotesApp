part of 'add_todo_list_cubit.dart';

@immutable
sealed class AddTodoListState {}

final class AddTodoListInitial extends AddTodoListState {}

final class AddTodoListLoading extends AddTodoListState {}

final class AddTodoListSuccess extends AddTodoListState {}

final class AddTodoListFailure extends AddTodoListState {
  final String errorMessage;

  AddTodoListFailure({required this.errorMessage});
}
