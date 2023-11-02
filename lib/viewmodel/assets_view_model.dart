import 'dart:developer';

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
    final url =
        'https://my-json-server.typicode.com/tractian/fake-api/assets/$id';
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return Assets.fromJson(data);
      } else {
        log('Erro na solicitação para $url. Status Code: ${response.statusCode}');
        return null; // Retornar null em caso de erro ou item não encontrado
      }
    } catch (error) {
      log('Erro na solicitação para $url: $error');
      throw error.toString();
    }
  }
}
