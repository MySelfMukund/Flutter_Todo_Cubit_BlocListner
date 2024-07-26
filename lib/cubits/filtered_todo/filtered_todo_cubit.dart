// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo_model.dart';
part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  final initialTodos;

  FilteredTodoCubit({
    required this.initialTodos,
  }) : super(FilteredTodoState(filteredTodo: initialTodos));

  void setFilterTodos({required filter, required List<Todo> todos, required String searchText}) {
    List<Todo> _filterTodos;

    switch (filter) {
      case Filter.active:
        _filterTodos = todos.where((Todo todo) => !todo.isCompleted).toList();
        break;
      case Filter.completed:
        _filterTodos = todos.where((Todo todo) => todo.isCompleted).toList();
        break;
      case Filter.all:
      default:
        _filterTodos = todos;
        break;
    }
    if (searchText.isNotEmpty) {
      _filterTodos = _filterTodos.where((Todo todo) => todo.desc.toLowerCase().contains(searchText.toLowerCase())).toList();
    }
    emit(state.copyWith(filteredTodo: _filterTodos));
  }
}
