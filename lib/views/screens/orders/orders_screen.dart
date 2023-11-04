import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/model/work_orders/work_order_model.dart';
import 'package:vibraguard/viewmodel/work_orders/work_order_view_model.dart';
import 'package:vibraguard/views/screens/orders/add_work_order_modal.dart';
import 'package:vibraguard/views/screens/orders/order_detail_screen.dart';
import 'package:vibraguard/views/screens/orders/work_order_provider.dart';
import 'package:vibraguard/views/shared/components/status_colors_to_badges.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<WorkOrders> ordersList = []; // Lista de ordens de serviço

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedPriority = 'High';

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
      ),
      body: ChangeNotifierProvider(
        create: (_) => WorkOrdersViewModel(),
        child: FutureBuilder<int>(
          future: Provider.of<WorkOrdersViewModel>(context).getIdsLength(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (snapshot.data == null) {
              return Text(R.string.itemNotFound);
            } else {
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

                    return Container(
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        left: 24.0,
                        right: 24.0,
                      ),
                      child: ListView.builder(
                        itemCount: workOrdersList.length,
                        itemBuilder: (context, index) {
                          var workOrder = workOrdersList[index];
                          var workOrderId = workOrder.id;
                          var workOrdersStatus = workOrder.status;
                          var workOrdersTitle = workOrder.title;
                          var workOrderDescription = workOrder.description;
                          var workOrderPriority = workOrder.priority;
                          var workOrderAssigned = workOrder.assignedUserIds;
                          var workOrderCheckList = workOrder.checklist;
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (c) => OrderDetailScreen(
                                        workOrderId: workOrderId!,
                                        workOrdersStatus: '$workOrdersStatus',
                                        workOrderTitle: '$workOrdersTitle',
                                        workOrderDescription:
                                            '$workOrderDescription',
                                        workOrderPriority: '$workOrderPriority',
                                        workOrderAssigned: workOrderAssigned!,
                                        workOrderCheckList: workOrderCheckList!,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  margin: const EdgeInsets.only(
                                    bottom: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        R.colors.lightSecondaryBackgroundColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '$workOrdersTitle',
                                        style: TextStyle(
                                          fontSize: R.fontSize.fs16,
                                          fontWeight: R.fontWeight.normal,
                                          fontFamily:
                                              R.fontFamily.secondaryFont,
                                          color: R.colors.lightCommonTextColor,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 8.0),
                                        decoration: BoxDecoration(
                                          color:
                                              getWorkOrderStatusColorToBackground(
                                                  '$workOrdersStatus'),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                            color: getWorkOrderStatusColorToText(
                                                '$workOrdersStatus'), // Cor da borda
                                            width: 1.0, // Largura da borda
                                          ),
                                        ),
                                        child: Text(
                                          '$workOrdersStatus',
                                          style: TextStyle(
                                            fontSize: R.fontSize.fs12,
                                            fontWeight: R.fontWeight.normal,
                                            fontFamily:
                                                R.fontFamily.secondaryFont,
                                            color:
                                                getWorkOrderStatusColorToText(
                                                    '$workOrdersStatus'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Work Order'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedPriority,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPriority = newValue ?? 'High';
                        });
                      },
                      items: <String>['High', 'Medium', 'Low']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(labelText: 'Priority'),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      // Criar uma nova ordem de serviço a partir dos dados do formulário
                      final newOrder = WorkOrders(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        priority: _selectedPriority,
                        // Preencha os outros campos necessários aqui
                      );

                      // Adicione a nova ordem à lista
                      setState(() {
                        ordersList.add(newOrder);
                      });

                      // Feche o modal
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
