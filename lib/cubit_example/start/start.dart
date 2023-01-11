import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_learn/cubit_example/start/start_cubit.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 100,
      child: BlocBuilder<StartCubit, int>(
        builder: (context, state) {
          return Row(
            children: [
              TextButton(
                  onPressed: () => context.read<StartCubit>().increment(),
                  child: const Text('increment')),
              TextButton(
                  onPressed: () => context.read<StartCubit>().decrement(),
                  child: const Text('decrement')),
              TextButton(
                  onPressed: () => context.read<StartCubit>().reset(),
                  child: const Text('reset')),
              Text(state.toString()),
            ],
          );
        },
      ),
    ));
  }
}
