import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/api/api_helper.dart';
import 'package:newsapp/api/end_point.dart';

import '../api/news_model.dart';
import '../constants/constant.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context)=>BlocProvider.of(context);
  NewsModel? newsModel;
  NewsModel ? ResultData;

void getTopHeadLine()async{
  emit(GetTopHeadLineLoading());

  try{
    Response response =await DioHelper.getAllData(
        endPoint: topHeadLine, quaryParamter: {
          "apiKey":apiKey,
          "country":"us"
    });
    print(response.statusCode);
    if(response.statusCode==200){
      newsModel=NewsModel.fromJson(response.data);
      emit(GetTopHeadLineSucseccfuly());
    }

    else{
      emit(GetTopHeadLineError(message: "Server Response Error"));
    }
  }
  catch(error,stackTrace){
    print(error);
    print(stackTrace);
    emit(GetTopHeadLineError(message: "Internet Connection Faild"));
  }
}

void getResultData(String category)async{
  emit(GetResultDataLoading());
  try{
    Response res=await DioHelper.getAllData(
        endPoint:topHeadLine,
        quaryParamter:{
          "apiKey":apiKey,
          "country":'us',
          "category":category
        }
    );

    if(res.statusCode==200){
      ResultData=NewsModel.fromJson(res.data);
      emit(GetResultDataSucssecfuly());
    }

    else{
      emit(GetResultDataError(message: "Server Response Error"));
    }
  }
  catch(error,stackTrace){
    print(error);
    print(stackTrace);
    emit(GetResultDataError(message: "Internet Connection Failed"));
  }
}
void getResultToSearch (String q)async{

  emit(GetResultDataLoading());
  try{
    Response res= await DioHelper.getAllData(endPoint:everyThing,
        quaryParamter:{
      "apiKey":apiKey,
      "q":q
        }
    );

    if(res.statusCode==200){
      ResultData= NewsModel.fromJson(res.data);
      emit(GetResultDataSucssecfuly());
    }
    else{
      emit(GetResultDataError(message: "Server Response Error"));
    }
  }
  catch(error,stackTrace){
    print(error);
    print(stackTrace);
    emit(GetResultDataError(message: "Internet Connection Failed"));
  }
}
}
