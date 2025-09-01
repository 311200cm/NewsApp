import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Api/API_Helper.dart';
import 'package:newsapp/Api/End_Point.dart';
import 'package:newsapp/Api/News_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/Const/Constant.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context)=>BlocProvider.of(context);
  NewsModel? newsModel;
  NewsModel ? ResultData;

void GetTopHeadLine()async{
  emit(GetTopHeadLineLoading());

  try{
    Response response =await Dio_Helper.GetAllData(
        endPoint: TOPHEADLINE, quaryParamter: {
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

void GetResultData(String category)async{
  emit(GetResultDataLoading());
  try{
    Response res=await Dio_Helper.GetAllData(
        endPoint:TOPHEADLINE,
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
void GetResultToSearch (String q)async{

  emit(GetResultDataLoading());
  try{
    Response res= await Dio_Helper.GetAllData(endPoint:EVERYTHING,
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
