import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TODO',
          style: TextStyle(fontSize: 35),
        ),
        // BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
        //   builder: (context, state) {
        //     return Text('${state.activeCount.toString()} items left', style: TextStyle(fontSize: 20, color: Colors.red));
        Text('0 items left', style: TextStyle(fontSize: 20, color: Colors.red))
        //   },
        // )
      ],
    );
  }
}
