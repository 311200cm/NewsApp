import 'package:flutter/material.dart';
import 'package:newsapp/Api/API_Helper.dart';
import 'package:newsapp/Cubit/news_cubit.dart';
import 'package:newsapp/Screens/LayOut_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main()async {
  await Dio_Helper.Initilization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..GetTopHeadLine(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutScreen(),
      ),
    );
  }
}

