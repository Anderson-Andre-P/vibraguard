// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/model/assets/asset_model.dart';
import 'package:vibraguard/views/screens/assets/assets_screen.dart';

import '../../../viewmodel/assets_view_model.dart';

class AssetDetailScreen extends StatelessWidget {
  final int id;

  const AssetDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final assetsModel = Provider.of<AssetsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Asset details',
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
        create: (_) => AssetsViewModel(),
        child: FutureBuilder<int>(
          future: Provider.of<AssetsViewModel>(context).getIdsLength(),
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

            return FutureBuilder<Assets?>(
                future: Provider.of<AssetsViewModel>(context).fetchData(id + 1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBoxWithCircularProgressIndicatorWidget(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  } else if (snapshot.data == null) {
                    return Text('Item não encontrado para ID: ${id + 1}');
                  } else {
                    final assets = snapshot.data!;
                    return Column(
                      children: [Text("${assets.status}")],
                    );
                  }
                });
          },
        ),
      ),
    );
  }
}
