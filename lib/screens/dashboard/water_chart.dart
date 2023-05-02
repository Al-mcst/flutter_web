import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

var ListName;
Future<String> getDataChart() async {
  http.Response response = await http.get(
    Uri.parse('https://api.comprasextreme.com.br/lista.json'),
  );

  return response.body;
}

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<SampleData> chartData = [];
  List<Chart> tempList = [];
  int userId = 0;
  late Timer timer;
  int counter = 0;

  Future loadSalesData() async {
    final dynamic jsonString = await getDataChart();
    final jsonResponse = json.decode(jsonString);

    FullData fullData = FullData.fromJson(jsonResponse);

    tempList = fullData.chartDataList;

    // clear the chart data list every time before update the list
    chartData = <SampleData>[];

    for (dynamic chart in tempList) {
      chartData.add(SampleData(
          chart.monthDay!, chart.thisMonthOrder!, chart.lastMonthOrder!));
    }
  }

//Timer update values
  void addValue() {
    setState(() {
      loadSalesData();
    });
  }

  @override
  void initState() {
    loadSalesData();
    timer = Timer.periodic(const Duration(minutes: 5), (Timer t) => addValue());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: FutureBuilder(
                future: getDataChart(),
                builder: (context, snapShot) {
                  return SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                          labelPlacement: LabelPlacement.onTicks,
                          labelRotation: 0,
                          majorGridLines: const MajorGridLines(width: 1)),
                      primaryYAxis: NumericAxis(),
                      series: <ChartSeries<SampleData, num>>[
                        AreaSeries<SampleData, num>(
                            gradient: const LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(60, 32, 217, 0.298),
                                ],
                                stops: <double>[
                                  0.9,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                            borderWidth: 2,
                            borderColor: Color.fromARGB(255, 0, 20, 136),
                            borderDrawMode: BorderDrawMode.top,
                            animationDuration: 0,
                            dataSource: chartData,
                            xValueMapper: (SampleData sales, _) =>
                                sales.monthDay,
                            yValueMapper: (SampleData sales, _) =>
                                sales.thisMonthOrder,
                            name: ""),
                        AreaSeries<SampleData, num>(
                            gradient: const LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(24, 179, 215, 0.3),
                                ],
                                stops: <double>[
                                  0.9,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                            borderWidth: 2,
                            borderColor: const Color.fromRGBO(0, 156, 144, 1),
                            borderDrawMode: BorderDrawMode.top,
                            animationDuration: 0,
                            dataSource: chartData,
                            xValueMapper: (SampleData sales, _) =>
                                sales.monthDay,
                            yValueMapper: (SampleData sales, _) =>
                                sales.lastMonthOrder,
                            name: "")
                      ]);
                })),
      ],
    );
  }
}

class SampleData {
  SampleData(this.monthDay, this.thisMonthOrder, this.lastMonthOrder);

  final int monthDay;
  final num thisMonthOrder;
  final num lastMonthOrder;
}

class FullData {
  FullData({required this.chartDataList});

  final List<Chart> chartDataList;

  factory FullData.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['chart'] as List;
    List<Chart> chartList = list.map((i) => Chart.fromJson(i)).toList();
    return FullData(chartDataList: chartList);
  }
}

class Chart {
  Chart(
      {required this.monthDay,
      required this.thisMonthOrder,
      required this.lastMonthOrder});

  final int monthDay;
  final double thisMonthOrder;
  final double lastMonthOrder;

  factory Chart.fromJson(Map<String, dynamic> parsedJson) {
    return Chart(
        monthDay: parsedJson["day"],
        thisMonthOrder: double.parse(parsedJson["this_month_order"]),
        lastMonthOrder: double.parse(parsedJson["last_month_order"]));
  }
}

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// @override
//     Widget build(BuildContext context) {
//         final List<SensorData> chartData = [
//             SensorData('Apr. 5 (1:00)', 35),
//             SensorData('Apr. 5 (1:05)', 28),
//             SensorData('Apr. 5 (1:10)', 34),
//             SensorData('Apr. 5 (1:15)', 32),
//             SensorData('Apr. 5 (1:20)', 40),
//             SensorData('Apr. 5 (1:25)', 35),
//             SensorData('Apr. 5 (1:30)', 28),
//             SensorData('Apr. 5 (1:35)', 34),
//             SensorData('Apr. 5 (1:40)', 32),
//             SensorData('Apr. 5 (1:45)', 40)
//         ];

//         return Scaffold(
//             body: Center(
//                 child: SfCartesianChart(
//                     primaryXAxis: DateTimeAxis(),
//                     series: <ChartSeries>[
//                         // Renders line chart
//                         LineSeries<SensorData, String>(
//                             dataSource: chartData,
//                             xValueMapper: (SensorData distance, _) => distance.day,
//                             yValueMapper: (SensorData distance, _) => distance.distance
//                         )
//                     ]
//                 )
//             )
//         );
//     }

//     class SensorData {
//         SensorData(this.day, this.distance);
//         final String day;
//         final double distance;
//     }