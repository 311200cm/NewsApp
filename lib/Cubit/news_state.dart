part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

class GetTopHeadLineLoading extends NewsState{}
class GetTopHeadLineSucseccfuly extends NewsState{}
class GetTopHeadLineError extends NewsState{
  String? message;

  GetTopHeadLineError({
    required this.message
}){}
}

class GetResultDataLoading extends NewsState{}
class GetResultDataError extends NewsState{
  String message;
  GetResultDataError({
    required this.message
}){}
}
class GetResultDataSucssecfuly extends NewsState{}
