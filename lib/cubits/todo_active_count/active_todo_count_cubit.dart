import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final int initalActiveTodoCount;

  ActiveTodoCountCubit({required this.initalActiveTodoCount}) : super(ActiveTodoCountState(activeCount: initalActiveTodoCount));

  void calculateActiveTodoCount(int activeTodoCount) {
    emit(state.copyWith(activeCount: activeTodoCount));
  }
}
