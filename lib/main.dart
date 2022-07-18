import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/modules/counter_app/counter_screen.dart';
import 'package:task1/modules/on_boarding/onboard_screen.dart';
import 'package:task1/modules/users/bloc/cubit.dart';
import 'package:task1/modules/users/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..initAppDatabase(),

        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardScreen(),
      ),
    );
  }
}


