import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/model/work_orders/work_order_model.dart';
import 'package:vibraguard/viewmodel/work_orders/work_order_view_model.dart';
import 'package:vibraguard/views/screens/assets/assets_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Work Orders',
          style: ThemeData.light().textTheme.bodyLarge,
        ),
        backgroundColor: R.colors.lightPrimaryBackgroundColor,
        elevation: 1,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context, true)},
          icon: Icon(Icons.arrow_back, color: R.colors.lightIconColor),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.notifications, color: R.colors.lightIconColor),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => WorkOrdersViewModel(),
        child: FutureBuilder<int>(
          future: Provider.of<WorkOrdersViewModel>(context).getIdsLength(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBoxWithCircularProgressIndicatorWidget(),
              );
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (snapshot.data == null) {
              return Text(R.string.itemNotFound);
            } else {
              final int length = snapshot.data!;
            }

            return FutureBuilder<List<WorkOrders>?>(
              future: Provider.of<WorkOrdersViewModel>(context).fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('Nenhum item encontrado.');
                } else {
                  final workOrdersList = snapshot.data!;
                  var workOrdersUnitId = workOrdersList[0].assetId;
                  return Center(
                    child: Text('$workOrdersUnitId'),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
