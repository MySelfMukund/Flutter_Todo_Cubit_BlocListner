import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_listner/cubits/filtered_todo/filtered_todo_cubit.dart';
import 'package:todo_cubit_listner/cubits/todo_active_count/active_todo_count_cubit.dart';
import 'package:todo_cubit_listner/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cubit_listner/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit_listner/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_cubit_listner/presentations/home/todo_page.dart';
import 'package:todo_cubit_listner/utils/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(create: (context) => TodoSearchCubit()),
        BlocProvider<ActiveTodoCountCubit>(
            create: (context) => ActiveTodoCountCubit(
                  initalActiveTodoCount: context.read<TodoListCubit>().state.todos.length,
                )),
        BlocProvider<FilteredTodoCubit>(
            create: (context) => FilteredTodoCubit(
                  initialTodos: BlocProvider.of<TodoListCubit>(context).state.todos,
                ))
      ],
      child: MaterialApp(
        title: 'Todo Cubit Listner',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TodoPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
