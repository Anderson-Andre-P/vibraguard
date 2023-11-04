import 'package:dio/dio.dart';
import 'package:vibraguard/model/work_orders/check_list_model.dart';

class CheckListViewModel {
  final Dio _dio = Dio();

  Future<Checklist> fetchData(int id) async {
    try {
      final response = await _dio.get(
          'https://my-json-server.typicode.com/tractian/fake-api/workorders');
      return Checklist.fromJson(response.data);
    } catch (error) {
      throw error.toString();
    }
  }
}
