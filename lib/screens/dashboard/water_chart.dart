import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class WaterChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  WaterChart({Key? key}) : super(key: key);

  @override
  _WaterChartState createState() => _WaterChartState();
}

class _WaterChartState extends State<WaterChart> {
  List<SensorData> sensorDataChart = [];

  String currStatus = "";
  final updateRef = FirebaseDatabase.instance.ref('readings');

  @override
  void initState() {
    loadSensorsData();
    super.initState();
  }

  // Future loadSalesData() async {
  //   final String jsonString = await getJsonFromFirebase();
  //   final dynamic jsonResponse = json.decode(jsonString);
  //   for (Map<String, dynamic> i in jsonResponse)
  //     chartData.add(SalesData.fromJson(i));
  // }

  Future loadSensorsData() async {
    final String jsonString = await getJsonFromFirebase();
    final Map jsonResponse = json.decode(jsonString);
    jsonResponse.forEach((key, value) {
      String formattedKey = formatKey(key);
      sensorDataChart.add(SensorData.fromJson(formattedKey, value));
      setState(() {
        currStatus = value['risk_level'];
      });
    });
  }

  String formatKey(String key) {
    final String date = key.split(" ")[0];
    final String time = key.split(" ")[1];

    String addZero(String number) => "0$number";

    String yearDate = date.split("-")[0];
    String monthDate = date.split("-")[1];
    if (monthDate.length == 1) {
      monthDate = addZero(monthDate);
    }
    String dayDate = date.split("-")[2];
    if (dayDate.length == 1) {
      dayDate = addZero(dayDate);
    }

    String hourTime = time.split(":")[0];
    if (hourTime.length == 1) {
      hourTime = addZero(hourTime);
    }
    String minuteTime = time.split(":")[1];
    if (minuteTime.length == 1) {
      minuteTime = addZero(minuteTime);
    }
    String secondTime = time.split(":")[2];
    if (secondTime.length == 1) {
      secondTime = addZero(secondTime);
    }

    return "$yearDate-$monthDate-$dayDate $hourTime:$minuteTime:$secondTime";
  }

  Future<String> getJsonFromFirebase() async {
    String url =
        "https://watcher-5cf14-default-rtdb.asia-southeast1.firebasedatabase.app/readings.json";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Syncfusion Flutter chart'),
//         ),
//         body: Center(
//           child: FutureBuilder(
//               future: getJsonFromFirebase(),
//               builder: (context, snapShot) {
//                 if (snapShot.hasData) {
//                   return SfCartesianChart(
//                       primaryXAxis: DateTimeAxis(),
//                       // Chart title
//                       title: ChartTitle(text: 'Sensor Readings'),
//                       series: <ChartSeries>[
//                         LineSeries<SensorData, DateTime>(
//                             dataSource: sensorDataChart,
//                             xValueMapper: (SensorData sensor, _) =>
//                                 sensor.dateTime,
//                             yValueMapper: (SensorData sensor, _) =>
//                                 sensor.sensorData,
//                             // Enable data label
//                             dataLabelSettings:
//                                 DataLabelSettings(isVisible: true))
//                       ]);
//                 } else {
//                   return Card(
//                     elevation: 5.0,
//                     child: Container(
//                       height: 100,
//                       width: 400,
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text('Retriving Firebase data...',
//                                 style: TextStyle(fontSize: 20.0)),
//                             Container(
//                               height: 40,
//                               width: 40,
//                               child: CircularProgressIndicator(
//                                 semanticsLabel: 'Retriving Firebase data',
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                     Colors.blueAccent),
//                                 backgroundColor: Colors.grey[300],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//               }),
//         ));
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Current Status: $currStatus'),
        ),
        body: Center(
          child: StreamBuilder(
              stream: updateRef.onValue,
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  debugPrint("updated");
                  sensorDataChart = [];
                  // loadSensorsData();
                  final sensorData = Map<dynamic, dynamic>.from(
                      (snapShot.data!).snapshot.value as Map<dynamic, dynamic>);
                  sensorData.forEach(
                    (key, value) {
                      String formattedKey = formatKey(key);
                      debugPrint("added: $formattedKey");
                      sensorDataChart
                          .add(SensorData.fromJson(formattedKey, value));
                      currStatus = value['risk_level'];
                    },
                  );
                  // _updateData(snapShot.data!);
                  return SfCartesianChart(
                      primaryXAxis: DateTimeAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Sensor Readings'),
                      series: <ChartSeries>[
                        LineSeries<SensorData, DateTime>(
                            dataSource: sensorDataChart,
                            xValueMapper: (SensorData sensor, _) =>
                                sensor.dateTime,
                            yValueMapper: (SensorData sensor, _) =>
                                sensor.sensorData,
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]);
                } else {
                  return Card(
                    elevation: 5.0,
                    child: Container(
                      height: 100,
                      width: 300,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Retriving Firebase data...',
                                style: TextStyle(fontSize: 20.0)),
                            Container(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                semanticsLabel: 'Retriving Firebase data',
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blueAccent),
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  SystemChrome
                                      .setApplicationSwitcherDescription(
                                          ApplicationSwitcherDescription(
                                    label: "'Current Status: $currStatus'",
                                    primaryColor: Theme.of(context)
                                        .primaryColor
                                        .value, // This line is required
                                  ));
                                },
                                child: const Text("Update")),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
        ));
  }

  // void _updateData(dynamic snapshot) {
  //   DataSnapshot dataValues = snapshot;
  //   Map<dynamic, dynamic> values = dataValues.value;
  //   sensorDataChart.add(SensorData.fromJson(snapshot, value));
  // }
}

// class SalesData {
//   SalesData(this.month, this.sales);

//   final String month;
//   final int sales;

//   factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
//     return SalesData(
//       parsedJson['month'].toString(),
//       parsedJson['sales'],
//     );
//   }
// }

class SensorData {
  SensorData(this.dateTime, this.sensorData, this.riskLevel);

  final DateTime dateTime;
  final int sensorData;
  final String riskLevel;

  factory SensorData.fromJson(dynamic key, dynamic value) {
    return SensorData(
      DateTime.parse(key),
      int.parse(value['sensor']),
      value['risk_level'].toString(),
    );
  }
}
