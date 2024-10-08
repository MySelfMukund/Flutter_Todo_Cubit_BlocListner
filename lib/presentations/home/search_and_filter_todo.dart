import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/todo_filter/todo_filter_cubit.dart';
import '../../cubits/todo_search/todo_search_cubit.dart';
import '../../models/todo_model.dart';
import '../../utils/debounce.dart';

class SearchAndFilterTodo extends StatelessWidget {
  SearchAndFilterTodo({super.key});
  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              labelText: 'Search Todo...', border: InputBorder.none, filled: true, prefix: Icon(Icons.search)),
          onChanged: (String newSearchString) {
            if (newSearchString != null) {
              debounce.run(() {
                context.read<TodoSearchCubit>().searchText(newSearchString);
              });
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
          filter == Filter.all
              ? 'All'
              : filter == Filter.active
                  ? 'Active'
                  : 'Completed',
          style: TextStyle(fontSize: 18.0, color: textColor(context, filter))),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilterValue = context.watch<TodoFilterCubit>().state.filter;
    return currentFilterValue == filter ? Colors.blue : Colors.grey;
  }
}
