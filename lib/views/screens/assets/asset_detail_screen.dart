// ignore_for_file: unused_local_variable

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/model/assets/asset_model.dart';
import 'package:vibraguard/views/screens/assets/assets_screen.dart';

import '../../../core/formaters/date_time_formater.dart';
import '../../../core/formaters/decimal_formater.dart';
import '../../../viewmodel/assets_view_model.dart';
import '../../shared/components/status_colors_to_badges.dart';

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
                  var assetsSensors = assets.sensors;
                  var assetsMetrics = assets.metrics;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 384.0,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.network(
                                "${assets.image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${assets.name}",
                                style: TextStyle(
                                  fontSize: R.fontSize.fs23,
                                  fontWeight: R.fontWeight.normal,
                                  fontFamily: R.fontFamily.primaryFont,
                                  color: R.colors.lightTitleTextColor,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: getStatusColorToBackground(
                                      '${assets.status}'),
                                  borderRadius: BorderRadius.circular(4.0),
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
                                    fontFamily: R.fontFamily.secondaryFont,
                                    color: getStatusColorToText(
                                        '${assets.status}'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 16.0,
                            ),
                            decoration: BoxDecoration(
                              color: R.colors.lightSecondaryBackgroundColor,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Summary of asset"),
                                const SizedBox(height: 16.0),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: R.colors.lightPrimaryBackgroundColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Model"),
                                      Text("${assets.model}"),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Accordion(
                                  paddingListTop: 0,
                                  paddingListBottom: 0,
                                  paddingListHorizontal: 0,
                                  paddingBetweenOpenSections: 0,
                                  paddingBetweenClosedSections: 0,
                                  headerBorderRadius: 4.0,
                                  contentBorderRadius: 4.0,
                                  contentHorizontalPadding: 8,
                                  contentVerticalPadding: 8,
                                  headerPadding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  headerBackgroundColorOpened:
                                      R.colors.lightPrimaryBackgroundColor,
                                  headerBackgroundColor:
                                      R.colors.lightPrimaryBackgroundColor,
                                  contentBackgroundColor:
                                      R.colors.lightPrimaryBackgroundColor,
                                  contentBorderWidth: 0,
                                  headerBorderWidth: 0,
                                  children: [
                                    AccordionSection(
                                      isOpen: true,
                                      rightIcon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: R.colors.lightIconColor,
                                      ),
                                      header: Text(
                                        'Sensors',
                                        style: TextStyle(
                                          color: R.colors.lightTitleTextColor,
                                          fontSize: R.fontSize.fs16,
                                          fontFamily: R.fontFamily.primaryFont,
                                        ),
                                      ),
                                      content: Column(
                                        children: [
                                          if (assetsSensors != null)
                                            for (final sensors in assetsSensors)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: '• ',
                                                      style: TextStyle(
                                                        color: R.colors
                                                            .lightCommonTextColor,
                                                        fontSize: 14,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              '${assets.sensors}',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Accordion(
                                  paddingListTop: 0,
                                  paddingListBottom: 0,
                                  paddingListHorizontal: 0,
                                  paddingBetweenOpenSections: 0,
                                  paddingBetweenClosedSections: 0,
                                  headerBorderRadius: 4.0,
                                  contentBorderRadius: 4.0,
                                  contentHorizontalPadding: 8,
                                  contentVerticalPadding: 8,
                                  headerPadding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  headerBackgroundColorOpened:
                                      R.colors.lightPrimaryBackgroundColor,
                                  headerBackgroundColor:
                                      R.colors.lightPrimaryBackgroundColor,
                                  contentBackgroundColor:
                                      R.colors.lightPrimaryBackgroundColor,
                                  contentBorderWidth: 0,
                                  headerBorderWidth: 0,
                                  children: [
                                    AccordionSection(
                                      isOpen: true,
                                      rightIcon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: R.colors.lightIconColor,
                                      ),
                                      header: Text(
                                        'Metrics',
                                        style: TextStyle(
                                          color: R.colors.lightTitleTextColor,
                                          fontSize: R.fontSize.fs16,
                                          fontFamily: R.fontFamily.primaryFont,
                                        ),
                                      ),
                                      content: Row(
                                        children: [
                                          if (assetsMetrics != null)
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    text: '• ',
                                                    style: TextStyle(
                                                      color: R.colors
                                                          .lightCommonTextColor,
                                                      fontSize: 14,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            'Last uptime: ${DateTimeFormatter.formatDateTime(assets.metrics!.lastUptimeAt!)}',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: '• ',
                                                    style: TextStyle(
                                                      color: R.colors
                                                          .lightCommonTextColor,
                                                      fontSize: 14,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            'Total collects uptime: ${assets.metrics!.totalCollectsUptime}',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: '• ',
                                                    style: TextStyle(
                                                      color: R.colors
                                                          .lightCommonTextColor,
                                                      fontSize: 14,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            'Total uptime: ${DecimalFormatter.formatDecimal(assets.metrics!.totalUptime!)}',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
