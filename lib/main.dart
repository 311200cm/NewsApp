import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/api_helper.dart';
import 'package:newsapp/cubit/news_cubit.dart';
import 'package:newsapp/screens/lay_out_screen.dart';
void main()async {
  await DioHelper.initilization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getTopHeadLine(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutScreen(),
      ),
    );
  }
}

