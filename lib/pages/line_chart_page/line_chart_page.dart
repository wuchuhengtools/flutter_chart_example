import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(DateTime(2015, 1), 6),
      ChartData(DateTime(2016, 1), 11),
      ChartData(DateTime(2017, 1), 9),
      ChartData(DateTime(2018, 1), 14),
      ChartData(DateTime(2019, 1), 10),
    ];
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
            title: ChartTitle(
              text: '参考范围: 12~25',
              alignment: ChartAlignment.near,
              textStyle: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            primaryXAxis: DateTimeAxis(
                majorGridLines: MajorGridLines(width: 0),
                dateFormat: DateFormat('MM/d')),
            primaryYAxis: NumericAxis(
              interval: 1,
            ),
            tooltipBehavior: TooltipBehavior(
              enable: true,
              format: 'point.y',
            ),
            series: <ChartSeries<ChartData, DateTime>>[
              // Renders line chart
              SplineSeries<ChartData, DateTime>(
                name: "BMI",
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                enableTooltip: true,
                pointColorMapper: (ChartData data, _) => Colors.red,
                markerSettings: MarkerSettings(isVisible: true),
                animationDuration: 2000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
