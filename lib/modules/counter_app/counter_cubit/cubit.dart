import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/modules/counter_app/counter_cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() :super(CounterInitialState());


  static CounterCubit get(context) =>BlocProvider.of(context);


  int counter = 1;

  void increment()
  {
    counter++;

    emit(CounterIncrementState(),);
  }

  void deincrement()
  {
    counter--;

    emit(CounterDecrementState(),);

  }

}
