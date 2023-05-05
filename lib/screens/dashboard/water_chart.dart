import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class ChartApp extends StatelessWidget {
  const ChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SalesData> chartData = [];

  @override
  void initState() {
    loadSalesData();
    super.initState();
  }

  Future loadSalesData() async {
    final String jsonString = await getJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      chartData.add(SalesData.fromJson(i));
    }
  }

  Future<String> getJsonFromFirebase() async {
    String url =
        "https://watcher-5cf14-default-rtdb.asia-southeast1.firebasedatabase.app/readings.json";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: FutureBuilder(
              future: getJsonFromFirebase(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Half yearly sales analysis'),
                      series: <ChartSeries<SalesData, String>>[
                        LineSeries<SalesData, String>(
                            dataSource: chartData,
                            xValueMapper: (SalesData sales, _) => sales.month,
                            yValueMapper: (SalesData sales, _) => sales.sales,
                            // Enable data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ]);
                } else {
                  return Card(
                    elevation: 5.0,
                    child: SizedBox(
                      height: 100,
                      width: 400,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Retriving Firebase data...',
                                style: TextStyle(fontSize: 20.0)),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                semanticsLabel: 'Retriving Firebase data',
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blueAccent),
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
        ));
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final int sales;

  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['sensor'].toString(),
      parsedJson['risk_level'],
    );
  }
}
