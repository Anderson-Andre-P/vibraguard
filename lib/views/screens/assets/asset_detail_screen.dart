// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vibraguard/core/helpers/resources.dart';
import 'package:vibraguard/model/assets/asset_model.dart';
import 'package:vibraguard/model/assets/health_history_model.dart';
import 'package:vibraguard/viewmodel/assets/assets_view_model.dart';
import 'package:vibraguard/views/screens/assets/assets_screen.dart';
import '../../../core/formaters/date_time_formater.dart';
import '../../../core/formaters/decimal_formater.dart';
import '../../../core/formaters/time_stamp_formater.dart';
import '../../shared/components/status_colors_to_badges.dart';

class AssetDetailScreen extends StatelessWidget {
  final int id;

  const AssetDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final assetsModel = Provider.of<AssetsViewModel>(context);

    List<ChartData> getGraphicData(List<HealthHistory> assetsHealthyHistory) {
      List<ChartData> chartData = [];

      for (var healthyHistory in assetsHealthyHistory) {
        String status = healthyHistory.status!;
        Color color;
        double index;

        String time = formatTimestamp(healthyHistory.timestamp!);

        if (status == 'inAlert') {
          color = R.colors.lightCommonTextColor;
          index = 4;
        } else if (status == 'unplannedStop') {
          color = R.colors.lightCommonTextColor;
          index = 3;
        } else if (status == 'inOperation') {
          color = R.colors.lightCommonTextColor;
          index = 2;
        } else if (status == 'inDowntime') {
          color = R.colors.lightCommonTextColor;
          index = 1;
        } else {
          color = R.colors.lightCommonTextColor;
          index = 0;
        }
        color = R.colors.lightPrimaryColor;

        chartData.add(ChartData(time, index, color));
      }
      return chartData;
    }

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
                  var assetsHealthyHistory = assets.healthHistory;
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
                                      Text(
                                        "${assets.model}",
                                        style: TextStyle(
                                          color: R.colors.lightTitleTextColor,
                                          fontSize: R.fontSize.fs16,
                                          fontFamily: R.fontFamily.primaryFont,
                                        ),
                                      ),
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: R.colors.lightPrimaryBackgroundColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 0,
                                    right: 16.0,
                                    left: 16.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Health history",
                                        style: TextStyle(
                                          color: R.colors.lightTitleTextColor,
                                          fontSize: R.fontSize.fs16,
                                          fontFamily: R.fontFamily.primaryFont,
                                        ),
                                      ),
                                      SfCartesianChart(
                                        isTransposed: false,
                                        backgroundColor: R
                                            .colors.lightPrimaryBackgroundColor,
                                        primaryXAxis: CategoryAxis(
                                          majorGridLines: const MajorGridLines(
                                            width: 0,
                                          ),
                                          labelStyle: TextStyle(
                                            color:
                                                R.colors.lightCommonTextColor,
                                            fontWeight: R.fontWeight.normal,
                                          ),
                                          borderColor:
                                              R.colors.lightCommonTextColor,
                                          minimum: 0,
                                          maximum: 4.1,
                                        ),
                                        primaryYAxis: NumericAxis(
                                          majorGridLines: const MajorGridLines(
                                            width: 1,
                                            dashArray: <double>[5, 5],
                                          ),
                                          maximum: 4.1,
                                          minimum: 0,
                                          interval: 1,
                                          axisLabelFormatter:
                                              (axisLabelRenderArgs) {
                                            axisLabelRenderArgs.value;
                                            return getYValueToChart(
                                                axisLabelRenderArgs.value);
                                          },
                                        ),
                                        series: <ChartSeries>[
                                          SplineSeries<ChartData, String>(
                                              width: 3,
                                              color: R.colors.lightPrimaryColor,
                                              dataSource: getGraphicData(
                                                  assetsHealthyHistory!),
                                              pointColorMapper:
                                                  (ChartData data, _) =>
                                                      data.color,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                                        ],
                                      ),
                                    ],
                                  ),
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

  getYValueToChart(value) {
    var textSize = 16.0;

    if (value == 4) {
      return ChartAxisLabel(
          'In Alert',
          TextStyle(
              color: R.colors.lightCommonTextColor, fontSize: R.fontSize.fs10));
    } else if (value == 3) {
      return ChartAxisLabel(
          'Unplanned Stop',
          TextStyle(
              color: R.colors.lightCommonTextColor, fontSize: R.fontSize.fs10));
    } else if (value == 2) {
      return ChartAxisLabel(
          'In Operation',
          TextStyle(
              color: R.colors.lightCommonTextColor, fontSize: R.fontSize.fs10));
    } else if (value == 1) {
      return ChartAxisLabel(
          'In Downtime',
          TextStyle(
              color: R.colors.lightCommonTextColor, fontSize: R.fontSize.fs10));
    } else {
      return ChartAxisLabel(
          'Offline',
          TextStyle(
              color: R.colors.lightCommonTextColor, fontSize: R.fontSize.fs10));
    }
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
