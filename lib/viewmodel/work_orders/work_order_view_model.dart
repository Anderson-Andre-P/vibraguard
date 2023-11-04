import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/work_orders/work_order_model.dart';

class WorkOrdersViewModel with ChangeNotifier {
  final Dio _dio = Dio();

  List<int> availableIds = [1, 2, 3];

  Future<int> getIdsLength() async {
    await Future.delayed(const Duration(seconds: 1));
    return availableIds.length;
  }

  Future<List<WorkOrders>?> fetchData() async {
    const url =
        'https://my-json-server.typicode.com/tractian/fake-api/workorders';
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;

        final List<WorkOrders> workOrdersList = jsonData
            .map((item) => WorkOrders.fromJson(item as Map<String, dynamic>))
            .toList();

        return workOrdersList;
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
