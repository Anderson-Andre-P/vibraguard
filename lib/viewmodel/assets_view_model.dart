import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vibraguard/model/assets/asset_model.dart';

class AssetsViewModel with ChangeNotifier {
  final Dio _dio = Dio();

  List<int> availableIds = [1, 2, 3, 4, 5, 6];

  Future<int> getIdsLength() async {
    await Future.delayed(const Duration(seconds: 1));
    return availableIds.length;
  }

  Future<Assets?> fetchData(int id) async {
    try {
      final response = await _dio.get(
          'https://my-json-server.typicode.com/tractian/fake-api/assets/$id');
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return Assets.fromJson(data);
      } else {
        return null; // Retornar null em caso de erro ou item não encontrado
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
