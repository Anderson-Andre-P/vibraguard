import 'package:dio/dio.dart';

BaseOptions _baseOptions = BaseOptions(
  baseUrl: 'https://my-json-server.typicode.com/tractian/fake-api',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
);

final Dio dio = Dio(_baseOptions);
