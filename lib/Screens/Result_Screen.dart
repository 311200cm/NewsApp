import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Cubit/news_cubit.dart';
import 'package:newsapp/Screens/Shared_Card.dart';
import 'package:newsapp/Screens/Shared_Card.dart';
class ResultScreen extends StatelessWidget {
  String title;
   ResultScreen({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<NewsCubit,NewsState>(
          builder: (context,state){
            if(state is GetResultDataLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            else if(state is GetResultDataError){
              return Center(
                child: Text(state.message,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                ),
              );
            }

            else{
              var cubit =NewsCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                    itemBuilder:(context,index) {
                      return SharedCard(
                          articles: cubit.ResultData!.articles![index]);
                    },
                    separatorBuilder:(context,index){
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount:cubit.ResultData!.articles!.length,
                ),
              );
            }
          },
          listener: (context,state){}
      ),
    );
  }
}
