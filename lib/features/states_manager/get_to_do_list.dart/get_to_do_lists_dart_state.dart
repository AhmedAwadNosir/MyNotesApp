part of 'get_to_do_lists_dart_cubit.dart';

@immutable
sealed class GetToDoListsDartState {}

final class GetToDoListsDartInitial extends GetToDoListsDartState {}

final class GetToDoListsDartLoading extends GetToDoListsDartState {}

final class GetToDoListsDartSuccess extends GetToDoListsDartState {
  final List<ToDoModal> todoList;

  GetToDoListsDartSuccess({required this.todoList});
}

final class GetToDoListsDartFilure extends GetToDoListsDartState {
  final String errorMessage;

  GetToDoListsDartFilure({required this.errorMessage});
}
