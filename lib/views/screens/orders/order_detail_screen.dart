// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/viewmodel/users/user_view_model.dart';
import '../../../model/work_orders/check_list_model.dart';

class OrderDetailScreen extends StatefulWidget {
  final int workOrderId;
  final String workOrdersStatus;
  final String workOrderTitle;
  final String workOrderDescription;
  final String workOrderPriority;
  final List<int> workOrderAssigned;
  final List<Checklist> workOrderCheckList;

  const OrderDetailScreen({
    super.key,
    required this.workOrderId,
    required this.workOrdersStatus,
    required this.workOrderTitle,
    required this.workOrderDescription,
    required this.workOrderPriority,
    required this.workOrderAssigned,
    required this.workOrderCheckList,
  });

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          R.string.workOrderDetails,
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
        create: (_) => UsersViewModel(),
        child: FutureBuilder<Map<int, String>>(
          future: Provider.of<UsersViewModel>(context)
              .fetchUserNames(widget.workOrderAssigned),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No user names found');
            } else {
              final userNamesMap = snapshot.data!;

              return Container(
                margin: const EdgeInsets.only(
                  top: 24.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.workOrderTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${R.string.addWorkOrderInputDescription}: ${widget.workOrderDescription}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${R.string.addWorkOrderInputPriority}: ${widget.workOrderPriority}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${R.string.workOrderStatus}: ${widget.workOrdersStatus}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          R.string.workOrderAssignedTo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    for (final assignedTo in widget.workOrderAssigned)
                      Text(
                          '${R.string.workOrderAssignedTo}: ${userNamesMap[assignedTo] ?? R.string.workOrderUnknowUser}'),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          R.string.workOrderChecklist,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    for (final checklist in widget.workOrderCheckList)
                      CheckboxListTile(
                        title: Text('${checklist.task}'),
                        value: checklist.completed,
                        onChanged: (bool? value) {
                          setState(() {
                            checklist.completed = value;
                          });
                        },
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
