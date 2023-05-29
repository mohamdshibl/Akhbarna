import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
 class DioHelper {
  static Dio? dio;
   static init (){
     dio = Dio(
       BaseOptions(
         baseUrl: 'https://newsapi.org/',
         receiveDataWhenStatusError: true,
       ),
     );
   }

   /// dio get
 static Future<Response> getData({
      required String url,
       Map<String,dynamic>? query,
      }) async
  {
     Response response = await dio!.get(url,queryParameters: query);
     return response;
   }



 }
