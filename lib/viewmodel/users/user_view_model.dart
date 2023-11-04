import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UsersViewModel with ChangeNotifier {
  final Dio _dio = Dio();

  List<int> availableIds = [1, 2, 3, 4, 5];

  Future<int> getIdsLength() async {
    await Future.delayed(const Duration(seconds: 1));
    return availableIds.length;
  }

  Future<Map<int, String>> fetchUserNames(List<int> userIds) async {
    try {
      const url = 'https://my-json-server.typicode.com/tractian/fake-api/users';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        final Map<int, String> userNames = {};

        for (dynamic item in jsonData) {
          final Map<String, dynamic> userData = item as Map<String, dynamic>;
          final int userId = userData['id'] as int;
          final String userName = userData['name'] as String;
          userNames[userId] = userName;
        }

        return userNames;
      } else {
        log('Error in the request to $url. Status Code: ${response.statusCode}');
        return {};
      }
    } catch (error) {
      log('Error in the request: $error');
      return {};
    }
  }
}
