import 'package:dio/dio.dart';
import 'package:vibraguard/model/assets/metrics_model.dart';

class MetricsViewModel {
  final Dio _dio = Dio();

  Future<Metrics> fetchData(int id) async {
    try {
      final response = await _dio.get(
          'https://my-json-server.typicode.com/tractian/fake-api/assets/$id');
      return Metrics.fromJson(response.data);
    } catch (error) {
      throw error.toString();
    }
  }
}
