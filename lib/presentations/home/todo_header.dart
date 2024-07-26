import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_listner/cubits/todo_list/todo_list_cubit.dart';

import '../../cubits/todo_active_count/active_todo_count_cubit.dart';
import '../../models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 35),
        ),
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            int activeTodoCount = state.todos.where((Todo todo) => !todo.isCompleted).toList().length;
            context.read<ActiveTodoCountCubit>().calculateActiveTodoCount(activeTodoCount);
          },
          child: BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
            builder: (context, state) {
              return Text('${state.activeCount.toString()} items left', style: TextStyle(fontSize: 20, color: Colors.red));
            },
          ),
        )
      ],
    );
  }
}
