import 'package:dio/dio.dart';
import 'package:vibraguard/model/assets/health_history_model.dart';

class HealthyHistoryViewModel {
  final Dio _dio = Dio();

  Future<HealthHistory> fetchData(int id) async {
    try {
      final response = await _dio.get(
          'https://my-json-server.typicode.com/tractian/fake-api/assets/$id');
      return HealthHistory.fromJson(response.data);
    } catch (error) {
      throw error.toString();
    }
  }
}
