import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit_listner/cubits/todo_active_count/active_todo_count_cubit.dart';
import 'package:todo_cubit_listner/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cubit_listner/cubits/todo_list/todo_list_cubit.dart';
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
        BlocProvider(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider(
            create: (context) => ActiveTodoCountCubit(
                initalActiveTodoCount: context.read<TodoListCubit>().state.todos.length,
                todoListCubit: BlocProvider.of<TodoListCubit>(context)))
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
