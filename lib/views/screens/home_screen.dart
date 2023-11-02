import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/model/assets/asset_model.dart';
import 'package:vibraguard/viewmodel/assets_view_model.dart';

class HomeScreen extends StatefulWidget {
  final int id;

  const HomeScreen({super.key, required this.id});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  void dispose() {
    // FlutterNativeSplash.remove();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.string.titleOfApp),
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
              final List<Widget> assetWidgets = [];
              for (int index = 1; index <= length; index++) {
                assetWidgets.add(
                  FutureBuilder<Assets?>(
                    future:
                        Provider.of<AssetsViewModel>(context).fetchData(index),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SizedBoxWithCircularProgressIndicatorWidget(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Erro: ${snapshot.error}');
                      } else if (snapshot.data == null) {
                        return Text('Item não encontrado para ID: $index');
                      } else {
                        final assets = snapshot.data!;
                        final healthHistories = assets.healthHistory;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID: ${assets.id}'),
                            Image.network("${assets.image}"),

                            if (healthHistories != null)
                              for (final history in healthHistories)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Status: ${history.status}'),
                                    Text('Timestamp: ${history.timestamp}'),
                                  ],
                                ),
                            // Outros campos de Assets que você deseja exibir
                          ],
                        );
                      }
                    },
                  ),
                );
                if (index < length) {
                  assetWidgets.add(
                    const SizedBox(
                      height: 16.0,
                    ),
                  );
                }
              }
              return ListView(children: assetWidgets);
            }
          },
        ),
      ),
    );
  }
}

class SizedBoxWithCircularProgressIndicatorWidget extends StatelessWidget {
  const SizedBoxWithCircularProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.0,
      height: 48.0,
      child: CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        strokeWidth: 4,
        backgroundColor: Colors.grey,
        value: null,
        semanticsLabel: R.string.loading,
        semanticsValue: R.string.loading,
      ),
    );
  }
}
