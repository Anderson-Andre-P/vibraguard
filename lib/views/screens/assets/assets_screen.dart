import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/model/assets/asset_model.dart';
import 'package:vibraguard/viewmodel/assets/assets_view_model.dart';
import 'package:vibraguard/views/screens/assets/asset_detail_screen.dart';
import 'package:vibraguard/views/screens/qrcode/barcode_scanner_window.dart';
import 'package:vibraguard/views/shared/theme/config.dart';

import '../../shared/components/status_colors_to_badges.dart';

class AssetsScreen extends StatefulWidget {
  final int id;

  const AssetsScreen({super.key, required this.id});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();

  void dispose() {
    // FlutterNativeSplash.remove();
  }
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: R.colors.lightPrimaryBackgroundColor,
        elevation: 1,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                color: R.colors.lightCommonTextColor,
                fontFamily: R.fontFamily.primaryFont,
                fontSize: R.fontSize.fs14,
                fontWeight: R.fontWeight.normal,
              ),
            ),
            Text(
              "Anderson André",
              style: TextStyle(
                color: R.colors.lightTitleTextColor,
                fontFamily: R.fontFamily.primaryFont,
                fontSize: R.fontSize.fs19,
                fontWeight: R.fontWeight.normal,
              ),
            )
          ],
        ),
        leading: Icon(Icons.account_circle_rounded,
            color: R.colors.lightIconColor, size: 50.0),
        actions: [
          IconButton(
            onPressed: () => {currentTheme.switchTheme()},
            icon: Icon(Icons.notifications, color: R.colors.lightIconColor),
          ),
          IconButton(
            onPressed: () {
              // currentTheme.switchTheme();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (c) => const BarcodeScannerWithScanWindow(),
                ),
              );
            },
            icon: Icon(Icons.qr_code_scanner, color: R.colors.lightIconColor),
          ),
          // Consumer<Mytheme>(
          //   builder: (context, themeProvider, child) {
          //     return IconButton(
          //       onPressed: () {
          //         themeProvider.switchTheme();
          //       },
          //       icon: Icon(Icons.lightbulb_outline,
          //           color: R.colors.lightIconColor),
          //     );
          //   },
          // )
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
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Defina o número de colunas aqui
                ),
                itemCount: length,
                itemBuilder: (ctx, index) {
                  return FutureBuilder<Assets?>(
                    future: Provider.of<AssetsViewModel>(context)
                        .fetchData(index + 1),
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

                        return GestureDetector(
                          onTap: () {
                            // Navegue para a tela detalhada com base no ID do ativo
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (c) => AssetDetailScreen(id: index),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.all(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: 134.0,
                                    child: Image.network(
                                      "${assets.image}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 44.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 72,
                                          child: Text(
                                            '${assets.name}',
                                            style: TextStyle(
                                              fontSize: R.fontSize.fs14,
                                              fontWeight: R.fontWeight.normal,
                                              fontFamily:
                                                  R.fontFamily.secondaryFont,
                                              color:
                                                  R.colors.lightCommonTextColor,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 8.0),
                                          decoration: BoxDecoration(
                                            color: getStatusColorToBackground(
                                                '${assets.status}'),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color: getStatusColorToText(
                                                  '${assets.status}'), // Cor da borda
                                              width: 1.0, // Largura da borda
                                            ),
                                          ),
                                          child: Text(
                                            '${assets.status}',
                                            style: TextStyle(
                                              fontSize: R.fontSize.fs12,
                                              fontWeight: R.fontWeight.normal,
                                              fontFamily:
                                                  R.fontFamily.secondaryFont,
                                              color: getStatusColorToText(
                                                  '${assets.status}'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              );
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
