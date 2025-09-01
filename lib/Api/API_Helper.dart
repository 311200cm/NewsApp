import 'package:dio/dio.dart';

abstract class Dio_Helper{

 static Dio? _dio;

 static Future<void>Initilization()async{

   _dio=Dio(
     BaseOptions(

       baseUrl: "https://newsapi.org/",
       connectTimeout: (Duration(seconds: 20)),
       receiveDataWhenStatusError: true,
       validateStatus:(status) {

         return (status!<507);
       }
     )
   );
 }

 static Future<Response>GetAllData({
   required String endPoint,
   required Map<String,dynamic> quaryParamter,
})async{
  return await _dio!.get(endPoint,queryParameters: quaryParamter);
 }
}