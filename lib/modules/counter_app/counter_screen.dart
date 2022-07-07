import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/modules/counter_app/counter_cubit/cubit.dart';
import 'package:task1/modules/counter_app/counter_cubit/states.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context){
          return CounterCubit();
        },
        child: BlocConsumer<CounterCubit,CounterStates>(
          listener:(context, state) {
            if (state is CounterDecrementState) print('Minus state');
            if (state is CounterIncrementState) print('Plus state ');
          },
          builder: (context,state){
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    FloatingActionButton(
                      onPressed: (){
                        CounterCubit.get(context).deincrement();
                      },
                      child: Icon(
                          Icons.remove
                      ),

                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '${CounterCubit.get(context).counter}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        CounterCubit.get(context).increment();

                      },
                      child: Icon(
                          Icons.add
                      ),

                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),

    );
  }
}
