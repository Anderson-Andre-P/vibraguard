import 'package:flutter/material.dart';
import 'package:vibraguard/model/work_orders/work_order_model.dart';

class WorkOrdersProvider with ChangeNotifier {
  List<WorkOrders> ordersList = [];

  void addOrder(WorkOrders newOrder) {
    ordersList.add(newOrder);
    notifyListeners();
  }
}
