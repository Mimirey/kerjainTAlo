import 'package:dio/dio.dart';
import 'package:projectquranmu_application/configs/storage_service.dart';

class ApiClient {
  static final Dio dio= Dio(
    BaseOptions(
      baseUrl: 'https://bubbliest-madyson-exhilaratedly.ngrok-free.dev/api/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),

      headers: {
        'Accept': 'application/json',
      },
    )

  )
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options,handler) async{
        final token = await StorageService.getToken();

        if (token != null) {
          options.headers[
            'Authorization'
          ] = 'Bearer $token';
        }

        return handler.next(options);
      }
    )
  );
}